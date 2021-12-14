<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:dc11="http://purl.org/dc/elements/1.1/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:arche="https://vocabs.acdh.oeaw.ac.at/schema#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
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
    
    <xsl:param name="iiif"/>
    <xsl:param name="arche_root_col_url"/>
    
    <xsl:template name="cards">
        <!-- ######## add active or fade to classes ########## -->
        <div class="tab-pane container active" id="home" tabindex="-1">
            <div class="row">
                <div class="col-md-12 content-area"> 
                    <!-- ######## Title and Navigation ########## -->
                    
                    <div class="card">                       
                        <!-- ######## card body for body templates ########## -->
                        <xsl:apply-templates select="//tei:body"/>             
                    </div>  
                    
                </div><!-- .content-area -->
            </div> <!-- .row -->
        </div>  
    </xsl:template>
    <!-- ####################################### ################## --> 
    <!-- ################## body templates start ################## --> 
    <!-- ####################################### ################## --> 
    <xsl:template match="tei:table"> 
        <div class="vehicle-goods-container card border-secondary">
            <div class="card-header">
                <h2><xsl:value-of select="preceding-sibling::tei:head"/></h2> 
            </div>
            <div class="card-body table-responsive">
                <xsl:choose>
                    <xsl:when test="./tei:row[@role='label']">
                        <table class="table table-striped table-hover">
                            <xsl:attribute name="id">
                                <xsl:value-of select="'tableTwo'"/>
                            </xsl:attribute>
                            <thead>
                                <xsl:for-each select="./tei:row[@role='label']">                                
                                    <tr>
                                        <xsl:apply-templates/>
                                    </tr>                                                                                     
                                </xsl:for-each>
                            </thead>
                            <tbody>
                                <xsl:for-each select="./tei:row[@role='data']">                        
                                    <tr>
                                        <xsl:apply-templates/>
                                    </tr>                                                                             
                                </xsl:for-each>
                            </tbody>
                        </table>                        
                    </xsl:when>
                    <xsl:otherwise>
                        <table class="table table-striped table-hover">
                            <xsl:attribute name="id">
                                <xsl:value-of select="'tableOne'"/>
                            </xsl:attribute>
                            <thead>
                                <tr>
                                    <xsl:for-each select="./tei:row/tei:cell[@role='label']">                                                       
                                        <td><xsl:apply-templates/></td>                                                                                                             
                                    </xsl:for-each>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <xsl:for-each select="./tei:row/tei:cell[@role='data']">                                                  
                                        <td><xsl:apply-templates/></td>                                                                                                                
                                    </xsl:for-each>
                                </tr>
                            </tbody>
                        </table>
                        <div id="OSD-images">
                            <!-- image container accessed by OSD script -->
                            <div id="non-OSD-images">
                                <!-- #non-OSD-images is removed with openSeaDragon script -->
                                <!-- if no script is available it holds the images from tei/xml -->
                                <xsl:apply-templates select="//tei:facsimile"/>
                            </div>
                        </div>
                        <div>
                            <xsl:for-each select="//tei:facsimile/tei:graphic">
                                <a target="_blank">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="@url"/>
                                    </xsl:attribute>
                                    <span style="color:red;margin-right:10px;">Bild in seperatem Fenster öffnen /</span>
                                </a>
                            </xsl:for-each>
                        </div>                        
                    </xsl:otherwise>
                </xsl:choose>
            </div>                        
        </div>                                                        
    </xsl:template>   
    <xsl:template match="tei:cell">   
        <xsl:choose>
            <xsl:when test="@role='label'">
                <th>
                    <xsl:apply-templates/>
                </th> 
            </xsl:when>
            <xsl:when test="@role='data'">
                <td>
                    <xsl:apply-templates/>
                </td> 
            </xsl:when>
            <xsl:otherwise>
                <td>
                    <xsl:apply-templates/>
                </td>                
            </xsl:otherwise>
        </xsl:choose>       
    </xsl:template>   
    <xsl:template match="tei:hi">
        <span class="sub-th"><xsl:apply-templates/></span>
    </xsl:template>
    <!-- body templates end -->    
    
</xsl:stylesheet>