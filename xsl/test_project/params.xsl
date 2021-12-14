<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="#all" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <!-- ########### parameters ########### -->
    <xsl:param name="app-name">tei2arche</xsl:param>
    <xsl:param name="document" select="tei:TEI/@xml:id"/>    
    <xsl:param name="transform">?format=customTei2Html</xsl:param>
    <xsl:param name="collection-name">Test Project</xsl:param>
    <xsl:param name="project-xsl">test.xsl</xsl:param><!-- add main xsl name with file-extention -->
    <xsl:param name="path2source"></xsl:param>
    <xsl:param name="tei-source" select="concat($baseURL,'/',$document)"/>    
    <xsl:param name="image-url"></xsl:param>
    <xsl:param name="navbar-color">navbar-dark bg-dark</xsl:param>
    <xsl:param name="title" select="//tei:titleStmt/tei:title"/>
    <xsl:param name="arche_root_col_url"></xsl:param>
    <xsl:param name="arche_child_col_url"></xsl:param>
    <xsl:param name="baseURL" select="//@xml:base"/>
    <xsl:param name="next" select="//@next"/>
    <xsl:param name="prev" select ="//@prev"/>
    <xsl:param name="header-nav-item-info">true</xsl:param>
    <xsl:param name="iiif"/>
</xsl:stylesheet>