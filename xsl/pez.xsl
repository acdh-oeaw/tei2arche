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
    exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <!-- ########### html head ########### -->
    <xsl:import href="template_imports/add_base_scripts_and_styles_to_head.xsl"/>
    <xsl:import href="template_imports/add_metadata_to_head.xsl"/>   
    
    <!-- ########### fundament (footer/navigation) ########### -->
    <xsl:import href="template_imports/add_footer_to_body.xsl"/>
    
    <!-- ########### general imports ########### -->    
    <!--<xsl:import href="template_imports/add_modal-metadata.xsl"/>-->
    <xsl:import href="template_imports/tei-geo.xsl"/>
    <xsl:import href="template_imports/search.xsl"/>
    <xsl:import href="template_imports/add_header_navigation_breadcrump.xsl"/>
    <!--<xsl:import href="template_imports/tei-title.xsl"/>-->
    <xsl:import href="template_imports/tei-rs-modal.xsl"/>
    <!--<xsl:import href="template_imports/tei-placeName.xsl"/>
    <xsl:import href="template_imports/tei-name.xsl"/>
    <xsl:import href="template_imports/tei-persName.xsl"/>
    <xsl:import href="template_imports/tei-date.xsl"/>
    <xsl:import href="template_imports/tei-time.xsl"/>
    <xsl:import href="template_imports/tei-entities.xsl"/>-->
    <xsl:import href="template_imports/tei-ref.xsl"/>
    <!--<xsl:import href="template_imports/tei-choice.xsl"/>-->
    <xsl:import href="template_imports/add_navbar_to_body.xsl"/>
    <!-- ############### general imports for content_block template ################# -->
    <xsl:import href="template_imports/add_header-navigation-custom-title.xsl"/>
    <xsl:import href="template_imports/add_html_xsl_data_transform_info.xsl"/>
    <xsl:import href="template_imports/content_block_project.xsl"/>
    <xsl:import href="template_imports/tei-facsimile.xsl"/>
    <xsl:import href="template_imports/osd-container.xsl"/>
    <xsl:import href="template_imports/tei-teiHeader.xsl"/>  
    
    <!-- ########### scripts ########### -->
    <xsl:import href="template_imports/add_script_for_datatable_and_leaflet.xsl"/>
    <xsl:import href="template_imports/add_script_for_images_openSeaDragon.xsl"/>
    <!-- ########### ARCHE metadata ########### -->
    <xsl:import href="arche_templates/root_col.xsl"/>
        
    <!-- ############################################## -->
    <!-- ########### project specific imports ######### -->
    <!-- ############################################## -->
    <!-- ############# START HERE ##################### -->
    <!-- ############################################## -->    
    <xsl:import href="pez/content_block.xsl"/>
    <xsl:import href="pez/navbar-links.xsl"/>
    
    <!-- ########### parameters ########### -->
    <xsl:param name="app-name">tei2arche</xsl:param>
    <xsl:param name="document" select="tei:TEI/@xml:id"/>    
    <xsl:param name="transform">?format=customTei2Html</xsl:param>
    <xsl:param name="collection-name">Gebrüder Pez</xsl:param>
    <xsl:param name="project-xsl">pez.xsl</xsl:param><!-- add main xsl name with file-extention -->
    <xsl:param name="path2source"></xsl:param>
    <xsl:param name="tei-source" select="concat($baseURL,'/',$document)"/>    
    <xsl:param name="image-url"></xsl:param>
    <xsl:param name="navbar-color">navbar-dark bg-dark</xsl:param>
    <xsl:param name="title" select="//tei:titleStmt/tei:title[@type='main']"/>
    <xsl:param name="arche_root_col_url">https://arche-dev.acdh-dev.oeaw.ac.at/api/37769</xsl:param>
    <xsl:param name="arche_child_col_url">https://arche-dev.acdh-dev.oeaw.ac.at/api/37769</xsl:param>
    <xsl:param name="baseURL" select="//@xml:base"/>
    <xsl:param name="next" select="//@next"/>
    <xsl:param name="prev" select ="//@prev"/>
    <xsl:param name="header-nav-item-info">false</xsl:param>
    <xsl:param name="iiif"/>
    
    <!-- ####################################################### --> 
    <!-- ##################### html structure #################### --> 
    <!-- ######################################################### --> 
    
    <xsl:template match="/">
        <html lang="en">
            <!-- ############### head ################ -->
            <head>
                <xsl:call-template name="add_metadata_to_head"/>
                <xsl:call-template name="add_base_scripts_and_styles"/>
                <title>
                    <xsl:value-of select="$title"/>
                </title>
                <!-- ************** project specific static css stylesheet ************** -->
                <style type="text/css">
                    td {
                        padding:.5em;
                        line-height: 1.5em;
                    }
                </style>
            </head>
            <!-- ############### body ################ -->
            <body>
                <div class="hfeed site" id="page">
                    <!-- ******************* The Navbar Area ******************* -->                    
                    <xsl:call-template name="navbar"/>
                    
                    <div class="wrapper" id="single-wrapper">                        
                        
                        <!-- ************ bootstrap tab-content start ************* -->
                        <div class="tab-content">                          
                            
                            <!-- ****************** search result ****************** -->
                            <xsl:call-template name="search"/>
                            
                            <!-- ****************** content cards ****************** -->                         
                            <xsl:call-template name="cards"/>                             
                            
                            <xsl:call-template name="cards-project"/>                             
                            
                        </div><!-- bootstrap end -->
                        <div class="fade">
                            <ul>
                                <li id="child_col_url"><xsl:value-of select="$arche_child_col_url"/></li>
                                <li id="root_col_url"><xsl:value-of select="$arche_root_col_url"/></li>
                                <li id="tei_source"><xsl:value-of select="$baseURL"/></li>
                                <li id="project-xsl"><xsl:value-of select="$project-xsl"/></li>
                            </ul>
                        </div>
                        <!-- ***************** creating a modal window ************* -->
                        <!--<xsl:call-template name="modal-metadata"/>-->
                        
                    </div><!-- #single-wrapper -->
                    
                    <!-- ******************* footer ******************* -->
                    <xsl:call-template name="fundament-footer"/>
                    
                </div><!-- hfeed site end -->
                <!-- ****************** loads DataTable and Leaflet css and js via cdn ****************** --> 
                <xsl:call-template name="dataTable-base-leaflet"/>
                <xsl:if test="//tei:facsimile">
                    <xsl:call-template name="OSD"/>
                    <script type="text/javascript" src="../static/js/osd.js"/>
                </xsl:if>
                <!-- ****************** static scripts ****************** -->         
                <script type="text/javascript" src="../static/js/handle_links_inside_bootstrap_tabs.js"/>
                <script type="text/javascript" src="../static/js/change_color_theme.js"/>
                <script type="text/javascript" src="../static/js/language-switcher-generic.js"/>  
                <script type="text/javascript" src="../static/js/arche_api_searchText_dev.js"/>
                <script type="text/javascript" src="../static/js/n3_parsing_arche_metadata_dev.js"/>
                <script type="text/javascript" src="../static/js/n3_parsing_arche_dev.js"/>
            </body>
        </html>        
    </xsl:template>
    
</xsl:stylesheet>