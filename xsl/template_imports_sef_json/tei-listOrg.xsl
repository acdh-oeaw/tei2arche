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
        <xsl:result-document href="#listorg-input" method="ixsl:replace-content" expand-text="true">
            <xsl:apply-templates select="//tei:listOrg"/>           
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:listOrg">
        <xsl:param name="transform">?format=customTei2Html</xsl:param>
        <div class="saxon-request table-responsive">           
            <table class="table table-striped table-hover" id="listorg">
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
    </xsl:template>

</xsl:transform>	

