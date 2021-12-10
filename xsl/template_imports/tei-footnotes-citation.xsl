<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:dc11="http://purl.org/dc/elements/1.1/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:arche="https://vocabs.acdh.oeaw.ac.at/schema#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <xsl:template name="footnote-citation">
            <xsl:call-template name="tei-note-footnote"/> 
            <hr/>
            <h3 class="body_translations" title="Zitierhinweis">Zitierhinweis</h3>
            <blockquote class="blockquote">
                <cite title="Source Title">
                    <xsl:choose>
                        <xsl:when test="//tei:msIdentifier">
                            <xsl:value-of select="//tei:msIdentifier"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="//tei:biblStruct/tei:monogr/tei:author"/>
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="//tei:biblStruct/tei:monogr/tei:title"/>
                            <xsl:text>, Digitale Edition, Eintrag: </xsl:text>
                            <xsl:value-of select="concat($baseURL, $document)"/>
                        </xsl:otherwise>
                    </xsl:choose>                    
                    <span>. Hg. v. </span> 
                    <xsl:value-of select="//tei:publicationStmt/tei:publisher"/>
                    <xsl:text> (</xsl:text>
                    <a target="_blank">
                        <xsl:attribute name="href">
                            <xsl:value-of select="//tei:publicationStmt/tei:idno[@type='handle' or @type='URI']"/>
                        </xsl:attribute>
                        <xsl:value-of select="//tei:publicationStmt/tei:idno[@type='handle' or @type='URI']"/>
                    </a>                                
                    <span class="body_translations" title=", aufgerufen am ">, aufgerufen am </span>
                    <span class="body_translations" title="{format-date(current-date(),  '[D].[M].[Y]')}">
                        <xsl:value-of select="format-date(current-date(), '[D].[M].[Y]')"/>
                    </span>
                    <xsl:text>)</xsl:text>
                </cite>
            </blockquote>        
    </xsl:template>
</xsl:stylesheet>