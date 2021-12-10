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
 
    
    <xsl:template name="cards">                            
        <div class="tab-pane container active" id="home" tabindex="-1">
            <div class="row">
                
                <div class="col-md-12 content-area" id="home-area">                                        
                    <xsl:apply-templates select="//tei:body"/>
                    
                    <xsl:if test="exists(contains(//tei:table/@xml:id,'crew_table_stations'))">
                        <div class="card border-secondary" id="crew-area">
                            <div class="card-header">
                                <h3 class="body_translations" title="Crew Stationen">Crew Stationen</h3>                                                
                            </div>
                            <div class="card-body table-responsive">
                                <table style="width:100%;" class="table table-striped table-hover" id="tableThree">
                                    <thead>                          
                                        <tr>          
                                            <th><abbr title="Full name of the Person"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-info-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                <path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z"/>
                                                <circle cx="8" cy="4.5" r="1"/>
                                            </svg></abbr>Name</th>                                                                                  
                                            <th><abbr title="The type of the relation between Place/Institution and the Person"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-info-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                <path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z"/>
                                                <circle cx="8" cy="4.5" r="1"/>
                                            </svg></abbr><span class="body_translations" title="Art der Verbindung">Art der Verbindung</span></th>
                                            <th><abbr title="The Institution the Person was kept"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-info-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                <path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z"/>
                                                <circle cx="8" cy="4.5" r="1"/>
                                            </svg></abbr>Institution</th>
                                            <th><abbr title="The Location the Person was kept"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-info-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                <path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z"/>
                                                <circle cx="8" cy="4.5" r="1"/>
                                            </svg></abbr><span class="body_translations" title="Ort">Ort</span></th>
                                            <th><abbr title="start date"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-info-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                <path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z"/>
                                                <circle cx="8" cy="4.5" r="1"/>
                                            </svg></abbr><span class="body_translations" title="von">von</span></th>
                                            <th><abbr title="end date"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-info-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                <path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z"/>
                                                <circle cx="8" cy="4.5" r="1"/>
                                            </svg></abbr><span class="body_translations" title="bis">bis</span></th>
                                        </tr>                                                     
                                    </thead>
                                    <tbody>
                                        <xsl:for-each select="//tei:table">
                                            <xsl:choose>
                                                <xsl:when test="@xml:id='crew_table'">
                                                    <xsl:for-each select="./tei:row[matches(@xml:id,'crew_table_row')]/tei:cell[@role='data']/tei:surname">
                                                        <xsl:variable name="crew-names" select="concat(ancestor::tei:row/tei:cell/tei:surname,' ', ancestor::tei:row/tei:cell/tei:forename[@type='middle'],' ', ancestor::tei:row/tei:cell/tei:forename[@type='first'])"/>
                                                        <xsl:for-each select="ancestor::tei:row[@role='data']/tei:cell[@role='data']/tei:table/tei:row[matches(@xml:id,'crew_table_stations_row')]">                                                                    
                                                            <tr>
                                                                <td class="crew-names-m"><xsl:value-of select="$crew-names"/></td><!-- create cell from variable #crew_table tei:surnames -->
                                                                <xsl:for-each select="./tei:cell[@role='data']">                                                                                        
                                                                    <td class="crew-destiny-m"><xsl:apply-templates/></td>
                                                                </xsl:for-each><!-- ./cell role data -->
                                                            </tr>                                                                        
                                                        </xsl:for-each> <!-- #crew_table_stations_row -->
                                                    </xsl:for-each> <!-- //surname -->
                                                </xsl:when><!-- #crew_table -->
                                                <xsl:otherwise>
                                                    
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each><!-- tei:table loop -->
                                    </tbody>
                                </table>
                            </div><!-- .card-body -->                                                
                        </div><!-- #crew-are-->
                    </xsl:if>
                    
                </div><!-- .content-area -->
            </div> <!-- .row -->
        </div>
            
            <!--<div class="tab-pane container fade" id="collections" tabindex="-1">
                <div class="row">                                    
                    <div class="col-md-12 content-area" id="collections-area"> 
                        <div class="card border-secondary">
                            <xsl:call-template name="jstree">
                                <xsl:with-param name="arche_root_col_url" select="$arche_root_col_url"/>
                            </xsl:call-template>
                        </div>                                                                                                                                                            
                    </div><!-\- .content-area -\->
                </div> <!-\- .row -\->
            </div>-->
           
    </xsl:template>
    
    <!-- ####################################### ################## --> 
    <!-- ################## body templates start ################## --> 
    <!-- ####################################### ################## --> 
    <!-- body templates start -->
    <xsl:template match="tei:head">
        <xsl:choose>
            <xsl:when test="parent::tei:div[@type='main']">
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:div">
        <xsl:choose>
            <xsl:when test="@xml:id='bomber'">
                <div>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </div>                
            </xsl:when>
            <xsl:when test="@xml:id='crew'">
                <div>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </div>                
            </xsl:when>
            <xsl:otherwise>
                <div><xsl:apply-templates/></div>             
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    <xsl:template match="tei:table">
        <xsl:choose>
            <xsl:when test="@xml:id='bomber_table'">
                <div class="card border-secondary">
                    <div class="card-header">
                        <h2 class="body_translations" title="{substring-before(substring-after(tei:head[@xml:id='bomber_table_head'],'zum '), ':')}"><xsl:value-of select="substring-before(substring-after(tei:head[@xml:id='bomber_table_head'],'zum '), ':')"/></h2> 
                    </div>
                    <div id="bomber-container" class="card-body table-responsive">
                        <table class="table table-striped table-hover">
                            <xsl:attribute name="id">
                                <xsl:value-of select="'tableOne'"/>
                            </xsl:attribute>                                                      
                            <tbody>
                                <xsl:call-template name="row-bomber"/>
                            </tbody>          
                        </table>
                    </div>  
                </div>
            </xsl:when>
            <xsl:when test="@xml:id='crew_table'">
                <div class="card border-secondary">
                    <div class="card-header">
                        <h2 class="body_translations" title="{substring-before(substring-after(tei:head[@xml:id='crew_table_head'],'Die '), ' des Flugzeug')}"><xsl:value-of select="substring-before(substring-after(tei:head[@xml:id='crew_table_head'],'Die '), ' des Flugzeug')"/></h2>
                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-striped table-hover">
                            <xsl:attribute name="id">
                                <xsl:value-of select="'tableTwo'"/>
                            </xsl:attribute>
                            <thead>
                                <xsl:for-each select="tei:row[@role='label']">
                                    <tr><xsl:apply-templates/></tr>
                                </xsl:for-each>                       
                            </thead>
                            <tbody>
                                <xsl:for-each select="tei:row[@role='data']">
                                    <tr><xsl:apply-templates/></tr>
                                </xsl:for-each>
                            </tbody>          
                        </table>
                    </div>
                </div>                
            </xsl:when>
            <xsl:otherwise>
                
            </xsl:otherwise>
        </xsl:choose>        
        <xsl:if test="matches(@xml:id,'crew_table_stations')">
            <a style="color:#444 !important;" title="Crew Information" class="nav-link" href="#crew-area">Info</a>
        </xsl:if>        
    </xsl:template>
    <xsl:template name="row-bomber">
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][1]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][1]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][2]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][2]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][3]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][3]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][4]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][4]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][5]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][5]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][6]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][6]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][7]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][7]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][8]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][8]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][9]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][9]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][10]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][10]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][11]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][11]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][12]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][12]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][13]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][13]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][14]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][14]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>
        <tr>
            <xsl:for-each select="./tei:row[@role='label']/tei:cell[@role='label'][15]">
                <th><xsl:apply-templates/></th>
            </xsl:for-each>
            <xsl:for-each select="./tei:row[@role='data']/tei:cell[@role='data'][15]">
                <td><xsl:apply-templates/></td>
            </xsl:for-each>
        </tr>               
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
    <!-- body templates end -->
    
</xsl:stylesheet>