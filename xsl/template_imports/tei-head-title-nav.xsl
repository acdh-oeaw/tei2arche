<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-head-title-nav.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied in html:body.</p>
            <p>The template "tei-head-title-nav" handles the tei/xml head tag and creates a header with links to prev and next pages.</p> 
        </desc>    
    </doc>
    
    <xsl:param name="baseURL" select="//@xml:base"/>
    <xsl:param name="next" select="//@next"/>
    <xsl:param name="prev" select ="//@prev"/>
    <xsl:param name="tei-source"/>
    <xsl:param name="currentIx"/>
    <xsl:param name="amount"/>
    <xsl:param name="transform"/>
    
    <xsl:template match="tei:head">
        <!-- ########## parameters ######### -->
        <xsl:param name="next" select="//@next"/>
        <xsl:param name="prev" select ="//@prev"/>
        
        <xsl:choose>
            <xsl:when test="parent::tei:div[@type='main']">
                <div class="card border-primary">
                    <div class="row">
                        <div class="col-md-2 card-body">                        
                            <h2>
                                <xsl:if test="string-length($prev) != 0">
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="concat(replace($prev,'/data',''),$transform)"/>
                                        </xsl:attribute>
                                        <svg class="arrow svg-inline--fa fa-chevron-left fa-w-10" title="previous" aria-labelledby="svg-inline--fa-title-1" data-prefix="fas" data-icon="chevron-left" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" data-fa-i2svg=""><title id="svg-inline--fa-title-1">previous</title><path fill="currentColor" d="M34.52 239.03L228.87 44.69c9.37-9.37 24.57-9.37 33.94 0l22.67 22.67c9.36 9.36 9.37 24.52.04 33.9L131.49 256l154.02 154.75c9.34 9.38 9.32 24.54-.04 33.9l-22.67 22.67c-9.37 9.37-24.57 9.37-33.94 0L34.52 272.97c-9.37-9.37-9.37-24.57 0-33.94z"></path></svg><!-- <i class="fas fa-chevron-left" title="previous"></i> -->
                                    </a>
                                </xsl:if>
                            </h2>                        
                        </div>                        
                        <div class="col-md-8 card-body">
                            <h2 style="text-align:center;">
                                <xsl:apply-templates/>
                                <br/>
                                <a href="#">
                                    <i class="fas fa-info" title="show more info about the document" data-toggle="modal" data-target="#exampleModalLong"/>
                                </a> 
                                |
                                <a target="_blank">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat($tei-source,'?format=raw')"/>
                                    </xsl:attribute>
                                    <i class="fas fa-download" title="show TEI source"/>
                                </a>
                            </h2>
                            <!-- ############## SLIDER ############# -->
                            <!--<h2 style="text-align:center;">
                                <input type="range" min="1" max="{$amount}" value="{$currentIx}" data-rangeslider="" style="width:100%;"/>
                                <a id="output" class="btn btn-main btn-outline-primary btn-sm" href="show.html?document=entry__1879-03-03.xml&amp;directory=editions" role="button">go to </a>
                            </h2>-->
                        </div>
                        <div class="col-md-2 card-body">
                            <h2 style="text-align:right;">
                                <xsl:if test="string-length($next) != 0">
                                    <a href="#">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="concat(replace($next,'/data',''),$transform)"/>
                                        </xsl:attribute>
                                        <svg class="arrow svg-inline--fa fa-chevron-right fa-w-10" title="next" aria-labelledby="svg-inline--fa-title-2" data-prefix="fas" data-icon="chevron-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" data-fa-i2svg=""><title id="svg-inline--fa-title-2">next</title><path fill="currentColor" d="M285.476 272.971L91.132 467.314c-9.373 9.373-24.569 9.373-33.941 0l-22.667-22.667c-9.357-9.357-9.375-24.522-.04-33.901L188.505 256 34.484 101.255c-9.335-9.379-9.317-24.544.04-33.901l22.667-22.667c9.373-9.373 24.569-9.373 33.941 0L285.475 239.03c9.373 9.372 9.373 24.568.001 33.941z"></path></svg><!-- <i class="fas fa-chevron-right" title="next"></i> -->
                                    </a>
                                </xsl:if>
                            </h2>                        
                        </div>
                    </div><!-- .row -->
                </div><!-- .card-header -->
            </xsl:when>
            <xsl:otherwise>
                
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
</xsl:stylesheet>