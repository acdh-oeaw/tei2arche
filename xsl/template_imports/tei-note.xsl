<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-note.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "tei-note" can handle the tei/xml tag note.</p> 
            <p>If an attribute xml:id exists it replaces the note with a html sub element that links to a footnote on another position of the html document.</p>
            <p>This template requires another template called "tei-note-footnote" which creates a footnote linked to this reference.</p> 
        </desc>    
    </doc>
    
    <xsl:template match="tei:note">
        <xsl:choose>
            <xsl:when test="exists(@xml:id)">                
                <a>
                    <xsl:attribute name="name">
                        <xsl:value-of select="replace(@xml:id,'note_','fn')"/>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:value-of select="concat('#',replace(@xml:id,'note_','fn_'))"/>
                    </xsl:attribute>
                    <strong><sup><xsl:value-of select="replace(@xml:id,'note_','')"/></sup></strong>
                </a>                
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
</xsl:stylesheet>