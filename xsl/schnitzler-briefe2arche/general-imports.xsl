<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">    
    
    <!-- ########### html head ########### -->
    <xsl:import href="template_imports/add_base_scripts_and_styles_to_head.xsl"/>
    <xsl:import href="template_imports/add_metadata_to_head.xsl"/>   
    
    <!-- ########### fundament (footer/navigation) ########### -->
    <xsl:import href="template_imports/add_footer_to_body.xsl"/>
    
    <!-- ########### general imports ########### -->    
    <xsl:import href="template_imports/add_modal-metadata.xsl"/>
    <xsl:import href="template_imports/tei-geo.xsl"/>
    <xsl:import href="template_imports/search.xsl"/>
    <xsl:import href="template_imports/tei-title.xsl"/>
    <xsl:import href="template_imports/tei-rs-modal.xsl"/>
    <xsl:import href="template_imports/tei-placeName.xsl"/>
    <xsl:import href="template_imports/tei-name.xsl"/>
    <xsl:import href="template_imports/tei-persName.xsl"/>
    <xsl:import href="template_imports/tei-date.xsl"/>
    <xsl:import href="template_imports/tei-time.xsl"/>
    <xsl:import href="template_imports/tei-entities.xsl"/>
    <xsl:import href="template_imports/tei-ref.xsl"/>
    <xsl:import href="template_imports/tei-choice.xsl"/>
    <xsl:import href="template_imports/add_navbar_to_body.xsl"/>
    <!-- ############### general imports for content_block template ################# -->
    <xsl:import href="template_imports/add_header-navigation-custom-title.xsl"/>
    <xsl:import href="template_imports/add_html_xsl_data_transform_info.xsl"/>
    <xsl:import href="template_imports/content_block_project.xsl"/>
    <xsl:import href="template_imports/tei-facsimile.xsl"/>    
    <xsl:import href="template_imports/osd-container.xsl"/> 
    <xsl:import href="template_imports/api_download_result.xsl"/>
    
    <!-- ########### scripts ########### -->
    <xsl:import href="template_imports/add_script_for_datatable_and_leaflet.xsl"/>
    <xsl:import href="template_imports/add_script_for_images_openSeaDragon.xsl"/>
    <!-- ########### ARCHE metadata ########### -->
    <xsl:import href="arche_templates/root_col.xsl"/>
</xsl:stylesheet>