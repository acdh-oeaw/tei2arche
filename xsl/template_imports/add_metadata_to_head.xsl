<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://test.org/" exclude-result-prefixes="tei my xs xlink foo" version="2.0">
  <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
  
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>
      <h1>Widget add_metadata_to_head</h1>
      <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
      <p>Applied to html:head.</p>
      <p>The template "add_metadata_to_head" contains html:meta tags with metadata for SEO and Bibliographic Reference Tools (e.g. Zotero) - DCTERMS</p>     
    </desc>    
  </doc>
   
  <xsl:template name="add_metadata_to_head">  
    
    <xsl:variable name="type">website</xsl:variable>
    <xsl:variable name="url" select="//@base"/>
    <xsl:variable name="language" select="//tei:text/@xml:lang"/>
    <xsl:variable name="language2" select="//tei:profileDesc//tei:langUsage//tei:language"/>  
    <xsl:variable name="title" select="//tei:titleStmt//tei:title"/>
    <xsl:variable name="publisher" select="//tei:publicationStmt//tei:publisher//tei:orgName"/>
    <xsl:variable name="publisher2" select="//tei:publicationStmt//tei:publisher"/>
    <xsl:variable name="author" select="//tei:titleStmt//tei:author//tei:persName"/>
    <xsl:variable name="author2" select="//tei:titleStmt//tei:author"/>
    <xsl:variable name="editor" select="//tei:titleStmt//tei:editor//tei:persName"/>
    <xsl:variable name="editor2" select="//tei:titleStmt//tei:editor//tei:name"/>
    <xsl:variable name="editors" select="//tei:respStmt//tei:persName"/>
    <xsl:variable name="editors2" select="//tei:respStmt//tei:name"/>
    <xsl:variable name="yearOfPublication" select="//tei:publicationStmt//tei:date/@when"/>
    <xsl:variable name="yearOfPublication2" select="//tei:physDesc//tei:date"/>
    <xsl:variable name="yearOfPublication3" select="//tei:history//tei:origin//tei:date/@when-iso"/>
    <xsl:variable name="license" select="//tei:availability/tei:licence/@target"/>
    <xsl:variable name="license2" select="//tei:publicationStmt//tei:availability"/>
    <xsl:variable name="image" select="//tei:facsimile//tei:graphic"/>
    <xsl:variable name="description" select="//tei:seriesStmt"/>
    <xsl:variable name="description2" select="//tei:editionStmt"/>
    
    <!-- ########################################## -->
    <!-- ############ general metadata ############ -->
    <!-- ########################################## -->
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-title" content="{$title}"/>
  
    <!-- ############ author ########### -->
    <xsl:choose>
      <xsl:when test="$author != ''">
        <xsl:for-each select="$author">
          <meta name="author">
            <xsl:attribute name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
          </meta>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="$author2 != ''">
        <xsl:for-each select="$author2">
          <meta name="author">
            <xsl:attribute name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
          </meta>
        </xsl:for-each>
      </xsl:when>
      <!-- *********************************** -->
      <!-- not sure if editors is a good idea? -->
      <!-- *********************************** -->
      <xsl:when test="$editors != ''">
        <xsl:for-each select="$editors">
          <meta name="author">
            <xsl:attribute name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
          </meta>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="$editors2 != ''">
        <xsl:for-each select="$editors2">
          <meta name="author">
            <xsl:attribute name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
          </meta>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        
      </xsl:otherwise>
    </xsl:choose>
  
    <!-- ############ description ########### -->
    <xsl:choose>
      <xsl:when test="$description != ''">
        <meta>
          <xsl:attribute name="description">
            <xsl:value-of select="$description"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:when test="$description2 != ''">
        <meta>
          <xsl:attribute name="description">
            <xsl:value-of select="$description2"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:otherwise>
        
      </xsl:otherwise>
    </xsl:choose>
  
    <!-- ############ language ########### -->        
    <xsl:choose>
      <xsl:when test="$language != ''">
        <meta>
          <xsl:attribute name="content-language">
            <xsl:value-of select="$language"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:when test="$language2 != ''">
        <meta>
          <xsl:attribute name="content-language">
            <xsl:value-of select="$language2"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:otherwise>
        <meta>
          <xsl:attribute name="content-language">
            <xsl:value-of select="'en-US'"/>
          </xsl:attribute>
        </meta>
      </xsl:otherwise>
    </xsl:choose>          
    
    <!-- ########################################## -->
    <!-- ############ dcterms metadata ############ -->
    <!-- ########################################## -->
    
    <!-- ############ dcterms creator (author) ########### -->               
    <xsl:choose>
      <xsl:when test="$author != ''">
        <xsl:for-each select="$author">
          <meta name="dcterms.creator">
            <xsl:attribute name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
          </meta>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="$author2 != ''">
        <xsl:for-each select="$author2">
          <meta name="dcterms.creator">
            <xsl:attribute name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
          </meta>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        
      </xsl:otherwise>
    </xsl:choose>
    
    <!-- ############ dcterms creator (editor) ########### -->  
    <xsl:choose>
      <xsl:when test="$editor != ''">
        <xsl:for-each select="$editor">
          <meta name="dcterms.creator">
            <xsl:attribute name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
          </meta>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="$editor2 != ''">
        <xsl:for-each select="$editor2">
          <meta name="dcterms.creator">
            <xsl:attribute name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
          </meta>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="$editors != ''">
        <xsl:for-each select="$editors">
          <meta name="dcterms.creator">
            <xsl:attribute name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
          </meta>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="$editors2 != ''">
        <xsl:for-each select="$editors2">
          <meta name="dcterms.creator">
            <xsl:attribute name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
          </meta>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        
      </xsl:otherwise>
    </xsl:choose>
    
    <!-- ############ dcterms publisher ########### -->               
    <xsl:choose>
      <xsl:when test="$publisher != ''">
        <xsl:for-each select="$publisher">
          <meta name="dcterms.publisher">
            <xsl:attribute name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
          </meta>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="$publisher2 != ''">
        <xsl:for-each select="$publisher2">
          <meta name="dcterms.publisher">
            <xsl:attribute name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
          </meta>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        
      </xsl:otherwise>
    </xsl:choose>
    
    <!-- ############ dcterms language ########### -->               
    <xsl:choose>
      <xsl:when test="$language != ''">
        <meta>
          <xsl:attribute name="dcterms.language">
            <xsl:value-of select="$language"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:when test="$language2 != ''">
        <meta>
          <xsl:attribute name="dcterms.language">
            <xsl:value-of select="$language2"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:otherwise>
        <meta>
          <xsl:attribute name="dcterms.language">
            <xsl:value-of select="'en-US'"/>
          </xsl:attribute>
        </meta>
      </xsl:otherwise>
    </xsl:choose>
    
    <!-- ############ dcterms type ########### -->               
    <meta name="dcterms.type" content="{$type}"/>
    
    <!-- ############ dcterms title ########### -->               
    <meta name="dcterms.title" content="{$title}"/>
  
    <!-- ############ dcterms issued ########### -->               
    <xsl:choose>
      <xsl:when test="$yearOfPublication != ''">
        <meta>
          <xsl:attribute name="dcterms.issed">
            <xsl:value-of select="$yearOfPublication"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:when test="$yearOfPublication2 != ''">
        <meta>
          <xsl:attribute name="dcterms.issed">
            <xsl:value-of select="$yearOfPublication2"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:when test="$yearOfPublication3 != ''">
        <meta>
          <xsl:attribute name="dcterms.issed">
            <xsl:value-of select="$yearOfPublication3"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:otherwise>
        
      </xsl:otherwise>
    </xsl:choose>
    
    <!-- ############ dcterms license ########### -->                       
    <xsl:choose>
      <xsl:when test="$license != ''">
        <meta>
          <xsl:attribute name="dcterms.license">
            <xsl:value-of select="$license"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:when test="$license2 != ''">
        <meta>
          <xsl:attribute name="dcterms.license">
            <xsl:value-of select="$license2"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:otherwise>
        
      </xsl:otherwise>
    </xsl:choose>
  
    <!-- ############ dcterms description ########### -->        
    <xsl:choose>
      <xsl:when test="$description != ''">
        <meta>
          <xsl:attribute name="dcterms.description">
            <xsl:value-of select="normalize-space($description)"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:when test="$description2 != ''">
        <meta>
          <xsl:attribute name="dcterms.description">
            <xsl:value-of select="normalize-space($description2)"/>
          </xsl:attribute>
        </meta>
      </xsl:when>
      <xsl:otherwise>
        
      </xsl:otherwise>
    </xsl:choose>                                                
  </xsl:template>
</xsl:stylesheet>