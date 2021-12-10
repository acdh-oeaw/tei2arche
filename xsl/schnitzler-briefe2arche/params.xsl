<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">    
    
    <xsl:param name="app-name">tei2arche</xsl:param>
    <xsl:param name="document" select="tei:TEI/@xml:id"/>    
    <xsl:param name="transform">?format=customTei2Html</xsl:param>
    <xsl:param name="collection-name" select="//tei:titleStmt/tei:title[@level='s']"/>
    <xsl:param name="project-xsl">schnitzler-briefe2arche.xsl</xsl:param><!-- add main xsl name with file-extention -->
    <xsl:param name="path2source"></xsl:param>
    <xsl:param name="tei-source" select="concat($baseURL,'/',$document)"/>    
    <xsl:param name="image-url">https://arche-thumbnails.acdh.oeaw.ac.at/id.acdh.oeaw.ac.at/schnitzler/schnitzler-briefe?width=00</xsl:param>
    <xsl:param name="navbar-color">navbar-dark bg-dark</xsl:param>
    <xsl:param name="title" select="//tei:titleStmt/tei:title[@level='a']"/>
    <xsl:param name="arche_root_col_url">https://arche.acdh.oeaw.ac.at/api/140074</xsl:param>
    <xsl:param name="arche_child_col_url">https://arche.acdh.oeaw.ac.at/api/140078</xsl:param>
    <xsl:param name="baseURL" select="//@xml:base"/>
    <xsl:param name="next" select="//@next"/>
    <xsl:param name="prev" select ="//@prev"/>
    <xsl:param name="header-nav-item-info">true</xsl:param>
    <xsl:param name="iiif">https://iiif.acdh.oeaw.ac.at/schnitzler-briefe/</xsl:param>
</xsl:stylesheet>