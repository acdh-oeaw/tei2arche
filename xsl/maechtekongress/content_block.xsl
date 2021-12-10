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
    
    <xsl:param name="arche_root_col_url"/>
    
    <xsl:template name="cards">
        <xsl:param name="arche_root_col_url"/>
        <!-- ######## add active or fade to classes ########## -->
        <div class="tab-pane container active" id="home" tabindex="-1">
            <div class="row">
                <div class="col-md-12 content-area"> 
                    <!-- ######## Title and Navigation ########## -->
                    <xsl:call-template name="header-nav"/>                     
                    
                    <div class="card">                       
                        <!-- ######## card body for body templates ########## -->
                        <div class="card-body">
                            <xsl:apply-templates select="//tei:body"/>
                        </div>               
                    </div>  
                    
                    <div class="card card-footer">
                        <xsl:call-template name="tei-note-footnote"/> 
                        <xsl:call-template name="footnote-citation"/>
                    </div>
                    
                </div><!-- .content-area -->
            </div> <!-- .row -->
        </div>  
    </xsl:template>
    <!-- ####################################### ################## --> 
    <!-- ################## body templates start ################## --> 
    <!-- ####################################### ################## --> 
    
    <!-- create project specific templates here -->    
    <xsl:template match="tei:body">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:div">
        <xsl:choose>
            <xsl:when test="id(substring-after(data(@hand),'#'))">
                <xsl:for-each select="id(substring-after(data(@hand),'#'))">
                    <div><span class="badge bg-light text-dark"><small>Hand: <xsl:apply-templates/></small></span></div>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
        <br/>
        <xsl:apply-templates/>              
    </xsl:template> 
    <xsl:template match="tei:head">
        <h2 style="text-align:center;"><xsl:apply-templates/></h2>
    </xsl:template>
    <xsl:template match="tei:country">
        <span class="place-org"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="tei:p">
        <xsl:for-each select=".">
            <span class="card-text text"><xsl:apply-templates/></span>
        </xsl:for-each>  
    </xsl:template>
    <xsl:template match="tei:pb">
        <hr/>
        <div style="text-align:right;"><small><xsl:text>[Bl. </xsl:text><xsl:value-of select="@n"/><xsl:text>]</xsl:text></small></div>
        <br/>
    </xsl:template>
    <xsl:template match="tei:subst">
        <hr/>
        <xsl:choose>
            <xsl:when test="id(substring-after(data(@hand),'#'))">
                <xsl:for-each select="id(substring-after(data(@hand),'#'))">
                    <div><span class="badge bg-light text-dark"><small>Hand: <xsl:apply-templates/></small></span></div>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:add">
        <xsl:variable name="add">
            <xsl:apply-templates/>
        </xsl:variable>     
        <xsl:choose>
            <xsl:when test="id(substring-after(data(@hand),'#'))">
                <xsl:for-each select="id(substring-after(data(@hand),'#'))">
                    <div>  
                        <span class="badge bg-light text-dark">
                            <small><abbr>
                                <xsl:attribute name="title">
                                    <xsl:apply-templates/>
                                </xsl:attribute>
                                <xsl:value-of select="$add"/>
                            </abbr></small>
                        </span>
                    </div>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose> 
        <br/>
    </xsl:template>
    <xsl:template match="tei:opener">
        <p style="text-align:right;"><span><xsl:apply-templates/></span></p>
    </xsl:template>
    <xsl:template match="tei:date">
        <xsl:choose>
            <xsl:when test="@when and string-length(@when) = 10">
                <span class="date">
                    <xsl:attribute name="type">
                        <xsl:value-of select="'xs:date'"/>
                    </xsl:attribute>
                    <xsl:variable name="d" as="xs:date" select="@when"/>
                    <xsl:value-of select="format-date($d, '[F] [D]. [MNn] [Y]', 'en','ISO','en')"/>
                </span>
            </xsl:when>
            <xsl:when test="@when-iso">
                <span class="date">
                    <xsl:attribute name="type">
                        <xsl:value-of select="'xs:date'"/>
                    </xsl:attribute>
                    <xsl:variable name="d" as="xs:date" select="@when-iso"/>
                    <xsl:value-of select="format-date($d, '[F] [D]. [MNn] [Y]', 'en','ISO','en')"/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="date">                                       
                    <xsl:apply-templates/> 
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:signed">
        <p style="margin-right:2em;text-align:right;">       
            <small>[Unterschriften nicht originalschriftlich: Protokoll]</small>
            <xsl:for-each select="./tei:list">
                <ul style="margin-right:2em;text-align:right;">
                    <xsl:for-each select="./tei:item">
                        <li><xsl:apply-templates/></li>
                    </xsl:for-each>
                </ul>
            </xsl:for-each>
        </p> 
    </xsl:template>
    <xsl:template match="tei:gap">
        <br/>
    </xsl:template>
    <xsl:template match="tei:signed/tei:list/tei:item/tei:persName">
        <xsl:variable name="refID-body" select="substring-after(@ref, '#')"/>
        <!-- Trigger the modal with a link -->                   
        <span class="person"><a href="" data-toggle="modal" data-target="#{replace($refID-body,'\.','_')}">
            <xsl:attribute name="data-type">
                <xsl:value-of select="'listperson'"/>
            </xsl:attribute>
            <xsl:attribute name="data-key">
                <xsl:value-of select="replace($refID-body,'\.','_')"/>
            </xsl:attribute>                                
            <xsl:apply-templates/>
        </a></span>  
        <xsl:choose>
            <xsl:when test="//id($refID-body)">                                  
                <xsl:for-each select="//id($refID-body)">                            
                    <!-- Modal -->
                    <div id="{replace($refID-body,'\.','_')}" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title"><xsl:value-of select="./tei:persName"/></h4>
                                    <h4><button type="button" class="ml-2 mb-1 close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button></h4>                                                        
                                </div>
                                <div class="modal-body">
                                    <table class="table table-striped">
                                        <tbody>
                                            <xsl:if test="exists(./tei:idno)">
                                                <tr>
                                                    <xsl:choose>
                                                        <xsl:when test="./tei:idno[@type='URL' or @type='URI' or @type='GND' or @type='VIAF']">
                                                            <th>
                                                                Uri
                                                            </th>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <th>
                                                                ID
                                                            </th>
                                                        </xsl:otherwise>
                                                    </xsl:choose>     
                                                    <xsl:choose>
                                                        <xsl:when test="./tei:idno[@type='URL' or @type='URI' or @type='GND' or @type='VIAF']">
                                                            <td><ul>
                                                                <xsl:for-each select="./tei:idno">
                                                                    <li><a target="_blank">
                                                                        <xsl:attribute name="href">
                                                                            <xsl:apply-templates/>
                                                                        </xsl:attribute>
                                                                        <xsl:apply-templates/>                                                         
                                                                    </a></li>                                                                            
                                                                </xsl:for-each>
                                                            </ul></td>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <td><ul>
                                                                <xsl:for-each select="./tei:idno">
                                                                    <li><xsl:value-of select="./@type"/>: <xsl:apply-templates/></li>
                                                                </xsl:for-each>
                                                            </ul></td>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </tr>
                                            </xsl:if>                                                   
                                            <xsl:if test="exists(./tei:persName)">
                                                <tr>
                                                    <th>Name</th>
                                                    <td><xsl:value-of select="./tei:persName"/></td>
                                                </tr>
                                            </xsl:if> 
                                            <xsl:if test="exists(./tei:occupation)">
                                                <tr>
                                                    <th>Arbeit</th>
                                                    <td><ul>
                                                        <xsl:for-each select="./tei:occupation">
                                                            <li><xsl:apply-templates/></li>
                                                        </xsl:for-each> 
                                                    </ul></td>
                                                </tr>
                                            </xsl:if>
                                            <xsl:if test="exists(./tei:birth)">
                                                <xsl:choose>
                                                    <xsl:when test="./tei:birth/tei:date">
                                                        <xsl:for-each select="./tei:birth/tei:date">
                                                            <tr>
                                                                <th class="body-translations" title="Geburtsdatum">Geburtsdatum</th>                                                              
                                                                <td>
                                                                    <xsl:apply-templates/>                                                                  
                                                                </td> 
                                                            </tr>                                                            
                                                        </xsl:for-each>   
                                                    </xsl:when>
                                                    <xsl:when test="./tei:birth/tei:placeName">
                                                        <xsl:for-each select="./tei:birth/tei:placeName">
                                                            <tr>
                                                                <th class="body-translations" title="Geburtsort">Geburtsort</th> 
                                                                <td>                                                                    
                                                                    <xsl:apply-templates/>                                                                
                                                                </td> 
                                                            </tr>   
                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:for-each select="./tei:birth">
                                                            <tr>
                                                                <th class="body-translations" title="Geburtsdatum">Geburtsdaten</th>                                                              
                                                                <td>
                                                                    <xsl:apply-templates/>                                                                  
                                                                </td> 
                                                            </tr>                                                            
                                                        </xsl:for-each>                                                                  
                                                    </xsl:otherwise>
                                                </xsl:choose>                                                        
                                            </xsl:if>
                                            <xsl:if test="exists(./tei:death)">
                                                <xsl:choose>
                                                    <xsl:when test="./tei:death/tei:date">
                                                        <xsl:for-each select="./tei:death/tei:date">
                                                            <tr>
                                                                <th class="body-translations" title="Sterbedatum">Sterbedatum</th>
                                                                <td>                                                                    
                                                                    <xsl:apply-templates/>                                                                
                                                                </td> 
                                                            </tr>   
                                                        </xsl:for-each>  
                                                    </xsl:when>
                                                    <xsl:when test="./tei:death/tei:placeName">
                                                        <xsl:for-each select="./tei:death/tei:placeName">
                                                            <tr>
                                                                <th class="body-translations" title="Sterbeort">Sterbeort</th>
                                                                <td>                                                                    
                                                                    <xsl:apply-templates/>                                                                
                                                                </td> 
                                                            </tr> 
                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:for-each select="./tei:death">
                                                            <tr>
                                                                <th class="body-translations" title="Sterbedaten">Sterbedaten</th>
                                                                <td>                                                                    
                                                                    <xsl:apply-templates/>                                                                
                                                                </td> 
                                                            </tr>   
                                                        </xsl:for-each>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:if>
                                            <xsl:if test="exists(./tei:note)"> 
                                                <tr>
                                                    <xsl:choose>
                                                        <xsl:when test="./tei:note/tei:p">
                                                            <th class="body_translations" title="Lebensdaten">Lebensdaten</th>
                                                            <td><xsl:value-of select="./tei:note/tei:p[1]"/></td>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <th class="body_translations" title="Lebensdaten">Lebensdaten</th>
                                                            <td><xsl:value-of select="./tei:note"/></td>
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                            
                                                </tr>
                                                <tr>
                                                    <xsl:choose>
                                                        <xsl:when test="./tei:note/tei:p">
                                                            <th class="body_translations" title="Biographie">Biographie</th>
                                                            <td><xsl:value-of select="./tei:note/tei:p[2]"/></td>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                            
                                                </tr>                                                                                                                               
                                            </xsl:if>                                                   
                                            
                                            <!-- ************* template import tei-event ************* -->
                                            <xsl:if test="exists(./tei:listEvent)">
                                                <xsl:call-template name="listEvent">
                                                    <xsl:with-param name="transform" select="$transform"/>
                                                </xsl:call-template>
                                            </xsl:if>                                           
                                        </tbody>
                                    </table>                                            
                                </div>
                                <div class="modal-footer">
                                    
                                </div>
                            </div>                                           
                        </div>
                    </div><!-- modal content -->                                 
                </xsl:for-each>                       
            </xsl:when>
            <xsl:otherwise>
                
            </xsl:otherwise>
        </xsl:choose>                
    </xsl:template>
</xsl:stylesheet>