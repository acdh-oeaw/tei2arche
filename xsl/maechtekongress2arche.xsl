<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <!-- ########### html head ########### -->
    <xsl:import href="template_imports/add_base_scripts_and_styles_to_head.xsl"/>
    <xsl:import href="template_imports/add_metadata_to_head.xsl"/>
    
    <!-- ########### fundament ########### -->
    <xsl:import href="template_imports/add_footer_to_body.xsl"/>
    
    <!-- ########### general imports ########### -->
    <xsl:import href="template_imports/search.xsl"/>
    <xsl:import href="template_imports/add_modal-metadata.xsl"/>    
    <xsl:import href="template_imports/tei-table.xsl"/>
    <xsl:import href="template_imports/tei-facsimile.xsl"/>
    <xsl:import href="template_imports/tei-title.xsl"/>
    <xsl:import href="template_imports/tei-idno.xsl"/>
    <xsl:import href="template_imports/tei-rs-modal.xsl"/>
    <xsl:import href="template_imports/tei-placeName.xsl"/>
    <xsl:import href="template_imports/tei-name.xsl"/>
    <xsl:import href="template_imports/tei-persName.xsl"/>
    <xsl:import href="template_imports/tei-date.xsl"/>
    <xsl:import href="template_imports/tei-time.xsl"/>
    <xsl:import href="template_imports/tei-note.xsl"/>
    <xsl:import href="template_imports/tei-footnotes-citation.xsl"/>
    <xsl:import href="template_imports/tei-note-footnote.xsl"/>
    <xsl:import href="template_imports/tei-entities.xsl"/>
    <xsl:import href="template_imports/tei-ref.xsl"/>
    <xsl:import href="template_imports/tei-choice.xsl"/>
    <xsl:import href="template_imports/tei-list.xsl"/>
    <xsl:import href="template_imports/add_navbar_to_body.xsl"/>
    <!-- ############### general imports ################# -->
    <xsl:import href="template_imports/add_header-navigation-custom-title.xsl"/>
    <xsl:import href="template_imports/add_html_xsl_data_transform_info.xsl"/>    
    <xsl:import href="template_imports/content_block_project.xsl"/>
    <xsl:import href="arche_templates/root_col.xsl"/>
    
    <!-- ########### scripts ########### -->
    <xsl:import href="template_imports/add_script_for_base_datatable.xsl"/>
    
    <!-- ############################################## -->
    <!-- ########### project specific imports ######### -->
    <!-- ############################################## -->
    <!-- ############# START HERE ##################### -->
    <!-- ############################################## -->
    <xsl:import href="maechtekongress/navbar-links.xsl"/>
    <xsl:import href="maechtekongress/content_block.xsl"/>
    
    <!-- ########### ADAPT PARAMETERS TO YOUR PROJECT ########### -->    
    <xsl:param name="document">
        <xsl:value-of select="tei:TEI/@xml:id"/>
    </xsl:param>
    <xsl:param name="app-name"/>
    <xsl:param name="transform">?format=customTei2Html</xsl:param>
    <xsl:param name="path2source"><!--https://service4tei.acdh-dev.oeaw.ac.at/?tei=--></xsl:param>
    <xsl:param name="collection-name">Mächtekongress</xsl:param>
    <xsl:param name="project-xsl">maechtekongress2arche.xsl</xsl:param><!-- add main xsl name without file-extention -->
    <xsl:param name="image-url"/>
    <xsl:param name="navbar-color">navbar-dark bg-dark</xsl:param>
    <xsl:param name="signatur">
        <xsl:value-of select=".//tei:institution/text()"/>, <xsl:value-of select=".//tei:repository[1]/text()"/>, <xsl:value-of select=".//tei:msIdentifier/tei:idno[1]/text()"/>
    </xsl:param>       
    <xsl:param name="baseURL" select="//@xml:base"/>
    <xsl:param name="title" select="//tei:titleStmt//tei:title[@type='main']"/>
    <xsl:param name="next" select="//@next"/>
    <xsl:param name="prev" select ="//@prev"/>
    <xsl:param name="tei-source">
        <xsl:value-of select="concat($baseURL,'/',$document)"/>
    </xsl:param>    
    <xsl:param name="arche_root_col_url">https://arche.acdh.oeaw.ac.at/api/28107</xsl:param>
    <xsl:param name="arche_child_col_url">https://arche.acdh.oeaw.ac.at/api/35152</xsl:param>
    <xsl:param name="header-nav-item-info">true</xsl:param>
    <xsl:param name="iiif"/>
    
    <!-- ######################################################### --> 
    <!-- ##################### html structure #################### --> 
    <!-- ######################################################### --> 
    
    <xsl:template match="/">
        <html>
            <!-- ############### head ################ -->
            <head>
                <xsl:call-template name="add_metadata_to_head"/>
                <xsl:call-template name="add_base_scripts_and_styles"/>
                <xsl:call-template name="datatable-base"/>
                <title>
                    <xsl:value-of select="$title"/>
                </title>
                <!-- ************** project specific static css stylesheet ************** -->
                <style type="text/css">            
                    .text{
                        padding:.5em;
                        line-height: 2em;
                        display: block;
                        text-align: justify;
                    }
                    .modal-body{
                        text-align:left !important;
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
                            
                            <!-- ############ search results ############# -->
                            <xsl:call-template name="search"/>
                            
                            <!-- ****************** content cards ****************** -->                         
                            <xsl:call-template name="cards"/>                            
                            
                            <xsl:call-template name="cards-project"/>                             
                            
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
                <!-- ****************** static scripts ****************** -->
                <script type="text/javascript" src="../static/js/arche_api_searchText.js"/>
                <script type="text/javascript" src="../static/js/change_color_theme.js"/>
                <script type="text/javascript" src="../static/js/language-switcher-generic.js"/>
                <script type="text/javascript" src="../static/js/n3_parsing_arche_metadata.js"/>
            </body>
        </html>        
    </xsl:template>
    <!-- ####################################### ################## --> 
    <!-- ################## body templates start ################## --> 
    <!-- ####################################### ################## --> 
    
</xsl:stylesheet>