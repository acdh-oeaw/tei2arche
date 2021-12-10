<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://test.org/" exclude-result-prefixes="tei my xs xlink foo" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-event.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "tei-event" can handle the tei/xml tags even, desc and link as part for listEvent.</p> 
        </desc>    
    </doc>
    
    <xsl:template name="listEvent">
        <xsl:param name="transform"/>
        <xsl:variable name="teiSource" select="'https://service4tei.acdh-dev.oeaw.ac.at/?tei='"/>       
        <xsl:for-each select="./tei:listEvent">
            <tr>
                <th class="body_translations" title="Erwähnt in">Erwähnt in</th>
                <td>
                    <ul style="list-style-type: decimal-leading-zero;">
                        <xsl:for-each select="./tei:event">
                            <li style="margin-bottom:.3em;margin-left:1.5em;">
                                <xsl:for-each select="./tei:desc/tei:title">    
                                    <xsl:apply-templates/>
                                </xsl:for-each>
                                <xsl:for-each select="./tei:linkGrp/tei:link[@type='ARCHE']">
                                    <a target="_blank">                                                                    
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="concat(@target,$transform)"/>
                                        </xsl:attribute>
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                            <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                        </svg>
                                    </a>
                                </xsl:for-each> 
                            </li>
                        </xsl:for-each>
                    </ul>
                </td> 
            </tr>            
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>