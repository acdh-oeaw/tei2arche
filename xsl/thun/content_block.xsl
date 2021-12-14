<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:dc11="http://purl.org/dc/elements/1.1/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:arche="https://vocabs.acdh.oeaw.ac.at/schema#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei my" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget content_html_cards</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied to html:body inside div with class tab-content</p>
            <p>The template "cards" adds the standard bootstrap html cards structure to your HTML body.</p>
            <p>Depending on how many cards are needed, please duplicate the div with class tab-pane with all childrens as often as you need.</p>
            <p>
                Class col-md-12 creates a full width container that inherits the widt from its parents.
                If you want smaller content sized cards col-md-2 / 4 / 6 / 8 / 10 are available. simply change the integer of the class name.
            </p>
            <p>
                The id of class tab-pane must be adapted to the navigation list items e.g. href="#home" of the navigation
                will call the container with id="home".
            </p>
            <p>This template is called by the main transformation template within the body.</p>
            <p>Furthermore, inside class card the content template is called. In case there are more than one cards,
            please adapt the names of id and the template that is called inside the class card.</p>
            <p>In order for bootstrap to work add class "active" to the tab-pane that shall be visible on page load.
            Add class "fade" to all other tab-panes.</p>
        </desc>    
    </doc> 
    
    <xsl:template name="cards">
        <!-- ######## add active or fade to classes ########## -->
        
        <div class="tab-pane container active" id="home" tabindex="-1">
            <div class="row">
                <div class="col-md-12 content-area" id="home-area">  
                    <xsl:call-template name="header-nav"/>
                    <div class="card">                        
                        <div class="card-header">
                            <h3 class="body_translations" title="Regest">Regest</h3>
                        </div>
                        <div class="card-body">
                            <xsl:for-each select="//tei:msContents"> 
                                <xsl:apply-templates/>
                            </xsl:for-each>   
                        </div>
                        <div class="card-header">
                            <h3 class="body_translations" title="Anmerkungen zum Dokument">Anmerkungen zum Dokument</h3>
                        </div>
                        <div class="card-body">
                            <xsl:for-each select="//tei:physDesc"> 
                                <xsl:apply-templates/>
                            </xsl:for-each>   
                        </div>
                        <div class="card-header">
                            <h3 class="body_translations" title="Schlagworte">Schlagworte</h3>
                        </div>
                        <div class="card-body">
                            <xsl:for-each select="//tei:index/tei:term"> 
                                <span class="badge bg-primary text-light"><xsl:apply-templates/></span>
                            </xsl:for-each>                                                                             
                        </div>
                        <div class="card-header">
                            <h3 class="body_translations" title="Editierter Text">Editierter Text</h3>
                        </div>
                        <div class="card-body">
                            <xsl:apply-templates select="//tei:body"/>                                                                                  
                        </div>
                    </div>
                    <div class="card card-footer">
                        <xsl:call-template name="tei-note-footnote"/> 
                        <hr/>
                        <h3 class="body_translations" title="Zitierhinweis">Zitierhinweis</h3>
                        <blockquote class="blockquote">
                            <cite title="Source Title">
                                <xsl:value-of select="//tei:msIdentifier"/>
                                <span class="body_translations" title="; hrsg von Brigitte Mazohl, Christof Aichner und Tanja Kraler, In: Die Korrespondenz von Leo von Thun-Hohenstein, ">
                                    <xsl:text>; hrsg von Brigitte Mazohl, Christof Aichner und Tanja Kraler, In: Die Korrespondenz von Leo von Thun-Hohenstein, </xsl:text>
                                </span>
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="//tei:publicationStmt/tei:p/tei:idno"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="concat('(', //tei:publicationStmt/tei:p/tei:idno)"/>
                                </a>
                                <span class="body_translations" title=", aufgerufen am ">, aufgerufen am </span>
                                <span class="body_translations" title="{format-date(current-date(), '[D].[M].[Y]')}">
                                    <xsl:value-of select="format-date(current-date(), '[D].[M].[Y]')"/>
                                </span>
                                <xsl:text>)</xsl:text>
                            </cite>
                        </blockquote>
                    </div> 
                </div><!-- .content-area -->
            </div> <!-- .row -->
        </div><!-- div #home -->
        
    </xsl:template>
    <!-- ####################################### ################## --> 
    <!-- ################## body templates start ################## --> 
    <!-- ####################################### ################## --> 
    
    <!-- create project specific templates here -->
    <xsl:template match="tei:body">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:div">
        <div class="{@type}">
            <xsl:if test="@xml:id">
                <xsl:attribute name="id">
                    <xsl:value-of select="lower-case(@xml:id)"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>    
    </xsl:template>
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="contains(@target, '.xml')">
                <xsl:variable name="url" select="tokenize(@target, '/')"/>
                <a href="{concat($arche-id, $url[last()], $transform)}"><xsl:apply-templates/></a>
            </xsl:when>
            <xsl:otherwise>
                <a href="{lower-case(@target)}">
                    <xsl:apply-templates/>
                </a>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    <xsl:template match="tei:p">
        <span class="card-text text"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="tei:index">
     
    </xsl:template>
    <xsl:template match="tei:lb">
        <xsl:for-each select=".">
            <br/>
        </xsl:for-each>        
    </xsl:template>
    <xsl:template match="tei:desc/tei:title">
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>