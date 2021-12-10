<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <!-- teiHeader templates start -->
    <!-- fileDesc -->
    <xsl:template match="tei:fileDesc">
        <div class="fileDesc">
            <p style="text-transform:uppercase;"><xsl:value-of select="concat(name(.),'ription')"/></p>
            <dl class="teiHeader">
                <xsl:apply-templates/>
            </dl>            
        </div>
    </xsl:template>
    <!-- titleStmt -->
    <xsl:template match="tei:titleStmt">
        <p style="text-transform:uppercase;text-align:left;"><xsl:value-of select="concat(substring-before(name(.),'Stmt'),'statement')"/></p>
        <dl class="teiHeader">
            <xsl:apply-templates/>
        </dl> 
    </xsl:template>
    <xsl:template match="tei:editor | tei:author">
        <dt><xsl:value-of select="name(.)"/></dt>
        <dd><xsl:apply-templates/></dd>
    </xsl:template>
    <xsl:template match="tei:funder">        
        <dt><xsl:value-of select="name(.)"/></dt>
        <xsl:for-each select="./*">
            <xsl:choose>
                <xsl:when test="./tei:orgName/@key">
                    <dd><xsl:apply-templates/><a target="_blank">
                        <xsl:attribute name="href">
                            <xsl:value-of select="./tei:orgName/@key"/>
                        </xsl:attribute>
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                            <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                        </svg>            
                    </a></dd>
                </xsl:when>
                <xsl:otherwise>
                    <dd><xsl:apply-templates/></dd>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:resp">
        <dt><xsl:apply-templates/></dt>
    </xsl:template>    
    <!-- editionStmt -->
    <xsl:template match="tei:editionStmt">
        <p style="text-transform:uppercase;text-align:left;"><xsl:value-of select="concat(substring-before(name(.),'Stmt'),'statement')"/></p>
        <dl class="teiHeader">
            <xsl:apply-templates/>
        </dl> 
    </xsl:template>
    <xsl:template match="tei:edition">      
        <dt><xsl:value-of select="name(.)"/></dt>
        <xsl:choose>
            <xsl:when test="./tei:date">
                <dd><span style="text-transform:uppercase;">Date: </span><xsl:apply-templates/></dd>   
            </xsl:when>
            <xsl:otherwise>
                <dd><xsl:apply-templates/></dd>   
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- publicationStmt -->
    <xsl:template match="tei:publicationStmt">
        <p style="text-transform:uppercase;text-align:left;"><xsl:value-of select="concat(substring-before(name(.),'Stmt'),'statement')"/></p>
        <dl class="teiHeader">
            <xsl:apply-templates/>
        </dl> 
    </xsl:template>
    <xsl:template match="tei:authority">
        <dt><xsl:value-of select="name(.)"/></dt>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:publisher">
        <dt><xsl:value-of select="name(.)"/></dt>
        <dd><xsl:apply-templates/></dd> 
    </xsl:template>
    <xsl:template match="tei:pubPlace">
        <dd><xsl:apply-templates/></dd> 
    </xsl:template>
    <xsl:template match="tei:availability">
        <xsl:choose>
            <xsl:when test="./tei:licence">
                <dt><xsl:value-of select="./tei:licence/name(.)"/></dt>
                <dd><xsl:apply-templates/><a target="_blank">
                    <xsl:attribute name="href">
                        <xsl:value-of select="./tei:licence/@target"/>
                    </xsl:attribute>
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                    </svg>            
                </a></dd>
            </xsl:when>
            <xsl:otherwise>
                <dt><xsl:value-of select="name(.)"/></dt>
                <dd><xsl:apply-templates/></dd>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
    <!-- seriesStmt -->
    <xsl:template match="tei:seriesStmt">
        <p style="text-transform:uppercase;text-align:left;"><xsl:value-of select="concat(substring-before(name(.),'Stmt'),'statement')"/></p>
        <dl class="teiHeader">
            <p><xsl:apply-templates/></p>
        </dl> 
    </xsl:template>
    <!-- notesStmt -->
    <xsl:template match="tei:notesStmt">
        <p style="text-transform:uppercase;text-align:left;"><xsl:value-of select="concat(substring-before(name(.),'Stmt'),'statement')"/></p>
        <dl class="teiHeader">
            <xsl:apply-templates/>
        </dl> 
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="@type='URI'">
                <xsl:apply-templates/>
                <a target="_blank">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
                    </xsl:attribute>
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                    </svg>            
                </a>               
            </xsl:when>
            <xsl:when test="@target and string-length(@target) > 10">
                <xsl:apply-templates/>
                <a target="_blank">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
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
    </xsl:template>
    <!-- sourceDesc -->
    <xsl:template match="tei:sourceDesc">
        <p style="text-transform:uppercase;text-align:left;"><xsl:value-of select="concat(name(.),'ription')"/></p>
        <dl class="teiHeader">
            <xsl:apply-templates/>
        </dl>                   
    </xsl:template>
    
    <xsl:template match="tei:affiliation">
        <dd><xsl:apply-templates/></dd>
    </xsl:template>
    <xsl:template match="tei:biblScope">
        <xsl:choose>
            <xsl:when test="@unit">
                <dd><span style="text-transform:uppercase;"><xsl:value-of select="@unit"/></span>: <xsl:apply-templates/></dd>
            </xsl:when>
            <xsl:when test="@volume">
                <dd><span style="text-transform:uppercase;"><xsl:value-of select="@volume"/></span>: <xsl:apply-templates/></dd>
            </xsl:when>
            <xsl:otherwise>
                <dd><xsl:apply-templates/></dd>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:measure">
        <dd><span style="text-transform:uppercase;"><xsl:value-of select="@type"/></span>: <xsl:apply-templates/></dd>
    </xsl:template>
    <xsl:template match="tei:msItem/tei:title">
        <dt><xsl:apply-templates/></dt>
    </xsl:template>
    <xsl:template match="tei:physDesc/tei:p | tei:msItem/tei:p | tei:msContents/tei:p">
        <p style="display:inline"><dd><xsl:apply-templates/></dd></p>       
    </xsl:template>
    <xsl:template match="tei:handNote">
        <dd><span style="text-transform:uppercase;"><xsl:value-of select="name(.)"/></span>: <xsl:apply-templates/></dd>
    </xsl:template>
    <xsl:template match="tei:origin">
        <dd><xsl:apply-templates/></dd>
    </xsl:template>
    <xsl:template match="tei:listWit">
        <xsl:choose>
            <xsl:when test="preceding-sibling::tei:msDesc or following-sibling::tei:msDesc">
                <dt><xsl:value-of select="./tei:head"/></dt>
                <xsl:for-each select="./tei:witness">
                    <dt><xsl:value-of select="name(.)"/></dt>
                    <dd><xsl:apply-templates/></dd>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- encodingDesc -->
    <xsl:template match="tei:encodingDesc">
        <div class="encodingDesc">
            <p style="text-transform:uppercase;text-align:left;"><xsl:value-of select="concat(name(.),'ription')"/></p>
            <dl class="teiHeader">
                <xsl:apply-templates/>
            </dl>            
        </div>
    </xsl:template>
    <xsl:template match="tei:editorialDecl/tei:p">
        <dd><xsl:apply-templates/></dd>
    </xsl:template>
    <xsl:template match="tei:hyphenation | tei:interpretation">
        <dd><span style="text-transform:uppercase;"><xsl:value-of select="name(.)"/></span>: <xsl:apply-templates/></dd>
    </xsl:template>
    <xsl:template match="tei:application">
        <dt><xsl:value-of select="name(.)"/></dt>
        <dd><xsl:apply-templates/></dd>
    </xsl:template>
    <xsl:template match="tei:styleDefDecl">
        <dt><xsl:value-of select="@scheme/name(.)"/></dt>
    </xsl:template>
    <xsl:template match="tei:rendition">
        <dd><span style="text-transform:uppercase;"><xsl:value-of select="concat(@scheme,' ')"/></span><xsl:apply-templates/></dd>
    </xsl:template>
    <xsl:template match="tei:projectDesc/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:ab">
        <dd><xsl:apply-templates/></dd>
    </xsl:template>
    <!-- profileDesc -->
    <xsl:template match="tei:profileDesc">
        <div class="profileDesc">
            <p style="text-transform:uppercase;text-align:left;"><xsl:value-of select="concat(name(.),'ription')"/></p>
            <dl class="teiHeader">
                <xsl:apply-templates/>
            </dl>            
        </div>
    </xsl:template>
    <xsl:template match="tei:abstract">
        <dt><xsl:value-of select="name(.)"/></dt>
        <dd><xsl:apply-templates/></dd>
    </xsl:template>
    <xsl:template match="tei:particDesc">
        <dt><xsl:value-of select="./tei:listPerson/tei:head"/></dt>
        <xsl:for-each select="./tei:listPerson/tei:person">
            <xsl:apply-templates/>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:correspAction">
        <dt><xsl:value-of select="@type"/></dt>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:correspContext">
        <dt><xsl:value-of select="substring-after(name(.),'corresp')"/></dt>
        <dd><xsl:apply-templates/></dd>
    </xsl:template>
    <xsl:template match="tei:language">
        <dt><xsl:value-of select="name(.)"/></dt>
        <dd><xsl:apply-templates/></dd>
    </xsl:template>
    <!-- revisionDesc -->
    <xsl:template match="tei:revisionDesc">
        <div class="revisionDesc">
            <p style="text-transform:uppercase;text-align:left;"><xsl:value-of select="concat(name(.),'ription')"/></p>
            <dl class="teiHeader">
                <xsl:apply-templates/>
            </dl>            
        </div>
    </xsl:template>
    <xsl:template match="tei:change">
        <xsl:choose>
            <xsl:when test="@xml:id='initial'">
                <dt>Created Start Date: <xsl:value-of select="@when"/></dt>
                <dd><xsl:apply-templates/></dd>
            </xsl:when>
            <xsl:when test="@notAfter">
                <dt>Created End Date: <xsl:value-of select="@notAfter"/></dt>
                <dd><xsl:apply-templates/></dd>
            </xsl:when>
            <xsl:otherwise>
                <dt>Date: <xsl:value-of select="@when"/></dt>
                <dd><xsl:apply-templates/></dd>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- generic for all -->
    <xsl:template match="tei:title">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <xsl:choose>
                    <xsl:when test="@type='main'">
                        <dt><xsl:value-of select="concat(@type,'-',name(.))"/></dt>
                        <dd><h3><xsl:apply-templates/></h3></dd>
                    </xsl:when>
                    <xsl:when test="@type='sub'">
                        <dt><xsl:value-of select="concat(@type,'-',name(.))"/></dt>
                        <dd><h4><xsl:apply-templates/></h4></dd>
                    </xsl:when>
                    <xsl:otherwise>
                        <dt><xsl:value-of select="name(.)"/></dt>
                        <dd><h5><xsl:apply-templates/></h5></dd>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="ancestor::tei:body">
                <xsl:choose>
                    <xsl:when test="@type='main'">
                        <h2><xsl:apply-templates/></h2>
                    </xsl:when>
                    <xsl:when test="@type='sub'">
                        <h3><xsl:apply-templates/></h3>
                    </xsl:when>
                    <xsl:otherwise>
                        <h2><xsl:apply-templates/></h2>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- in case the tei:back shall be visible this needs to be added here or antoher xsl:when created -->
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    <xsl:template match="tei:idno">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <xsl:choose>
                    <xsl:when test="@type='ISBN'">
                        <dd><span style="text-transform:uppercase;"><xsl:value-of select="concat(@type,': ')"/></span><xsl:apply-templates/></dd>       
                    </xsl:when>
                    <xsl:when test="@type='handle'">
                        <dd><xsl:apply-templates/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a></dd>
                    </xsl:when>
                    <xsl:when test="@type='URI'">
                        <dd><xsl:apply-templates/>
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a></dd>
                    </xsl:when>
                    <xsl:when test="@type='VIAF' and parent::tei:institution">
                        <dd><xsl:apply-templates/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat('http://viaf.org/viaf/',.)"/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a></dd>
                    </xsl:when>
                    <xsl:otherwise>
                        <dd><span style="text-transform:uppercase;"><xsl:value-of select="concat(@type,' ')"/></span><xsl:apply-templates/></dd>           
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="ancestor::tei:body">
                <xsl:choose>
                    <xsl:when test="@type='ISBN' and parent::tei:publicationStmt">
                        <span style="text-transform:uppercase;"><xsl:value-of select="concat(@type,': ')"/></span><xsl:apply-templates/>       
                    </xsl:when>
                    <xsl:when test="@type='handle' and parent::tei:publicationStmt">
                        <xsl:apply-templates/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a>
                    </xsl:when>
                    <xsl:when test="@type='VIAF' and parent::tei:institution">
                        <xsl:apply-templates/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat('http://viaf.org/viaf/',.)"/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <span style="text-transform:uppercase;"><xsl:value-of select="concat(@type,' ')"/></span><xsl:apply-templates/>            
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- in case the tei:back shall be visible this needs to be added here or antoher xsl:when created -->
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:template>
    <xsl:template match="tei:rs">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <xsl:variable name="refId">
                    <xsl:value-of select="substring-after(data(@ref), '#')"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="//id($refId)//rdf:Description">
                        <dd style="display:inline;"><xsl:apply-templates/>
                        <xsl:for-each select="//id($refId)//rdf:Description">
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="@rdf:about"/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a>
                        </xsl:for-each>
                        </dd>
                    </xsl:when>
                    <xsl:when test="//id($refId)//tei:idno">
                        <dd style="display:inline;"><xsl:apply-templates/>
                            <xsl:for-each select="//id($refId)//tei:idno">
                                <xsl:if test="string-length(name(.)) != 0">
                                <a target="_blank">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="."/>
                                    </xsl:attribute>
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                    </svg>            
                                </a> 
                                </xsl:if>
                            </xsl:for-each>
                        </dd>
                    </xsl:when>
                    <xsl:when test="starts-with(@ref,'#')">
                        <dd style="display:inline;"><xsl:apply-templates/></dd>                   
                    </xsl:when>
                    <xsl:when test="@ref">
                        <dd style="display:inline;"><xsl:apply-templates/>
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="@ref"/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a>
                        </dd>                   
                    </xsl:when>
                    <xsl:when test="@target">
                        <dd style="display:inline;"><xsl:apply-templates/>
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="@target"/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a></dd>                   
                    </xsl:when>
                    <xsl:otherwise>
                        <dd style="display:inline;"><xsl:apply-templates/></dd>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="ancestor::tei:body">
                <xsl:variable name="refId">
                    <xsl:value-of select="substring-after(data(@ref), '#')"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="//id($refId)//rdf:Description">
                        <xsl:apply-templates/>
                        <xsl:for-each select="//id($refId)//rdf:Description">
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="@rdf:about"/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="@ref">
                        <xsl:apply-templates/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@ref"/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a>                       
                    </xsl:when>
                    <xsl:when test="@target">
                        <xsl:apply-templates/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@target"/>
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
            </xsl:when>
            <xsl:otherwise>
                <!-- in case the tei:back shall be visible this needs to be added here or antoher xsl:when created -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>    
    <xsl:template match="tei:placeName">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <xsl:variable name="refId">
                    <xsl:value-of select="substring-after(data(@ref), '#')"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="//id($refId)//tei:idno">
                        <dd><xsl:apply-templates/>
                        <xsl:for-each select="//id($refId)//tei:idno">
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a> 
                        </xsl:for-each>
                        </dd>
                    </xsl:when>
                    <xsl:when test="starts-with(@ref,'#')">
                        <dd style="display:inline;"><xsl:apply-templates/></dd>                   
                    </xsl:when>
                    <xsl:when test="@ref">
                        <dd><xsl:apply-templates/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@ref"/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a></dd>                          
                    </xsl:when>
                    <xsl:otherwise>
                        <dd><xsl:apply-templates/></dd>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="ancestor::tei:body">
                <xsl:variable name="refId">
                    <xsl:value-of select="substring-after(data(@ref), '#')"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="//id($refId)//tei:idno">
                        <xsl:apply-templates/>
                        <xsl:for-each select="//id($refId)//tei:idno">
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="@ref">
                        <xsl:apply-templates/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@ref"/>
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
            </xsl:when>
            <xsl:otherwise>
                <!-- in case the tei:back shall be visible this needs to be added here or antoher xsl:when created -->
            </xsl:otherwise>
        </xsl:choose>                  
    </xsl:template>
    <xsl:template match="tei:name">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <xsl:variable name="refId">
                    <xsl:value-of select="substring-after(data(@ref), '#')"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="//id($refId)//tei:idno">
                        <dd><xsl:apply-templates/>
                        <xsl:for-each select="//id($refId)//tei:idno">
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a> 
                        </xsl:for-each>
                        </dd>
                    </xsl:when>
                    <xsl:when test="@key">
                        <dd><xsl:apply-templates/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@key"/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a></dd>                             
                    </xsl:when>
                    <xsl:otherwise>
                        <dd><xsl:apply-templates/></dd>
                    </xsl:otherwise>
                </xsl:choose> 
            </xsl:when>
            <xsl:when test="ancestor::tei:body">
                <xsl:variable name="refId">
                    <xsl:value-of select="substring-after(data(@ref), '#')"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="//id($refId)//tei:idno">
                        <xsl:apply-templates/>
                        <xsl:for-each select="//id($refId)//tei:idno">
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="@key">
                        <xsl:apply-templates/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@key"/>
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
            </xsl:when>
            <xsl:otherwise>
                <!-- in case the tei:back shall be visible this needs to be added here or antoher xsl:when created -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:persName">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
            <xsl:variable name="refId">
                <xsl:value-of select="substring-after(data(@ref), '#')"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="//id($refId)//tei:idno">
                    <dd><xsl:apply-templates/>
                    <xsl:for-each select="//id($refId)//tei:idno">
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a> 
                    </xsl:for-each>
                    </dd>
                </xsl:when>
                <xsl:when test="@key">
                    <dd><xsl:apply-templates/>
                    <a target="_blank">
                        <xsl:attribute name="href">
                            <xsl:value-of select="@key"/>
                        </xsl:attribute>
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                            <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                        </svg>            
                    </a></dd>                             
                </xsl:when>
                <xsl:when test="starts-with(@ref,'#')">
                    <dd style="display:inline;"><xsl:apply-templates/></dd>                   
                </xsl:when>
                <xsl:when test="@ref">
                    <dd><xsl:apply-templates/>
                    <a target="_blank">
                        <xsl:attribute name="href">
                            <xsl:value-of select="@ref"/>
                        </xsl:attribute>
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                            <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                        </svg>            
                    </a></dd>                               
                </xsl:when>
                <xsl:otherwise>
                    <dd><xsl:apply-templates/></dd>   
                </xsl:otherwise>
            </xsl:choose>
            </xsl:when>
            <xsl:when test="ancestor::tei:body">
                <xsl:variable name="refId">
                    <xsl:value-of select="substring-after(data(@ref), '#')"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="//id($refId)//tei:idno">
                        <xsl:apply-templates/>
                        <xsl:for-each select="//id($refId)//tei:idno">
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="@key">
                        <xsl:apply-templates/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@key"/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a>                              
                    </xsl:when>
                    <xsl:when test="@ref">
                        <xsl:apply-templates/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@ref"/>
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
            </xsl:when>
            <xsl:otherwise>
                <!-- in case the tei:back shall be visible this needs to be added here or antoher xsl:when created -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:date">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <xsl:choose>
                    <xsl:when test="@when and string-length(@when) = 10">
                        <dd><span class="date">
                            <xsl:attribute name="type">
                                <xsl:value-of select="'xs:date'"/>
                            </xsl:attribute>
                            <xsl:variable name="d" as="xs:date" select="@when"/>
                            <xsl:value-of select="format-date($d, '[F] [D]. [MNn] [Y]', 'de',(),())"/>
                        </span></dd>
                    </xsl:when>
                    <xsl:when test="@when-iso">
                        <dd><span class="date">
                            <xsl:attribute name="type">
                                <xsl:value-of select="'xs:date'"/>
                            </xsl:attribute>
                            <xsl:variable name="d" as="xs:date" select="@when-iso"/>
                            <xsl:value-of select="format-date($d, '[F] [D]. [MNn] [Y]', 'de',(),())"/>
                        </span></dd>
                    </xsl:when>
                    <xsl:otherwise>
                        <dd style="display:inline;"><span class="date">                                       
                            <xsl:apply-templates/> 
                        </span></dd>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="ancestor::tei:body">
                <xsl:choose>
                    <xsl:when test="@when and string-length(@when) = 10">
                        <span class="date">
                            <xsl:attribute name="type">
                                <xsl:value-of select="'xs:date'"/>
                            </xsl:attribute>
                            <xsl:variable name="d" as="xs:date" select="@when"/>
                            <xsl:value-of select="format-date($d, '[F] [D]. [MNn] [Y]', 'de',(),())"/>
                        </span>
                    </xsl:when>
                    <xsl:when test="@when-iso">
                        <span class="date">
                            <xsl:attribute name="type">
                                <xsl:value-of select="'xs:date'"/>
                            </xsl:attribute>
                            <xsl:variable name="d" as="xs:date" select="@when-iso"/>
                            <xsl:value-of select="format-date($d, '[F] [D]. [MNn] [Y]', 'de',(),())"/>
                        </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <span class="date">                                       
                            <xsl:apply-templates/> 
                        </span>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- in case the tei:back shall be visible this needs to be added here or antoher xsl:when created -->
            </xsl:otherwise>
        </xsl:choose>                          
    </xsl:template>
    <xsl:template match="tei:time">
        <span class="time">
            <xsl:apply-templates/>
        </span>
    </xsl:template> 
    <xsl:template match="tei:note">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <dt><xsl:value-of select="name(.)"/></dt>
                <dd><xsl:apply-templates/></dd>
            </xsl:when>
            <xsl:when test="ancestor::tei:body">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <!-- in case the tei:back shall be visible this needs to be added here or antoher xsl:when created -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:settlement | tei:institution | tei:collection | tei:repository | tei:country">
        <xsl:variable name="refId">
            <xsl:value-of select="substring-after(data(@ref), '#')"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <xsl:choose>
                    <xsl:when test="@key">
                        <dt><xsl:value-of select="name(.)"/></dt>
                        <dd><xsl:apply-templates/><a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@key"/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a></dd>
                    </xsl:when>
                    <xsl:when test="@target">
                        <dt><xsl:value-of select="name(.)"/></dt>
                        <dd><xsl:apply-templates/><a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@target"/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a></dd>
                    </xsl:when>
                    <xsl:when test="//id($refId)//tei:idno">               
                        <dd><xsl:apply-templates/>
                            <xsl:for-each select="//id($refId)//tei:idno">
                                <a target="_blank">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="."/>
                                    </xsl:attribute>
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                    </svg>            
                                </a>
                            </xsl:for-each>
                        </dd>
                    </xsl:when>           
                    <xsl:otherwise>
                        <dt><xsl:value-of select="name(.)"/></dt>
                        <dd><xsl:apply-templates/></dd>                       
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="ancestor::tei:body">
                <xsl:choose>
                    <xsl:when test="@key">
                        <xsl:value-of select="name(.)"/>
                        <xsl:apply-templates/><a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@key"/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a>
                    </xsl:when>
                    <xsl:when test="@target">
                        <xsl:value-of select="name(.)"/>
                        <xsl:apply-templates/><a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@target"/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a>
                    </xsl:when>
                    <xsl:when test="//id($refId)//tei:idno">               
                        <xsl:apply-templates/>
                        <xsl:for-each select="//id($refId)//tei:idno">
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>            
                            </a>
                        </xsl:for-each>                        
                    </xsl:when>           
                    <xsl:otherwise>
                        <xsl:value-of select="name(.)"/>
                        <xsl:apply-templates/>                      
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- in case the tei:back shall be visible this needs to be added here or antoher xsl:when created -->
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    <xsl:template match="tei:table">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <table id="projectDesc">
                    <tbody>
                        <xsl:for-each select="./tei:row">
                            <tr><xsl:apply-templates/></tr>                                                          
                        </xsl:for-each>
                    </tbody>
                </table>                                  
            </xsl:when>
        </xsl:choose>  
    </xsl:template>
    <xsl:template match="tei:cell">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <td><xsl:apply-templates/></td>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:list">
        <xsl:choose>
            <xsl:when test="ancestor::tei:teiHeader">
                <xsl:for-each select="./tei:head">
                    <dt><xsl:apply-templates/></dt>
                </xsl:for-each>
                <xsl:for-each select="./tei:item">
                    <dd><xsl:apply-templates/></dd>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="ancestor::tei:body">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <!-- in case the tei:back shall be visible this needs to be added here or antoher xsl:when created -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="@type='URI'">
                <xsl:apply-templates/>
                <a target="_blank">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
                    </xsl:attribute>
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                    </svg>            
                </a>               
            </xsl:when>
            <xsl:when test="@target and string-length(@target) > 10">
                <xsl:apply-templates/>
                <a target="_blank">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
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
    </xsl:template>
</xsl:stylesheet>