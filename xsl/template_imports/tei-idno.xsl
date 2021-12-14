<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-idno.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "tei-idno" can handle the tei/xml tag idno.</p> 
            <p>The template rules are seperate for teiHeader and tei:body while first will additionally add html list tags (dt, dd).</p>
            <p>The template verifies if a type attribute is available and in case it contains ISBN, handle, URI, URL and VIAF it uses the value as href.</p>
        </desc>    
    </doc>
    
    <xsl:template match="tei:idno">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <xsl:choose>
                    <xsl:when test="@type='ISBN'">
                        <span style="text-transform:uppercase;"><xsl:value-of select="concat(@type,': ')"/></span><xsl:apply-templates/>       
                    </xsl:when>
                    <xsl:when test="@type='URI' or @type='URL' or @type='handle'">
                        <xsl:apply-templates/>
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a>
                    </xsl:when>
                    <xsl:when test="@type='VIAF' and parent::tei:institution">
                        <xsl:apply-templates/>
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="concat('http://viaf.org/viaf/',.)"/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <span style="text-transform:uppercase;"><xsl:value-of select="concat(@type,' ')"/></span><xsl:apply-templates/>           
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- in case the tei:back or tei:body shall be visible this needs to be added here or antoher xsl:when created -->
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:template>    
</xsl:stylesheet>