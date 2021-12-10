<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:my="http://test.org/" exclude-result-prefixes="tei xsl my" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/> 
    
    <xsl:template name="tei-xml-view">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'tei-xml-view'">
                <xsl:for-each select="tei:TEI">
                    <span class="tnc">
                        <span class="tc">&lt;</span>
                        <xsl:value-of select="name()"/>
                        <xsl:for-each select="@*">
                            <span class="ac">
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="name()"/>
                            </span>
                            <span class="avc">
                                <xsl:text>="</xsl:text>
                                <xsl:value-of select="."/>
                                <xsl:text>"</xsl:text>
                            </span>
                        </xsl:for-each>
                        <span class="tc">&gt;</span>
                    </span>
                    <xsl:call-template name="tei-xml-header">
                        <xsl:with-param name="view" select="$view"/>
                    </xsl:call-template>
                    <xsl:call-template name="tei-xml-text">
                        <xsl:with-param name="view" select="$view"/>
                    </xsl:call-template> 
                    <span class="tnc">
                        <span class="tc">&lt;</span>
                        <xsl:value-of select="concat('/' ,name())"/>
                        <span class="tc">&gt;</span>
                    </span>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="tei-xml-header">
        <xsl:param name="view"/>        
        <xsl:choose>
            <xsl:when test="$view = 'tei-xml-view'">
                <xsl:for-each select="./tei:teiHeader">
                    <span class="tnc">
                        <span class="tc">&lt;</span>
                        <xsl:value-of select="name()"/>
                        <xsl:for-each select="@*">
                            <span class="ac">
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="name()"/>
                            </span>
                            <span class="avc">
                                <xsl:text>="</xsl:text>
                                <xsl:value-of select="."/>
                                <xsl:text>"</xsl:text>
                            </span>
                        </xsl:for-each>
                        <span class="tc">&gt;</span>
                    </span>
                    <xsl:call-template name="tei-xml-child">
                        <xsl:with-param name="view" select="$view"/>
                    </xsl:call-template>  
                    <span class="tnc">
                        <span class="tc">&lt;</span>
                        <xsl:value-of select="concat('/' ,name())"/>
                        <span class="tc">&gt;</span>
                    </span>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    <xsl:template name="tei-xml-text">        
        <xsl:param name="view"/>        
        <xsl:choose>
            <xsl:when test="$view = 'tei-xml-view'">
                <xsl:for-each select="./tei:text">
                    <span class="tnc">
                        <span class="tc">&lt;</span>
                        <xsl:value-of select="name()"/>
                        <xsl:for-each select="@*">
                            <span class="ac">
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="name()"/>
                            </span>
                            <span class="avc">
                                <xsl:text>="</xsl:text>
                                <xsl:value-of select="."/>
                                <xsl:text>"</xsl:text>
                            </span>
                        </xsl:for-each>
                        <span class="tc">&gt;</span>
                    </span>
                    <xsl:call-template name="tei-xml-child">
                        <xsl:with-param name="view" select="$view"/>
                    </xsl:call-template>  
                    <span class="tnc">
                        <span class="tc">&lt;</span>
                        <xsl:value-of select="concat('/' ,name())"/>
                        <span class="tc">&gt;</span>
                    </span>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    <xsl:template name="tei-xml-child">
        <xsl:param name="view"/>        
            <xsl:choose>
                <xsl:when test="$view = 'tei-xml-view'"> 
                    <xsl:for-each select="child::*">
                        <span class="tnc">
                            <span class="tc">&lt;</span>
                            <xsl:value-of select="name()"/>
                            <xsl:for-each select="@*">
                                <span class="ac">
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="name()"/>
                                </span>
                                <span class="avc">
                                    <xsl:text>="</xsl:text>
                                    <xsl:value-of select="."/>
                                    <xsl:text>"</xsl:text>
                                </span>
                            </xsl:for-each>
                            <span class="tc">&gt;</span>
                        </span>  
                        <xsl:apply-templates>
                            <xsl:with-param name="view" select="$view"/>
                        </xsl:apply-templates>        
                        <span class="tnc">
                            <span class="tc">&lt;</span>
                            <xsl:value-of select="concat('/' ,name())"/>
                            <span class="tc">&gt;</span>
                        </span>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>        
    </xsl:template>

</xsl:stylesheet>