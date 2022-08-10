<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-facsimile.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "tei-facsimile" can handle the tei/xml tag facsimile that contains the tag graphic.</p> 
            <p>The template uses the url of these tags to create one or more html images.</p>
        </desc>    
    </doc>
    
    <xsl:template match="tei:facsimile">
        <xsl:param name="url" select="$iiif"/>
        <xsl:for-each select="./tei:graphic">
            <xsl:choose>
                <xsl:when test="contains(@url, 'id.acdh.oeaw.ac.at')">
                    <img class="tei-xml-images">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat(@url, '?format=iiif')"/>
                        </xsl:attribute>
                    </img>
                </xsl:when>
                <xsl:when test="contains($url,'schnitzler-briefe')">
                    <img class="tei-xml-images">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat($url, @url, '.jp2/info.json')"/>
                        </xsl:attribute>
                    </img>
                </xsl:when>
                <xsl:otherwise>
                    <img class="tei-xml-images">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat($url, @url, '?format=iiif')"/>
                        </xsl:attribute>
                    </img>
                </xsl:otherwise>
            </xsl:choose>            
        </xsl:for-each>
        <xsl:if test="./tei:surface">
            <xsl:for-each select="./tei:surface/tei:graphic">
                <img class="tei-xml-images">
                    <xsl:attribute name="src">
                        <xsl:value-of select="if (not(matches(@url, 'jpg|tif'))) then concat(@url, '.tif') else @url"/>
                    </xsl:attribute>
                </img>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="./tei:surfaceGrp">
            <xsl:for-each select="./tei:surfaceGrp/tei:surface/tei:graphic">
                <img class="tei-xml-images">
                    <xsl:attribute name="src">
                        <xsl:value-of select="@url"/>
                    </xsl:attribute>
                </img>
            </xsl:for-each>
        </xsl:if>
    </xsl:template> 
</xsl:stylesheet>