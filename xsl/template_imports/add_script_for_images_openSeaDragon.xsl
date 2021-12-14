<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget add_script_for_images_openSeaDragon.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied before the closing html:body tag.</p>
            <p>The template "add_script_for_images_openSeaDragon" adds the base js for osd.</p>     
        </desc>    
    </doc>
    
    <xsl:template name="OSD">
        <!-- openseadragon -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/openseadragon/2.4.2/openseadragon.min.js"/>
    </xsl:template>
</xsl:stylesheet>