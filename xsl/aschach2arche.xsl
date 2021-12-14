<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>

    <!-- ########### html head ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_base_scripts_and_styles_to_head.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_metadata_to_head.xsl"/>   
    
    <!-- ########### fundament (footer/navigation) ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_footer_to_body.xsl"/>
    
    <!-- ########### general imports ########### -->    
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_modal-metadata.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-geo.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-facsimile.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/search.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-head-title-nav.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-title.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-rs-modal.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-placeName.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-name.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-persName.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-date.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-time.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-entities.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-ref.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-choice.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_navbar_to_body.xsl"/>
    <!-- ############### general imports for content_block template ################# -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_header-navigation-custom-title.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_html_xsl_data_transform_info.xsl"/>
    
    <!-- ########### scripts ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_script_for_datatable_and_leaflet.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_script_for_images_openSeaDragon.xsl"/>
    
    <!-- ########### arche root col and child col download ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/arche_templates/root_col.xsl"/>    
    
    <!-- ############################################## -->
    <!-- ########### project specific imports ######### -->
    <!-- ############################################## -->
    <!-- ############# START HERE ##################### -->
    <!-- ############################################## -->    
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/aschach/content_block.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/aschach/navbar-links.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/content_block_project.xsl"/>
    
    <!-- ########### parameters ########### -->
    <xsl:param name="document">
        <xsl:value-of select="tei:TEI/@xml:id"/>
    </xsl:param>
    <xsl:param name="transform">?format=customTei2Html</xsl:param>
    <xsl:param name="app-name"/>
    <xsl:param name="collection-name">Aschach</xsl:param>
    <xsl:param name="project-xsl">aschach2arche.xsl</xsl:param><!-- add main xsl name without file-extention -->
    <xsl:param name="path2source"></xsl:param>
    <xsl:param name="ref"/>
    <xsl:param name="currentIx"/>
    <xsl:param name="progress"/>
    <xsl:param name="tei-source">
        <xsl:value-of select="concat($baseURL,'/',$document)"/>
    </xsl:param>
    <xsl:param name="iiif"></xsl:param>
    <xsl:param name="entityID"/>
    <xsl:param name="image-url"></xsl:param>
    <xsl:param name="navbar-color">navbar-dark bg-dark</xsl:param>
    <xsl:param name="title" select="//tei:titleStmt//tei:title[@type='main']"/>
    <xsl:param name="arche_root_col_url"></xsl:param>
    <xsl:param name="arche_child_col_url"></xsl:param>
    <xsl:param name="baseURL" select="//@xml:base"/>
    <xsl:param name="next" select="//@next"/>
    <xsl:param name="prev" select ="//@prev"/>
    <xsl:param name="header-nav-item-info">true</xsl:param>
    
    <!-- ######################################################### --> 
    <!-- ##################### html structure #################### --> 
    <!-- ######################################################### --> 
    
    <xsl:template match="/">
        <html lang="en-US">
            <!-- ############### head ################ -->
            <head>
                <xsl:call-template name="add_metadata_to_head"/>
                <xsl:call-template name="add_base_scripts_and_styles"/>
                <title>
                    <xsl:value-of select=".//tei:title"/>
                </title>
                <!-- ************** project specific static css stylesheet ************** -->
                <style type="text/css">
                    /*vehicle table style*/
                    /*            */
                    /*            */
                    .sub-th {
                        display: block;
                        text-transform: uppercase;
                        text-decoration: underline;
                    }
                    #tableOne {
                        display: flex;
                        border-collapse: collapse;
                    }
                    #tableOne tbody {
                        display: flex;
                        border-collapse: collapse;
                        position: relative;
                        align-items: stretch;
                        padding: 1em;
                    }
                    #tableOne thead {
                        width: 30%;
                        display: flex;
                        border-collapse: collapse;
                        position: relative;
                        align-items: stretch;
                        padding: 1em;
                    }
                    #tableOne tr {
                        flex-basis: 100%;
                        display: flex;
                        flex-wrap: wrap;
                        align-content: flex-start;
                    }
                    td {
                        padding-left: 1em;
                        flex-basis: 100%;
                        min-height: 100px;
                        max-height: 100px;
                    }
                    /*OpenSeadragon*/
                    /*            */
                    /*            */
                    #OSD-images {
                        display: block;
                        width: 100%;
                        height: 400px;
                        border: 1px solid lightgrey;
                        border-radius: 5px;
                        vertical-align: bottom;
                        padding: .5em;
                    }
                    /*    images without OSD   */
                    /*                         */
                    /*                         */
                    .tei-xml-images {
                        border: 1px solid #ddd;
                        border-radius: 4px;
                        width: 280px;
                    }
                </style>
            </head>
            <!-- ############### body ################ -->
            <body>
                <div class="hfeed site" id="page">
                    <!-- ****************** navbar ****************** -->
                                        
                    <!-- ******************* The Navbar Area ******************* -->
                    <xsl:call-template name="navbar"/>
                    
                    <!-- ****************** adding a container for maps ****************** -->
                    <xsl:call-template name="add_map_container"/>
                    
                    <div class="wrapper" id="single-wrapper"> 
                        <!-- ************ bootstrap tab-content start ************* -->
                        <div class="tab-content">
                            
                            <!-- ****************** search result ****************** -->
                            <xsl:call-template name="search"/>  
                            
                            <!-- ****************** tei text/body ****************** -->
                            <xsl:call-template name="cards"/>
                            
                            <xsl:call-template name="cards-project"/>
                            
                                 
                        </div><!-- bootstrap end -->
                        <div class="container fade">
                            <ul>
                                <li id="child_col_url"><xsl:value-of select="substring-before($arche_child_col_url,'/metadata')"/></li>
                                <li id="tei_source"><xsl:value-of select="$baseURL"/></li>
                                <li id="project-xsl"><xsl:value-of select="$project-xsl"/></li>
                            </ul>
                        </div>
                        <!-- ***************** creating a modal window ************* -->
                        <xsl:call-template name="modal-metadata"/>
                        
                    </div><!-- #single-wrapper -->
                    
                    <!-- ******************* footer ******************* -->
                    <xsl:call-template name="fundament-footer"/>
                    
                </div><!-- hfeed site end -->
                <!-- ****************** static scripts ****************** -->
                <xsl:call-template name="dataTable-base-leaflet"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/one_leaflet.js"/>                
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/two_datatables.js"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/isotope_grid.js"/>
                <xsl:call-template name="OSD"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/osd.js"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/change_color_theme.js"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/language-switcher-generic.js"/>  
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/arche_api_searchText.js"/>
            </body>
        </html>        
    </xsl:template>

</xsl:stylesheet>