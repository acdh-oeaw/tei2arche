<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:foo="foo.com" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:my="http://test.org/" 
    xmlns:js="http://saxonica.com/ns/globalJS"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="tei my xs xlink foo js saxon" 
    version="3.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    <!--<xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>-->

    <xsl:template name="listPerson">  
        <xsl:param name="transform"></xsl:param>
        <xsl:for-each select="//tei:listPerson">
            <div class="table-responsive">     
                <table class="table table-striped table-hover" id="tableOne">
                    <thead>
                        <tr>
                            <th>
                                <span class="body_translations" title="Name"><xsl:text>Name</xsl:text></span>
                            </th>
                            <th>
                                <span class="body_translations" title="Vorname"><xsl:text>Vorname</xsl:text></span>
                            </th>
                            <xsl:if test="./tei:person/tei:persName/tei:roleName">
                                <th>
                                    <span class="body_translations" title="Rollenname"><xsl:text>Rollenname</xsl:text></span>
                                </th>
                            </xsl:if>
                            <th>
                                <span class="body_translations" title="Lebensdaten"><xsl:text>Lebensdaten</xsl:text></span>
                            </th>
                            <xsl:if test="./tei:person/tei:note/tei:p[2]">
                                <th>
                                    <span class="body_translations" title="Kurzbiographie"><xsl:text>Kurzbiographie</xsl:text></span>
                                </th>
                            </xsl:if>                            
                            <th>
                                <xsl:text>URI</xsl:text>
                            </th>   
                            <th>
                                <span class="body_translations" title="Referenz"><xsl:text>Referenz</xsl:text></span>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="./tei:person">
                            <xsl:choose>
                                <xsl:when test="./not(node())">
                                    <!-- if tei:person does not have any nodes it does not include them -->
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr>
                                        <xsl:choose>
                                            <xsl:when test="./tei:note/tei:p">
                                                <td>
                                                    <a href="#" data-toggle="modal" >
                                                        <xsl:attribute name="data-target">
                                                            <xsl:value-of select="concat('#',@xml:id)"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of select="./tei:persName/tei:surname"/>                                  
                                                    </a>
                                                    <xsl:call-template name="modal-custom">
                                                        <xsl:with-param name="ref-ID" select="@xml:id"/>
                                                        <xsl:with-param name="transform" select="$transform"/>
                                                        <xsl:with-param name="title">
                                                            <xsl:value-of select="concat(./tei:persName/tei:forename,' ',./tei:persName/tei:surname,' ',./tei:persName/tei:roleName)"/> 
                                                        </xsl:with-param>
                                                    </xsl:call-template>                            
                                                </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <td>
                                                    <xsl:value-of select="./tei:persName/tei:surname"/>
                                                </td> 
                                            </xsl:otherwise>
                                        </xsl:choose>                                        
                                        <td>
                                            <xsl:value-of select="./tei:persName/tei:forename"/>
                                        </td> 
                                        <xsl:if test="./tei:persName/tei:roleName">
                                            <td>
                                                <xsl:value-of select="./tei:persName/tei:roleName"/>
                                            </td>
                                        </xsl:if>                                        
                                        <td>
                                            <xsl:if test="./tei:note/tei:p[1] or ./tei:birth or ./tei:death">
                                            <ul>
                                                <xsl:if test="./tei:note/tei:p[1]">
                                                    <li>
                                                        <xsl:value-of select="./tei:note/tei:p[1]"/>
                                                    </li> 
                                                </xsl:if>
                                                <xsl:if test="./tei:birth">
                                                    <li><strong>Birth</strong></li>
                                                    <li><xsl:value-of select="./tei:birth/@when"/></li>                                
                                                </xsl:if>
                                                <xsl:if test="./tei:birth/tei:placeName">
                                                    <li><strong>Birthplace</strong></li>
                                                    <li><xsl:value-of select="./tei:birth/tei:placeName"/></li>  
                                                </xsl:if>
                                                <xsl:if test="./tei:death">                                                    
                                                    <li><strong>Death</strong></li>
                                                    <li><xsl:value-of select="./tei:death/@when"/></li>
                                                </xsl:if>
                                                <xsl:if test="./tei:death/tei:placeName">
                                                    <li><strong>Deathplace</strong></li>
                                                    <li><xsl:value-of select="./tei:death/tei:placeName"/></li> 
                                                </xsl:if>                                                
                                            </ul>  
                                            </xsl:if>
                                        </td>                                        
                                        <xsl:if test="./tei:note/tei:p[2]">
                                            <td>
                                                <xsl:value-of select="./tei:note/tei:p[2]"/>
                                            </td>
                                        </xsl:if>                                        
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
                                        <td>
                                            <xsl:if test="./tei:listEvent">
                                                <ul style="list-style-type: decimal-leading-zero;">
                                                    <xsl:for-each select="./tei:listEvent/tei:event">
                                                        <li style="margin-bottom:.3em;margin-left:1.5em;">
                                                            <xsl:for-each select="./tei:desc/tei:title">    
                                                                <xsl:apply-templates/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="./tei:p/tei:title">    
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