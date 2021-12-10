<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>


    <xsl:template name="listOrg"> 
        <xsl:param name="transform"/>
        <xsl:for-each select="//tei:listOrg">
            <div class="table-responsive">           
                <table class="table table-striped table-hover" id="tableOne">
                    <thead>
                        <tr>
                            <th>
                                <span class="body_translations" title="Organisationsname"><xsl:text>Organisationsname</xsl:text></span>
                            </th>                        
                            <th>
                                <xsl:text>URI</xsl:text>
                            </th>                        
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="./tei:org">
                            <xsl:choose>
                                <xsl:when test="./not(node())">
                                    <!-- if tei:person does not have any nodes it does not include them -->
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="./tei:note/tei:p">
                                                    <a href="#" data-toggle="modal" >
                                                        <xsl:attribute name="data-target">
                                                            <xsl:value-of select="concat('#',@xml:id)"/>
                                                        </xsl:attribute>
                                                        <xsl:choose>
                                                            <xsl:when test="./tei:orgName[not(@type='alt' or @type='pref')]">
                                                                <xsl:value-of select="./tei:orgName[not(@type='alt' or @type='pref')]"/>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:value-of select="./tei:orgName[@type='pref']"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>                                    
                                                    </a>
                                                    <xsl:call-template name="modal-custom">
                                                        <xsl:with-param name="ref-ID" select="@xml:id"/>
                                                        <xsl:with-param name="transform" select="$transform"/>
                                                        <xsl:with-param name="title">                                        
                                                            <xsl:choose>
                                                                <xsl:when test="./tei:orgName[not(@type='alt' or @type='pref')]">
                                                                    <xsl:value-of select="./tei:orgName[not(@type='alt' or @type='pref')]"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:value-of select="./tei:orgName[@type='pref']"/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:with-param>
                                                    </xsl:call-template> 
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="./tei:orgName"/>
                                                </xsl:otherwise>
                                            </xsl:choose>                                                                       
                                        </td>         
                                        <td>
                                            <xsl:if test="./tei:idno">
                                                <xsl:for-each select="./tei:idno">
                                                    <ul>
                                                        <li>                                                            
                                                            <a target="_blank">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="."/>
                                                                </xsl:attribute>
                                                                <xsl:apply-templates/>                                                              
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </xsl:for-each>  
                                            </xsl:if>
                                        </td>
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>                            
                        </xsl:for-each>
                    </tbody>
                </table>
            </div> 
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>