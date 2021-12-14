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
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_base_scripts_and_styles_to_head.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_metadata_to_head.xsl"/>   
    
    <!-- ########### fundament (footer/navigation) ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_footer_to_body.xsl"/>
    
    <!-- ########### general imports ########### -->    
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_modal-metadata.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-geo.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/search.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_header_navigation_breadcrump.xsl"/>
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
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/content_block_project.xsl"/>
    
    <!-- ########### scripts ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/add_script_for_datatable_and_leaflet.xsl"/>
    
    <!-- ########### arche root col and child col download ########### -->
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/arche_templates/root_col_jstree.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/arche_templates/root_col.xsl"/>    
    
    <!-- ############################################## -->
    <!-- ########### project specific imports ######### -->
    <!-- ############################################## -->
    <!-- ############# START HERE ##################### -->
    <!-- ############################################## -->    
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/depictions/content_block.xsl"/>
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/depictions/navbar-links.xsl"/>
    
    <!-- ########### parameters ########### -->
    <xsl:param name="document" select="tei:TEI/@xml:id"/>    
    <xsl:param name="transform">?format=customTei2Html</xsl:param>
    <xsl:param name="collection-name">Depictions</xsl:param>
    <xsl:param name="project-xsl">depictions2arche.xsl</xsl:param><!-- add main xsl name without file-extention -->
    <xsl:param name="path2source"></xsl:param>
    <xsl:param name="tei-source" select="concat($baseURL,'/',$document)"/>    
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
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/handle_links_inside_bootstrap_tabs.js"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/change_color_theme.js"/>
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/language-switcher-generic.js"/>  
                <script type="text/javascript" src="https://acdh-oeaw.github.io/tei2arche/static/js/arche_api_searchText.js"/>
            </body>
        </html>        
    </xsl:template>
    
</xsl:stylesheet>