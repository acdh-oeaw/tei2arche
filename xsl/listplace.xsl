<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:dc="http://purl.org/dc/terms/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:sparql="http://www.w3.org/2005/sparql-results#"
    xmlns:my="http://test.org/"
    xmlns:arche="https://vocabs.acdh.oeaw.ac.at/schema#"
    exclude-result-prefixes="#all" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <!-- ########### html head ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_base_scripts_and_styles_to_head.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_metadata_to_head.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_html_xsl_data_transform_info.xsl"/>
   
    <!-- ########### fundament ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_footer_to_body.xsl"/>
    
    <!-- ########### ARCHE ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/arche_templates/root_col.xsl"/>
    
    <!-- ########### content metadata ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-generic-teiHeader-structured.xsl"/>
    
    <!-- ########### container for script ######### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-geo.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_modal-metadata.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_navbar_to_body.xsl"/>
    
    <!-- ########### ARCHE MD ########### -->
   
    <!-- ########### content ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/api_download_result.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/search.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_header-navigation-custom-title.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-idno.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-placeName.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-name.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-persName.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-date.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-time.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-entities.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-list.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-listPlace.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_modal_custom.xsl"/>
  
    <!-- ########### scripts ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_script_for_datatable_and_leaflet.xsl"/>
    
    <!-- ############################################## -->
    <!-- ########### project specific imports ######### -->
    <!-- ############################################## -->
    <!-- ############# START HERE ##################### -->
    <!-- ############################################## -->    
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/thun/content_block_project.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/thun/content_block_listplace.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/thun/navbar-links.xsl"/>
    
    <!-- ########### parameters ########### -->
    <xsl:param name="document">
        <xsl:value-of select="tei:TEI/@xml:id"/>
    </xsl:param>
    <xsl:param name="app-name"/>
    <xsl:param name="collection-name">THUN</xsl:param>
    <xsl:param name="path2source"><!--https://service4tei.acdh-dev.oeaw.ac.at/?tei=--></xsl:param>
    <xsl:param name="ref"/>
    <xsl:param name="currentIx"/>
    <xsl:param name="amount"/>
    <xsl:param name="progress"/>
    <xsl:param name="iiif">https://iiif.acdh.oeaw.ac.at/thun/</xsl:param>
    <xsl:param name="signatur">
        <xsl:value-of select=".//tei:institution/text()"/>, <xsl:value-of select=".//tei:repository[1]/text()"/>, <xsl:value-of select=".//tei:msIdentifier/tei:idno[1]/text()"/>
    </xsl:param>
    <xsl:param name="tei-source">
        <xsl:value-of select="concat($baseURL,'/',$document)"/>
    </xsl:param>
    <xsl:param name="project-xsl">thun2arche.xsl</xsl:param>
    <xsl:param name="image-url">https://arche-thumbnails.acdh.oeaw.ac.at/id.acdh.oeaw.ac.at/thun?width=200</xsl:param>
    <xsl:param name="navbar-color">navbar-dark bg-dark</xsl:param>
    <xsl:param name="baseURL" select="//@xml:base"/>
    <xsl:param name="title" select="//tei:titleStmt//tei:title[@type='label']"/>
    <xsl:param name="next" select="//@next"/>
    <xsl:param name="prev" select ="//@prev"/>
    <xsl:param name="arche_root_col_url">https://arche.acdh.oeaw.ac.at/api/108253</xsl:param>
    <xsl:param name="arche_child_col_url">https://arche.acdh.oeaw.ac.at/api/108254</xsl:param>
    <xsl:param name="transform">?format=customTei2Html</xsl:param>
    <xsl:param name="header-nav-item-info">true</xsl:param>
    
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
                    .card h3::after {
                        content: '';
                        display: block;
                        width: 50px;
                        border-top: 5px solid;
                        margin-top: 15px;
                        margin-bottom: 15px;
                    }
                    .text-modal {
                        padding: 0 3em 0 3em !important;
                        line-height: 2em;
                        display: block;
                        text-align: justify;
                        font-size: 14px;
                    }
                    .keys {
                        margin: 0.5em;
                    }
                    h2 .table {
                        text-align: left;
                        font-size: 14px;
                    }
                    .nav-a {
                        color: #fff;
                    }                    
                </style>

            </head>
            <!-- ############### body ################ -->
            <body>
                <div class="hfeed site" id="page">
                    <!-- ******************* The Navbar Area ******************* -->
                    <xsl:call-template name="navbar"/>
                    <!-- .wrapper-navbar end -->
                                   
                    <!-- ****************** adding a container for maps ****************** -->
                    <xsl:call-template name="add_map_container"/>
                    
                    <div class="wrapper" id="single-wrapper">
                        
                        <!-- ************ bootstrap tab-content start ************* -->
                        <div class="tab-content">
                            <!-- ****************** search result ****************** -->
                            <xsl:call-template name="api_download_result"/>
                            
                            <!-- ****************** search result ****************** -->
                            <xsl:call-template name="search"/>
                            
                            <!-- ****************** body tamples ****************** -->
                            <xsl:call-template name="cards-places"/>
                            
                            <!-- ****************** project information ****************** -->
                            <xsl:call-template name="cards-project"/>
                             
                            
                        </div><!-- bootstrap end -->
                        
                        <!-- ***************** creating a modal window ************* -->
                        <xsl:call-template name="modal-metadata"/>
                        <div class="container fade">
                            <ul>
                                <li id="root_col_url"><xsl:value-of select="$arche_root_col_url"/></li>
                                <li id="child_col_url"><xsl:value-of select="$arche_child_col_url"/></li>
                                <li id="tei_source"><xsl:value-of select="$baseURL"/></li>
                                <li id="project-xsl"><xsl:value-of select="$project-xsl"/></li>
                            </ul>
                        </div>
                    </div><!-- #single-wrapper -->
                    
                    <!-- ******************* footer ******************* -->
                    <xsl:call-template name="fundament-footer"/>
                
                </div><!-- hfeed site end -->
                <!-- ****************** static scripts ****************** -->
                <xsl:call-template name="dataTable-base-leaflet"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/datatable_leaflet_combination.js"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/change_color_theme.js"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/jstree_arche.js"/>   
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/language-switcher-generic.js"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/n3_parsing_arche.js"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/arche_api_searchText.js"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/n3_parsing_arche_metadata.js"/>
            </body>
        </html>        
    </xsl:template>
    <!-- ####################################### ################## --> 
    <!-- ################## body templates start ################## --> 
    <!-- ####################################### ################## --> 
    
    <!-- create project specific templates here -->

</xsl:stylesheet>