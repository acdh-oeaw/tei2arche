<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-date.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "tei-date" can handle the tei/xml tag date.</p>     
            <p>The template verfies the format of date attributes and searches for ISO formats.</p>  
            <p>If an ISO format is found it converts it to human readable date formats.</p>
            <p>If no ISO format was found it uses the date as it is.</p>
        </desc>    
    </doc>
    
    <xsl:template match="tei:date">
        <xsl:choose>
            <xsl:when test="@when and string-length(@when) = 10">
                <span class="date">
                    <xsl:attribute name="type">
                        <xsl:value-of select="'xs:date'"/>
                    </xsl:attribute>
                    <xsl:variable name="d" as="xs:date" select="@when"/>
                    <xsl:value-of select="format-date($d, '[Y]-[M]-[D]')"/>
                </span>
            </xsl:when>
            <xsl:when test="@when-iso">
                <span class="date">
                    <xsl:attribute name="type">
                        <xsl:value-of select="'xs:date'"/>
                    </xsl:attribute>
                    <xsl:variable name="d" as="xs:date" select="@when-iso"/>
                    <xsl:value-of select="format-date($d, '[Y]-[M]-[D]')"/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="date">                                       
                    <xsl:apply-templates/> 
                </span>
            </xsl:otherwise>
        </xsl:choose>                   
    </xsl:template>
</xsl:stylesheet>