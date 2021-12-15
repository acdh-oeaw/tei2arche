<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:da="http://declarative.amsterdam/saxonjs"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    extension-element-prefixes="ixsl"
    expand-text="yes"
    version="3.0"
    >
    
    <xsl:import href="../template_imports/add_modal_custom.xsl"/>
    
    <xsl:template match="/">
        <xsl:result-document href="#listbibl-input" method="ixsl:replace-content" expand-text="true">
            <xsl:apply-templates select="//tei:listBibl"/>           
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:listBibl">
        <xsl:param name="transform">?format=customTei2Html</xsl:param>
        <div class="saxon-request table-responsive">     
            <table class="table table-striped table-hover" id="listbibl">
                <thead>
                    <tr>
                        <th>
                            <span class="body_translations" title="Name"><xsl:text>Name</xsl:text></span>
                        </th>
                        <th>
                            <span class="body_translations" title="Vorname"><xsl:text>Vorname</xsl:text></span>
                        </th>
                        <th>
                            <span class="body_translations" title="Titel"><xsl:text>Titel</xsl:text></span>
                        </th>
                        <th>
                            <span class="body_translations" title="Datum"><xsl:text>Datum</xsl:text></span>                     
                        </th>
                        <th>
                            <span class="body_translations" title="Gloss"><xsl:text>Gloss</xsl:text></span>      
                        </th>   
                        <th>
                            <span class="body_translations" title="Referenz"><xsl:text>Referenz</xsl:text></span>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="./tei:bibl">
                        <xsl:choose>
                            <xsl:when test="./not(node())">
                                <!-- if tei:person does not have any nodes it does not include them -->
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>                                    
                                    <td>
                                        <xsl:value-of select="./tei:author/tei:surname"/>
                                    </td>                                    
                                    <td>
                                        <xsl:value-of select="./tei:author/tei:forename"/>
                                    </td>                                                                      
                                    <td>
                                        <xsl:value-of select="./tei:title"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="./tei:date"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="./tei:gloss"/>
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
    </xsl:template>

</xsl:transform>	

