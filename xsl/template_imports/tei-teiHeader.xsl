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
    
    <xsl:template name="teiHeader">   
        <legend style="padding:.4em;"><strong>Metadata</strong></legend>
        <xsl:for-each select="//tei:publicationStmt/child::* | //tei:msIdentifier/child::* | //tei:supportDesc/child::*">
            <tr style="padding:.5em;">
                <th style="padding:.5em;text-transform:capitalize; vertical-align:top;"><xsl:value-of select="concat(name(),' ',parent::tei:msItem/@n)"/></th>
                <td style="padding:.5em;"><xsl:apply-templates/></td>
            </tr>          
        </xsl:for-each>   
        <xsl:for-each select="//tei:msContents">
            <tr style="border-top:1px solid lightgrey !important;padding:1em .5em .5em .5em;text-align:right !important;">
                <th style="padding:.4em;vertical-align:top;font-size:1.5em !important;">
                    Contents
                </th>
            </tr>
            <xsl:for-each select="./tei:summary">
                <tr style="padding:.5em;">
                    <th style="padding:.5em;text-transform:capitalize; vertical-align:top;"><xsl:value-of select="name()"/></th>
                    <td style="padding:.5em;"><xsl:apply-templates/></td>
                </tr>
            </xsl:for-each>
            <xsl:for-each select="./tei:msItem/child::*">
                <tr style="padding:.5em;">
                    <xsl:if test="name() = 'locus'">
                        <th style="padding:.5em;text-transform:capitalize; vertical-align:top;"><xsl:value-of select="concat('Pages',' ',parent::tei:msItem/@n)"/></th>
                    </xsl:if>
                    <xsl:if test="name() = 'bibl'">
                        <th style="padding:.5em;text-transform:capitalize; vertical-align:top;"><xsl:value-of select="concat('Entry',' ',parent::tei:msItem/@n)"/></th>
                    </xsl:if>
                    <td style="padding:.5em;"><xsl:apply-templates/></td>
                </tr>
            </xsl:for-each>
        </xsl:for-each>
        <xsl:for-each select="//tei:origin">
            <tr style="border-top:1px solid lightgrey;">
                <th style="padding:.5em;text-transform:capitalize; vertical-align:top;">Source</th>
                <td style="padding-top:.5em;">
                    <ul>
                        <xsl:for-each select="child::*">
                            <li style="padding:0 0 .5em .5em;"><xsl:apply-templates/></li>
                        </xsl:for-each> 
                    </ul>                            
                </td>
            </tr>
        </xsl:for-each>
        <xsl:for-each select="//tei:listBibl">
            <tr>
                <th style="padding:.5em;text-transform:capitalize; vertical-align:top;">Bibliography</th>
                <td style="padding-top:.5em;">
                    <ul>
                        <xsl:for-each select="child::*">
                            <li style="padding:0 0 .5em .5em;"><xsl:apply-templates/></li>
                        </xsl:for-each> 
                    </ul>                            
                </td>                       
            </tr>
        </xsl:for-each>
        <xsl:for-each select="//tei:textClass/child::*">
            <tr>
                <th style="padding:.5em;text-transform:capitalize; vertical-align:top;">Keywords</th>
                <td style="padding:.5em;"><xsl:apply-templates/></td>
            </tr>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>