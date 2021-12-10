<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-header_without_xenoData.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "tei-header_without_xenoData" can handle most of the tei/xml tags that are teiHeader specific.</p>
            <p>The template does not handle tei/xml tags of the teiHeader that are part of the xenoData tag for rdf data.</p>
            <p>The main category provide access to all other templates and the user can decide which main categories are needed.</p>
            <p>The sub category for sourceDesc provide access to all other templates and the user can decide which sub categories are needed.</p>
            <p>The category single templates contain subsequent templates for main and sub categories.</p>
        </desc>    
    </doc>
    
    <!-- ################################################ -->
    <!-- ################ main categories ############### -->
    <!-- ################################################ -->
    <!-- access of all other templates can be achieved with apply-templates select for each main category needed -->
    <xsl:template match="tei:fileDesc">
        <div class="fileDesc">

            
                <xsl:apply-templates/>
                        
        </div>
    </xsl:template>   
    <xsl:template match="tei:encodingDesc">
        <div class="encodingDesc">

            
                <xsl:apply-templates/>
                        
        </div>
    </xsl:template>
    <xsl:template match="tei:profileDesc">
        <div class="profileDesc">

            
                <xsl:apply-templates/>
                        
        </div>
    </xsl:template>
    <xsl:template match="tei:revisionDesc">
        <div class="revisionDesc">

            
                <xsl:apply-templates/>
                        
        </div>
    </xsl:template>
    
    <!-- ################################################ -->
    <!-- ####### sub categories of fileDesc ############# -->
    <!-- ################################################ -->
    <xsl:template match="tei:sourceDesc">

        
            <xsl:apply-templates/>
                           
    </xsl:template>
    <xsl:template match="tei:titleStmt">

        
            <xsl:apply-templates/>
         
    </xsl:template>
    <xsl:template match="tei:editionStmt">

        
            <xsl:apply-templates/>
         
    </xsl:template>
    <xsl:template match="tei:publicationStmt">

        
            <xsl:apply-templates/>
         
    </xsl:template>
    <xsl:template match="tei:seriesStmt">

        
            <p><xsl:apply-templates/></p>
         
    </xsl:template>
    <xsl:template match="tei:notesStmt">

        
            <xsl:apply-templates/>
         
    </xsl:template>
    
    <!-- ################################################ -->
    <!-- ############## single templates ################# -->
    <!-- ################################################ -->
    <xsl:template match="tei:editor | tei:author | tei:publisher | tei:application | tei:abstract | tei:language">
        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="name(.)"/></span>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:correspContext">
        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="substring-after(name(.),'corresp')"/></span>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:authority">
        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="name(.)"/></span>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:correspAction">
        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="@type"/></span>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:particDesc">
        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="./tei:listPerson/tei:head"/></span>
        <xsl:for-each select="./tei:listPerson/tei:person">
            <xsl:apply-templates/>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:resp">
        <span style="font-weight:bold;text-transform:uppercase;"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="tei:styleDefDecl">
        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="@scheme/name(.)"/></span>
    </xsl:template>
    <xsl:template match="tei:pubPlace | tei:affiliation | tei:origin | tei:editorialDecl/tei:p | tei:ab">
        <xsl:apply-templates/> 
    </xsl:template>
    <xsl:template match="tei:rendition">
        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="concat(@scheme,' ')"/></span><xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:measure">
        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="@type"/></span>: <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:handNote | tei:hyphenation | tei:interpretation">
        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="name(.)"/></span>: <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:projectDesc/tei:p">
        <xsl:apply-templates/>
    </xsl:template> 
    <xsl:template match="tei:physDesc/tei:p | tei:msItem/tei:p | tei:msContents/tei:p">
        <xsl:apply-templates/>       
    </xsl:template>   
    <xsl:template match="tei:funder">        
        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="name(.)"/></span>
        <xsl:for-each select="./*">
            <xsl:choose>
                <xsl:when test="./tei:orgName/@key">
                    <xsl:apply-templates/><a target="_blank">
                        <xsl:attribute name="href">
                            <xsl:value-of select="./tei:orgName/@key"/>
                        </xsl:attribute>
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                            <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                        </svg>            
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:edition">      
        <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="name(.)"/></span>
        <xsl:choose>
            <xsl:when test="./tei:date">
                <span style="text-transform:uppercase;">Date: </span><xsl:apply-templates/>   
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>   
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:availability">
        <xsl:choose>
            <xsl:when test="./tei:licence">
                <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="./tei:licence/name(.)"/></span>
                <xsl:apply-templates/><a target="_blank">
                    <xsl:attribute name="href">
                        <xsl:value-of select="./tei:licence/@target"/>
                    </xsl:attribute>
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                    </svg>            
                </a>
            </xsl:when>
            <xsl:otherwise>
                <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="name(.)"/></span>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    <xsl:template match="tei:biblScope">
        <xsl:choose>
            <xsl:when test="@unit">
                <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="@unit"/></span>: <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="@volume">
                <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="@volume"/></span>: <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>    
    <xsl:template match="tei:listWit">
        <xsl:choose>
            <xsl:when test="preceding-sibling::tei:msDesc or following-sibling::tei:msDesc">
                <span style="font-weight:bold;text-transform:uppercase;"><xsl:value-of select="./tei:head"/></span>
                <xsl:for-each select="./tei:witness">
                    <span style="text-transform:uppercase;"><xsl:value-of select="name(.)"/></span>
                    <xsl:apply-templates/>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:change">
        <xsl:choose>
            <xsl:when test="@xml:id='initial'">
                <xsl:text>Created Start Date: </xsl:text><xsl:value-of select="@when"/>
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="@notAfter">
                <xsl:text>Created End Date: </xsl:text><xsl:value-of select="@notAfter"/>
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Date: </xsl:text><xsl:value-of select="@when"/>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>