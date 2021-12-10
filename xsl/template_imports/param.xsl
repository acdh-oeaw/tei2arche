<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <xsl:template name="param">
        <xsl:param name="document">
            <xsl:value-of select="tei:TEI/@xml:id"/>
        </xsl:param>
        <xsl:param name="app-name"/>
        <xsl:param name="transform">?format=customTei2Html</xsl:param>
        <xsl:param name="collection-name"/>
        <xsl:param name="path2source"><!--https://service4tei.acdh-dev.oeaw.ac.at/?tei=--></xsl:param>
        <xsl:param name="ref"/>
        <xsl:param name="currentIx"/>
        <xsl:param name="amount"/>
        <xsl:param name="progress"/>
        <xsl:param name="signatur">
            <xsl:value-of select=".//tei:institution/text()"/>, <xsl:value-of select=".//tei:repository[1]/text()"/>, <xsl:value-of select=".//tei:msIdentifier/tei:idno[1]/text()"/>
        </xsl:param>       
        <xsl:param name="baseURL" select="//@xml:base"/>
        <xsl:param name="title" select="//tei:titleStmt//tei:title[@type='main']"/>
        <xsl:param name="next" select="//@next"/>
        <xsl:param name="prev" select ="//@prev"/>
        <xsl:param name="tei-source">
            <xsl:value-of select="concat($baseURL,'/',$document)"/>
        </xsl:param>
    </xsl:template>
    
</xsl:stylesheet>