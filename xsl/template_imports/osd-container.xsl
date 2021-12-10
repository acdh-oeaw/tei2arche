<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:dc11="http://purl.org/dc/elements/1.1/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:arche="https://vocabs.acdh.oeaw.ac.at/schema#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <xsl:template name="osd-container">
        <div id="OSD-images" style="padding:.5em;">
            <!-- image container accessed by OSD script -->
            <div id="non-OSD-images">
                <!-- #non-OSD-images is removed with openSeaDragon script -->
                <!-- if no script is available it holds the images from tei/xml -->
                <xsl:apply-templates select="//tei:facsimile"/>                                    
            </div>                                
        </div>
    </xsl:template>
</xsl:stylesheet>