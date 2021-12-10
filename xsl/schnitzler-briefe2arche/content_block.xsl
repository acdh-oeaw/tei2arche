<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://test.org/" exclude-result-prefixes="tei my xs xlink foo" version="2.0">
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
                <div class="col-md-12 content-area"> 
                    <div class="card">
                        <!-- ######## Title and Navigation card-header ########## -->
                        <xsl:call-template name="header-nav"/>  
                
                        <!-- ######## card body for body templates ########## -->
                        <div class="card-body">
                            <div class="tab-content">
                                <div class="tab-pane active" id="critical-tab" tabindex="-1">
                                    <div class="row">                                
                                        <div class="col-md-9" id="text-resize">
                                            <xsl:for-each select="//tei:div">
                                                <div class="{@type}{@n}">
                                                    <xsl:apply-templates>
                                                        <xsl:with-param name="view" select="'critical'"/>                                            
                                                    </xsl:apply-templates>
                                                </div>
                                            </xsl:for-each>
                                        </div>                                        
                                        <div class="col-md-3" id="img-resize">
                                            <div id="expand-wrapper">
                                                <svg id="img-expand" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-arrows-angle-expand" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M5.828 10.172a.5.5 0 0 0-.707 0l-4.096 4.096V11.5a.5.5 0 0 0-1 0v3.975a.5.5 0 0 0 .5.5H4.5a.5.5 0 0 0 0-1H1.732l4.096-4.096a.5.5 0 0 0 0-.707zm4.344-4.344a.5.5 0 0 0 .707 0l4.096-4.096V4.5a.5.5 0 1 0 1 0V.525a.5.5 0 0 0-.5-.5H11.5a.5.5 0 0 0 0 1h2.768l-4.096 4.096a.5.5 0 0 0 0 .707z"/>
                                                </svg>
                                                <svg id="img-decrease" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-arrows-angle-contract" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M.172 15.828a.5.5 0 0 0 .707 0l4.096-4.096V14.5a.5.5 0 1 0 1 0v-3.975a.5.5 0 0 0-.5-.5H1.5a.5.5 0 0 0 0 1h2.768L.172 15.121a.5.5 0 0 0 0 .707zM15.828.172a.5.5 0 0 0-.707 0l-4.096 4.096V1.5a.5.5 0 1 0-1 0v3.975a.5.5 0 0 0 .5.5H14.5a.5.5 0 0 0 0-1h-2.768L15.828.879a.5.5 0 0 0 0-.707z"/>
                                                </svg>
                                                <p><small>Größe ändern</small></p>
                                            </div>
                                            <div class="card-header" style="border-radius:5px;">
                                                <!-- creates a container for images -  remove if no img required -->
                                                <xsl:call-template name="osd-container"/> 
                                            </div>
                                            <p style="text-align:right;">
                                                <small>Bildrechte © Deutsches Literaturarchiv, Marbach am Neckar</small>
                                            </p>
                                        </div>
                                        <script type="text/javascript">
                                            $('#img-expand').click(function() {
                                                $('#text-resize').removeClass('col-md-9').addClass('col-md-3');
                                                $('#img-resize').removeClass('col-md-3').addClass('col-md-9');
                                                $('#img-expand').css('display','none');
                                                $('#img-decrease').css('display','block');
                                            });
                                            $('#img-decrease').click(function() {
                                                $('#text-resize').removeClass('col-md-3').addClass('col-md-9');
                                                $('#img-resize').removeClass('col-md-9').addClass('col-md-3');
                                                $('#img-expand').css('display','block');
                                                $('#img-decrease').css('display','none');
                                            });
                                        </script>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="links-tab" tabindex="-1">
                                    <div class="row">                                
                                        <div class="col-md-12">
                                            <xsl:for-each select="//tei:div">
                                                <div class="{@type}{@n}">
                                                    <xsl:apply-templates>
                                                        <xsl:with-param name="view" select="'links'"/>                                            
                                                    </xsl:apply-templates>
                                                </div>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="reading-tab" tabindex="-1">
                                    <div class="row">                                
                                        <div class="col-md-12">
                                            <xsl:for-each select="//tei:div">
                                                <div class="{@type}{@n}">
                                                    <xsl:apply-templates>
                                                        <xsl:with-param name="view" select="'reading'"/>                                            
                                                    </xsl:apply-templates>
                                                </div>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </div>                                
                            </div>                                                                       
                        </div>                        
                        <div class="card-footer">     
                            <div id="navBarViews"> 
                                <h3 class="body_translations" title="Ansicht">Ansicht</h3>
                                <ul class="nav nav-tabs" id="dropdown-lang">                                    
                                    <li class="nav-item">                                    
                                        <a title="kritische Ansicht" href="#critical-tab" data-toggle="tab" class="active">
                                            kritisch
                                        </a>
                                    </li>
                                    <li class="nav-item">                                    
                                        <a title="Ansicht mit Links" href="#links-tab" data-toggle="tab" class="">
                                            links
                                        </a>
                                    </li>
                                    <li class="nav-item">                                    
                                        <a title="Leseansicht" href="#reading-tab" data-toggle="tab" class="">
                                            lesen
                                        </a>
                                    </li>                                    
                                    <li class="nav-item">                                    
                                        <a title="TEI/XML" class="">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="concat($tei-source,'?format=raw')"/>
                                            </xsl:attribute>
                                            TEI/XML
                                        </a>
                                    </li>
                                    <li class="nav-item">                                    
                                        <a href="#" data-toggle="modal" title="Überlieferung" data-target="#metadataModalBriefe">
                                            Überlieferung
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="modal fade" id="metadataModalBriefe" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">
                                                <span style="margin-right:.25em;" class="body_translations" title="{$title}"><xsl:value-of select="$title"/></span>
                                            </h5>
                                            <button type="button" class="ml-2 mb-1 close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                                        </div>
                                        <div class="modal-body">
                                            <table class="table table-striped">
                                                <tbody>
                                                    <tr>
                                                        <th>Versand:</th>
                                                        <td>
                                                            <ul>
                                                                <xsl:for-each select="//tei:correspAction[@type='sent']/child::*">
                                                                    <li><xsl:value-of select="."/></li>
                                                                </xsl:for-each>
                                                            </ul>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Empfangen:</th>
                                                        <td>
                                                            <ul>
                                                                <xsl:for-each select="//tei:correspAction[@type='received']/child::*">
                                                                    <li><xsl:value-of select="."/></li>
                                                                </xsl:for-each>
                                                            </ul>
                                                        </td>
                                                    </tr>                                            
                                                    
                                                </tbody>
                                            </table>    
                                            <table class="table table-striped">
                                                <tbody>
                                                    <xsl:for-each select="//tei:listWit/tei:witness">
                                                        <legend>TEXTZEUGE <xsl:value-of select="@n"/></legend>
                                                        <tr>
                                                            <th>Signatur</th>
                                                            <td><xsl:value-of select="./tei:msDesc/tei:msIdentifier"/></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Beschreibung</th>
                                                            <td>
                                                                <xsl:for-each select="./tei:msDesc/tei:physDesc/tei:objectDesc/tei:desc">
                                                                    <xsl:value-of select="@n"/><xsl:text> </xsl:text>
                                                                    <span style="text-transform:capitalize;"><xsl:value-of select="replace(@type, '_', '')"/></span>
                                                                    <xsl:if test="position() != last()">
                                                                        <xsl:text>, </xsl:text>
                                                                    </xsl:if>                                                             
                                                                </xsl:for-each>                                                                
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>Handschrift</th>
                                                            <td>
                                                                <xsl:for-each select="./tei:msDesc/tei:physDesc/tei:handDesc/tei:handNote">
                                                                    <xsl:value-of select="@medium"/><xsl:text>, </xsl:text>
                                                                    <xsl:value-of select="@style"/>
                                                                </xsl:for-each>                                                                
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>Ordnung</th>
                                                            <td>
                                                                <xsl:value-of select="./tei:msDesc/tei:physDesc/tei:additions"/>
                                                            </td>
                                                        </tr>
                                                    </xsl:for-each>
                                                </tbody>
                                            </table>
                                            <xsl:if test="//tei:listBibl">
                                                <xsl:for-each select="//tei:listBibl/tei:biblStruct">                                                    
                                                    <table class="table table-striped">
                                                        <tbody>                                                            
                                                            <legend>Druck</legend>
                                                            <tr>
                                                                <td><xsl:value-of select="./tei:monogr"/></td>
                                                            </tr>                                                      
                                                        </tbody>
                                                    </table>
                                                </xsl:for-each>
                                            </xsl:if>
                                        </div>
                                        <div class="modal-footer">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <h3 class="body_translations" title="Zitierhinweis">Zitierhinweis</h3>
                            <blockquote class="blockquote">
                                <cite title="Source Title">
                                    <xsl:value-of select="//tei:titleStmt/tei:title[@level='a']"/>
                                    <xsl:text>. </xsl:text>
                                    <xsl:text>In: </xsl:text>
                                    <xsl:value-of select="//tei:titleStmt/tei:title[@level='s']"/>
                                    <xsl:text>. Digitale Edition. Hg. </xsl:text>
                                    <xsl:value-of select="//tei:titleStmt/tei:editor/tei:name[1]"/>
                                    <xsl:text> und </xsl:text>
                                    <xsl:value-of select="//tei:titleStmt/tei:editor/tei:name[2]"/>
                                    <xsl:text>, </xsl:text>
                                    <a href="{concat($tei-source, $transform)}" title="Link zur Digitalen Editions">
                                        <xsl:value-of select="concat($tei-source, $transform)"/>      
                                    </a>                              
                                    <span class="body_translations" title=", aufgerufen am ">, aufgerufen am </span>
                                    <span class="body_translations" title="{format-date(current-date(), '[D].[M].[Y]')}">
                                        <xsl:value-of select="format-date(current-date(), '[D].[M].[Y]')"/>
                                    </span>
                                    <xsl:text>)</xsl:text>
                                </cite>
                            </blockquote>
                        </div>
                    </div>
                </div><!-- .content-area -->
            </div> <!-- .row -->
        </div>  
    </xsl:template>
    <!-- ####################################### ################## --> 
    <!-- ################## body templates start ################## --> 
    <!-- ####################################### ################## --> 
    
    <xsl:template match="tei:address">
        <xsl:param name="view"/>
        <xsl:for-each select="./tei:addrLine">
            <xsl:apply-templates>
                <xsl:with-param name="view" select="$view"/>
            </xsl:apply-templates>
            <br/>
        </xsl:for-each>
        <br/>
    </xsl:template>    
    <xsl:template match="tei:opener">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links' or $view = 'reading'">
                <div class="opener">
                    <xsl:apply-templates>
                        <xsl:with-param name="view" select="$view"/>
                    </xsl:apply-templates>
                </div>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    <xsl:template match="tei:dateline">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links' or $view = 'reading'">
                <div class="dateline" style="text-align:{@rend};">
                    <span class="text">
                        <xsl:apply-templates>
                            <xsl:with-param name="view" select="$view"/>
                        </xsl:apply-templates>
                    </span>
                </div>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    <xsl:template match="tei:p">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links' or $view = 'reading'">
                <xsl:choose>
                    <xsl:when test="@rend">                       
                        <span class="text" style="text-align:{@rend};">
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </span>                        
                    </xsl:when>
                    <xsl:otherwise>
                        <span class="text">
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </span>
                    </xsl:otherwise>
                </xsl:choose>                
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    <xsl:template match="tei:salute">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links' or $view = 'reading'">
                <span class="text">
                    <xsl:apply-templates>
                        <xsl:with-param name="view" select="$view"/>
                    </xsl:apply-templates>
                </span>
            </xsl:when>
        </xsl:choose>  
    </xsl:template>
    <xsl:template match="tei:space">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links' or $view = 'reading'">
                <xsl:choose>
                    <xsl:when test="@unit = 'line'">
                       <br/>                  
                    </xsl:when>
                    <xsl:when test="@unit = 'chars'">
                        <span class="space" style="margin-left: {@quantity}px"/>
                    </xsl:when>
                </xsl:choose>                
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:closer">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links' or $view = 'reading'">
                <div class="closer">
                    <span class="text">
                        <xsl:apply-templates>
                            <xsl:with-param name="view" select="$view"/>
                        </xsl:apply-templates>
                    </span>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:lb">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links' or $view = 'reading'">
                <br/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:lg">
        <xsl:param name="view"/>
        <span class="{@type}">
            <xsl:apply-templates>
                <xsl:with-param name="view" select="$view"/>
            </xsl:apply-templates>
        </span>
        <br/>
    </xsl:template>
    <xsl:template match="tei:l">
        <xsl:param name="view"/>
        <span class="{@type}">
            <xsl:apply-templates>
                <xsl:with-param name="view" select="$view"/>
            </xsl:apply-templates>
        </span>
        <br/>
    </xsl:template>
    <xsl:template match="tei:signed">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links' or $view = 'reading'">
                <br/>
                <p style="text-align:right;">
                    <span class="signed">
                        <xsl:apply-templates>
                            <xsl:with-param name="view" select="$view"/>
                        </xsl:apply-templates>
                    </span> 
                </p>                
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:handShift">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links'">
                <xsl:variable name="hs-refId" select="data(substring-after(@scribe, '#'))"/>
                <xsl:choose>
                    <xsl:when test="//id($hs-refId)">                                  
                        <xsl:for-each select="//id($hs-refId)"> 
                            <xsl:text>[hs. </xsl:text><xsl:value-of select="./tei:persName"/><xsl:text>]: </xsl:text>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:postscript">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links' or $view = 'reading'">
                <div class="postscript">
                    <xsl:apply-templates>
                        <xsl:with-param name="view" select="$view"/>
                    </xsl:apply-templates>
                </div>      
            </xsl:when>
        </xsl:choose>  
    </xsl:template>
    <xsl:template match="tei:anchor">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links' or $view = 'reading'">
                <div id="{@xml:id}" class="{@type}"></div> 
            </xsl:when>
        </xsl:choose>  
    </xsl:template>
    <xsl:template match="tei:note">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links' or $view = 'reading'">
                <xsl:variable name="note" select="."/>        
                <span class="note {@type}" id="{@xml:id}">
                    <small style="vertical-align: super;">
                        <a tabindex="0"
                            role="button"
                            data-toggle="popover"
                            data-trigger="focus"
                            title="Anmerkung"
                            data-content="{$note}">
                            Notiz
                        </a>
                    </small>
                </span>
            </xsl:when>
        </xsl:choose> 
    </xsl:template>
    <xsl:template match="tei:hi">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links'">
                <xsl:choose>
                    <xsl:when test="@rend = 'latintype'">
                        <span style="text-transform: uppercase">
                            <small>
                                <xsl:apply-templates>
                                    <xsl:with-param name="view" select="$view"/>
                                </xsl:apply-templates>
                            </small>
                        </span>
                    </xsl:when>
                    <xsl:when test="@rend = 'superscript'">
                        <span style="vertical-align: super;">
                            <small>
                                <xsl:apply-templates>
                                    <xsl:with-param name="view" select="$view"/>
                                </xsl:apply-templates>
                            </small>
                        </span>
                    </xsl:when>
                    <xsl:when test="@rend = 'subscript'">
                        <span style="vertical-align: sub;">
                            <small>
                                <xsl:apply-templates>
                                    <xsl:with-param name="view" select="$view"/>
                                </xsl:apply-templates>
                            </small>
                        </span>
                    </xsl:when>
                    <xsl:when test="@rend = 'underline'">
                        <span style="text-decoration: underline;">
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </span>
                    </xsl:when>
                    <xsl:when test="@rend = 'bold'">
                        <span style="font-weight: bold;">
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </span>
                    </xsl:when>
                    <xsl:when test="@rend = 'stamp'">
                        <span style="color: #A23B72;">
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </span>
                    </xsl:when>
                    <xsl:when test="@rend = 'capitals'">
                        <span style="text-transform: capitalize;">
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </span>
                    </xsl:when>
                    <xsl:when test="@rend = 'small_caps'">
                        <span style="text-transform: lowercase;">
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </span>
                    </xsl:when>
                    <xsl:when test="@rend = 'pre-print'">
                        <span>
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <span>
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </span>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$view = 'reading'">
                <xsl:choose>
                    <xsl:when test="@rend = 'superscript'">
                        <span style="vertical-align: super;">
                            <small>
                                <xsl:apply-templates>
                                    <xsl:with-param name="view" select="$view"/>
                                </xsl:apply-templates>
                            </small>
                        </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <span>
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </span>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>                
    </xsl:template>
    <xsl:template match="tei:c">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links'">
                <xsl:choose>
                    <xsl:when test="@rendition = '#langesS'">
                        <xsl:text>ſ</xsl:text>
                    </xsl:when>
                    <xsl:when test="@rendition = '#gemination-m'">
                        <xsl:text>m̅</xsl:text>
                    </xsl:when>
                    <xsl:when test="@rendition = '#gemination-n'">
                        <xsl:text>n̅</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$view = 'reading'">
                <xsl:apply-templates>
                    <xsl:with-param name="view" select="$view"/>
                </xsl:apply-templates>
            </xsl:when>
        </xsl:choose>          
    </xsl:template>
    <xsl:template match="tei:subst">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links' or $view = 'reading'">
                <xsl:apply-templates>
                    <xsl:with-param name="view" select="$view"/>
                </xsl:apply-templates>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:add">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links'">
                <xsl:choose>
                    <xsl:when test="@place = 'above' and parent::tei:subst">
                        <span class="add-above">
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                            <small style="vertical-align: super;">↓</small>
                        </span>
                    </xsl:when>
                    <!--<xsl:when test="@place = 'below' and parent::tei:subst">
                        <span class="add-below">
                            <xsl:apply-templates></xsl:apply-templates><small style="vertical-align: super;">↑</small>
                        </span>
                    </xsl:when>-->
                    <xsl:otherwise>
                        <span class="add-above">
                            <small style="vertical-align: super;">↓</small>
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                            <small style="vertical-align: super;">↓</small>
                        </span>
                    </xsl:otherwise>
                </xsl:choose>                
            </xsl:when>
            <xsl:when test="$view = 'reading'">
                <xsl:apply-templates>
                    <xsl:with-param name="view" select="$view"/>
                </xsl:apply-templates>               
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    <xsl:template match="tei:del">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'critical' or $view = 'links'">
                <xsl:choose>
                    <xsl:when test="@rend = 'strikethrough'">
                        <span style="vertical-align: super;" class="del-strikethrough">
                            <small>↑
                                <xsl:apply-templates>
                                    <xsl:with-param name="view" select="$view"/>
                                </xsl:apply-templates>
                            </small>
                        </span>
                    </xsl:when>
                    <xsl:when test="@rend = 'overwritten'">
                        <span style="vertical-align: super;" class="del-strikethrough">
                            <small>↑
                                <xsl:apply-templates>
                                    <xsl:with-param name="view" select="$view"/>
                                </xsl:apply-templates>
                            </small>
                        </span>
                    </xsl:when>
                    <xsl:when test="@rend = 'erased'">
                        <span style="vertical-align: super;" class="del-strikethrough">
                            <small>↑
                                <xsl:apply-templates>
                                    <xsl:with-param name="view" select="$view"/>
                                </xsl:apply-templates>
                            </small>
                        </span>
                    </xsl:when>
                </xsl:choose>                
            </xsl:when>
            <xsl:when test="$view = 'reading'">
                
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    
</xsl:stylesheet>