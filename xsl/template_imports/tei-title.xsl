<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-title.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "tei-title" can handle the tei/xml tag title.</p> 
            <p>The template rules are seperate for teiHeader and tei:body while first will additionally add html list tags (dt, dd).</p>
        </desc>    
    </doc>
    
    <xsl:template match="tei:title">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <xsl:choose>
                    <xsl:when test="@type='main'">
                        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="concat(@type,'-',name(.))"/></span>
                        <h3><xsl:apply-templates/></h3>
                    </xsl:when>
                    <xsl:when test="@type='sub'">
                        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="concat(@type,'-',name(.))"/></span>
                        <h4><xsl:apply-templates/></h4>
                    </xsl:when>
                    <xsl:otherwise>
                        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="name(.)"/></span>
                        <h5><xsl:apply-templates/></h5>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="ancestor::tei:body">
                <xsl:choose>
                    <xsl:when test="@type='main'">
                        <h2><xsl:apply-templates/></h2>
                    </xsl:when>
                    <xsl:when test="@type='sub'">
                        <h3><xsl:apply-templates/></h3>
                    </xsl:when>
                    <xsl:otherwise>
                        <h2><xsl:apply-templates/></h2>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- in case the tei:back shall be visible this needs to be added here or antoher xsl:when created -->
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
</xsl:stylesheet>