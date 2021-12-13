<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:dc11="http://purl.org/dc/elements/1.1/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:arche="https://vocabs.acdh.oeaw.ac.at/schema#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei my" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <!-- ########### html head ########### -->
    <xsl:import href="template_imports/add_base_scripts_and_styles_to_head.xsl"/>
    <xsl:import href="template_imports/add_metadata_to_head.xsl"/>
    
    <!-- ########### fundament ########### -->
    <xsl:import href="template_imports/add_footer_to_body.xsl"/>
    <xsl:import href="template_imports/tei-geo.xsl"/>
    
    <!-- ########### content metadata ########### -->
    <xsl:import href="template_imports/add_modal-metadata.xsl"/>
    
    <!-- ########### general import ########### -->
    <xsl:import href="template_imports/tei-title.xsl"/>
    <xsl:import href="template_imports/tei-idno.xsl"/>
    <xsl:import href="template_imports/tei-rs-modal.xsl"/>    
    <xsl:import href="template_imports/tei-persName.xsl"/>
    <xsl:import href="template_imports/tei-date.xsl"/>
    <xsl:import href="template_imports/tei-note.xsl"/>
    <xsl:import href="template_imports/tei-entities.xsl"/>
    <xsl:import href="template_imports/tei-list.xsl"/>
    <xsl:import href="template_imports/add_navbar_to_body.xsl"/>
    <!-- ########### general import for project folder content_block ########### -->
    <xsl:import href="template_imports/add_header-navigation-custom-title.xsl"/>
    <xsl:import href="template_imports/add_html_xsl_data_transform_info.xsl"/>
    <xsl:import href="template_imports/tei-note-footnote.xsl"/>
    <xsl:import href="template_imports/tei-footnotes-citation.xsl"/>
    <xsl:import href="template_imports/api_download_result.xsl"/>
    <xsl:import href="template_imports/search.xsl"/>
    <xsl:param name="header-nav-item-info">true</xsl:param>

    <!-- ########### scripts ########### -->
    <xsl:import href="template_imports/add_script_for_datatable_and_leaflet.xsl"/>
    
    <!-- ############################################## -->
    <!-- ########### project specific imports ######### -->
    <!-- ############################################## -->
    <!-- ############# START HERE ##################### -->
    <!-- ############################################## -->
    <xsl:import href="arche_templates/root_col.xsl"/>
    <xsl:import href="thun/navbar-links.xsl"/>
    <xsl:import href="thun/content_block.xsl"/>
    <xsl:import href="thun/content_block_project.xsl"/>    
    <xsl:import href="thun/content_block_listorg.xsl"/>
    <xsl:import href="thun/content_block_listperson.xsl"/>
    <xsl:import href="thun/content_block_listplace.xsl"/>
    
    <!-- ########### parameters ########### -->
    <xsl:param name="document">
        <xsl:value-of select="tei:TEI/@xml:id"/>
    </xsl:param>
    <xsl:param name="app-name">tei2arche</xsl:param>
    <xsl:param name="transform">?format=customTei2Html</xsl:param>
    <xsl:param name="collection-name">THUN</xsl:param>
    <xsl:param name="path2source"><!--https://service4tei.acdh-dev.oeaw.ac.at/?tei=--></xsl:param>
    <xsl:param name="iiif">https://iiif.acdh.oeaw.ac.at/thun/</xsl:param>
    <xsl:param name="signatur">
        <xsl:value-of select=".//tei:institution/text()"/>, <xsl:value-of select=".//tei:repository[1]/text()"/>, <xsl:value-of select=".//tei:msIdentifier/tei:idno[1]/text()"/>
    </xsl:param>
    <xsl:param name="tei-source">
        <xsl:value-of select="concat($baseURL,'/',$document)"/>
    </xsl:param>
    <xsl:param name="arche-id">https://id.acdh.oeaw.ac.at/thun/editions/</xsl:param>
    <xsl:param name="project-xsl">thun2arche.xsl</xsl:param>
    <xsl:param name="image-url">https://arche-thumbnails.acdh.oeaw.ac.at/id.acdh.oeaw.ac.at/thun?width=200</xsl:param>
    <xsl:param name="navbar-color">navbar-dark bg-dark</xsl:param>
    <xsl:param name="baseURL" select="//@xml:base"/>
    <xsl:param name="title" select="//tei:titleStmt//tei:title[@type='label']"/>
    <xsl:param name="next" select="//@next"/>
    <xsl:param name="prev" select ="//@prev"/>
    <xsl:param name="arche_root_col_url">https://arche.acdh.oeaw.ac.at/api/108253</xsl:param>
    <xsl:param name="arche_child_col_url">https://arche.acdh.oeaw.ac.at/api/108254</xsl:param>
    
    <!-- ######################################################### --> 
    <!-- ##################### html structure #################### --> 
    <!-- ######################################################### --> 
    
    <xsl:template match="/">
        <html>
            <!-- ############### head ################ -->
            <head>
                <xsl:call-template name="add_metadata_to_head"/>
                <xsl:call-template name="add_base_scripts_and_styles"/>
                <title>
                    <xsl:value-of select="$title"/>
                </title>
                <!-- ************** project specific static css stylesheet ************** -->
                <style type="text/css">
                    .container{
                        max-width:100%;
                    }
                    h3{
                        padding: .5em;
                        text-align: center;
                        text-align: left !important;
                    }
                    .text{
                        padding:.5em;
                        line-height: 2em;
                        display: block;
                        text-align: justify;
                        }
                    .text-event{
                        text-align: left;
                        padding: 0 3em 0 3em !important;
                        display: block;
                        font-size: 14px;
                        }
                    .text-event li{
                        list-style: none;
                        margin-top: .5em;
                        }
                    .text-modal{
                        padding: 0 3em 0 3em !important;
                        line-height: 2em;
                        display: block;
                        text-align:justify;
                        font-size: 14px;
                        }
                    .first{
                        border-top: 1px solid lightgrey;
                        text-transform: capitalize;
                        padding-top: 1em !important;
                        }
                    .keys{
                        margin: 0.5em;
                         }
                    .person{
                        font-weight:bold;
                        font-color:auto;
                        }
                    .place-org{
                        font-weight:bold;
                        font-color:auto;
                        }
                    .card h3::after {
                        content: '';
                        display: block;
                        width: 50px;
                        border-top: 5px solid;
                        margin-top: 15px;
                        margin-bottom: 15px;
                        }
                     h2 .table{
                        text-align: left;
                        font-size: 14px;
                        }
                    .badge{
                        margin-left: 1em;
                        font-size: 16px;
                    }
                    .footnotes{
                        margin-top:1em;
                    }
                </style>
                <!--<script src="https://unpkg.com/arche-api@1.2.0/lib/arche-api.min.js"></script>-->
                <!--<script src="/home/daniel/Documents/arche_api/lib/arche-api.min.js"></script>-->
            </head>
            <!-- ############### body ################ -->
            <body>
                <div class="hfeed site" id="page">
                    <!-- ****************** navbar ****************** -->
                 
                    <!-- ******************* The Navbar Area ******************* -->
                    <xsl:call-template name="navbar"/>
                                       
                    <div class="wrapper" id="single-wrapper">
                        
                        <!-- ************ bootstrap tab-content start ************* -->
                        <div class="tab-content">
  
                            <!-- ****************** tei text/body ****************** -->
                            <!-- ****************** api result ****************** -->
                            <xsl:call-template name="api_download_result"/>
                            
                            <!-- ****************** search result ****************** -->
                            <xsl:call-template name="search"/>
                            
                            <!-- ****************** content cards ****************** --> 
                            
                            <xsl:call-template name="cards"/>                 
                            
                            <xsl:call-template name="cards-project"/>     
                            
                            <xsl:call-template name="cards-persons"/>  
                            
                            <xsl:call-template name="cards-orgs"/>  
                            
                            <xsl:call-template name="cards-places"/> 
                            
                        </div><!-- bootstrap end -->
                        <div class="container fade">
                            <ul>
                                <li id="root_col_url"><xsl:value-of select="$arche_root_col_url"/></li>
                                <li id="child_col_url"><xsl:value-of select="$arche_child_col_url"/></li>
                                <li id="tei_source"><xsl:value-of select="$baseURL"/></li>
                                <li id="project-xsl"><xsl:value-of select="$project-xsl"/></li>
                            </ul>
                        </div>
                        <xsl:call-template name="modal-metadata"/>
                    </div><!-- #single-wrapper -->                    
                    <!-- ******************* footer ******************* -->
                    <xsl:call-template name="fundament-footer"/>
                    
                </div><!-- hfeed site end -->
                <xsl:call-template name="dataTable-base-leaflet"/>
                <!-- ****************** static scripts ****************** -->                
                <script type="text/javascript" src="../static/js/change_color_theme.js"/>
                <script type="text/javascript" src="../static/js/language-switcher-generic.js"/>                 
                <script type="text/javascript" src="../static/js/n3_parsing_arche.js"/> 
                <script type="text/javascript" src="../static/js/arche_api_searchText.js"/>
                <script type="text/javascript" src="../static/js/n3_parsing_arche_metadata.js"/>
                <script type="text/javascript" src="../static/js/saxon-js/SaxonJS2.rt.js"/>
                <script type="text/javascript" src="../static/js/saxon-js-register.js"/>
            </body>
        </html>        
    </xsl:template>
    
</xsl:stylesheet>