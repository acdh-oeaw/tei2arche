<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-table.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "tei-table" can handle the tei/xml tag table and cell.</p> 
            <p>The template is used to create a html table based on two different rule-sets.</p>
        </desc>    
    </doc>
          
    <xsl:template match="tei:table">               
        <xsl:choose>
            <xsl:when test="./tei:row[@role='label']">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <xsl:attribute name="id">
                            <xsl:value-of select="'tableOne'"/>
                        </xsl:attribute>
                        <thead>
                            <xsl:for-each select="./tei:row[@role='label']">                                
                                <tr>
                                    <xsl:apply-templates/>
                                </tr>                                                                                     
                            </xsl:for-each>
                        </thead>
                        <tbody>
                            <xsl:for-each select="./tei:row[@role='data']">                        
                                <tr>
                                    <xsl:apply-templates/>
                                </tr>                                                                             
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <xsl:attribute name="id">
                            <xsl:value-of select="'tableTwo'"/>
                        </xsl:attribute>
                        <tbody>
                            <xsl:for-each select="./tei:row">                        
                                <tr>
                                    <xsl:apply-templates/>
                                </tr>                                                                             
                            </xsl:for-each>
                        </tbody>
                    </table>   
                </div>
            </xsl:otherwise>
        </xsl:choose>                                                                            
    </xsl:template>
    <xsl:template match="tei:cell">
        <xsl:choose>
            <xsl:when test="@role='label'">
                <xsl:for-each select=".">
                    <th><xsl:apply-templates/></th>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="@role='data'">
                <xsl:for-each select=".">
                    <td><xsl:apply-templates/></td>
                </xsl:for-each>               
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select=".">
                    <td><xsl:apply-templates/></td>                    
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>       
    </xsl:template> 
</xsl:stylesheet>