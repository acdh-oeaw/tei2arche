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
        
        <!-- ######## add active or fade to classes ########## -->
        <div class="tab-pane container active" id="home" tabindex="-1">
            
            <!-- ######## Title and Navigation ########## -->
            <xsl:call-template name="header-nav"/> 
            
            <div class="row">

                <div class="col-md-6 content-area">                                    
                    <div class="row" style="margin-top:1em;">
                        
                        <xsl:if test="//tei:teiHeader">
                            <div class="col-md-12">
                                
                                <div class="card">
                                    
                                    <div class="card-header">
                                        <h3 class="body_translations" title="Information">Information</h3>                                                                        
                                    </div>                                   
                                    <div class="card-body table-responsive">
                                        <xsl:apply-templates select="//tei:teiHeader"/>
                                    </div>
                                    
                                </div> 
                                
                                <div class="card">
                                    
                                    <div class="card-header">
                                        <h3 class="body_translations" title="Information">Inhalt</h3>                                                                        
                                    </div>                                   
                                    <div class="card-body table-responsive">
                                        <xsl:apply-templates select="//tei:profileDesc"/>
                                    </div>
                                    
                                </div> 
                                
                            </div> 
                        </xsl:if>
                        
                        <div class="col-md-12" style="margin-top:1em;">
                            
                            <div class="card">                                                                 
                                <div class="card-body text-center" id="card-body-canvas">
                                    <div id="wordcloud-canvas" style="height:400px;"></div>
                                </div>
                                <div class="row" id="wrapper-wordcloud">
                                </div>
                            </div>
                            
                        </div>                        
                    </div>
                </div>
                <div class="col-md-6 content-area"> 
                    <div class="row" style="margin-top:1em;">
                        
                        <xsl:if test="//tei:listPerson">
                            <div class="col-md-12">
                                <div class="card">
                                    
                                    <div class="card-header">
                                        <h3 class="body_translations" title="{//tei:listPerson/tei:head}"><xsl:value-of select="//tei:listPerson/tei:head"/></h3>                                                                        
                                    </div>                                   
                                    <div class="card-body table-responsive">
                                        <xsl:apply-templates select="//tei:listPerson"/>
                                    </div>
                                    
                                </div> 
                            </div> 
                        </xsl:if>
                        
                        <xsl:if test="//tei:listOrg">
                            <div class="col-md-12" style="margin-top:1em;">
                                <div class="card">
                                    
                                    <div class="card-header">
                                        <h3 class="body_translations" title="{//tei:listOrg/tei:head}"><xsl:value-of select="//tei:listOrg/tei:head"/></h3>                                                                        
                                    </div>                                   
                                    <div class="card-body table-responsive">
                                        <xsl:apply-templates select="//tei:listOrg"/>
                                    </div>
                                    
                                </div>
                            </div>
                        </xsl:if>
                        
                        <xsl:if test="//tei:listPlace">
                            <div class="col-md-12" style="margin-top:1em;">
                                
                                <div class="card">
                                    
                                    <div class="card-header">
                                        <h3 class="body_translations" title="{//tei:listPlace/tei:head}"><xsl:value-of select="//tei:listPlace/tei:head"/></h3>                                                                        
                                    </div>                                   
                                    <div class="card-body table-responsive">
                                        <xsl:apply-templates select="//tei:listPlace"/>
                                    </div>
                                    
                                </div>
                                
                                <xsl:if test="//tei:place/node()">
                                    
                                    <div class="card">                                                                 
                                        <div class="card-body table-responsive">
                                            <!-- ****************** adding a container for maps ****************** -->
                                            <xsl:call-template name="add_map_container"/>
                                        </div>
                                    </div>
                                    
                                </xsl:if>
                                
                            </div>
                        </xsl:if>
                        
                    </div>  <!-- .row -->                   
                    <!-- creates a container for images -  remove if no img required -->
                    <!--<xsl:call-template name="osd-container"/> -->      
                </div><!-- .content-area -->
            </div><!-- .row --> 
        </div>  <!-- .container -->
    </xsl:template>
    <!-- ####################################### ################## --> 
    <!-- ################## body templates start ################## --> 
    <!-- ####################################### ################## --> 
    
    <xsl:template match="tei:body">
        
        <xsl:apply-templates/>
        
    </xsl:template>
    
    <xsl:template name="header-nav">        
        <div class="card-header">
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
                    <h2 class="card-text" style="text-align:center;">
                        <span class="body_translations" title="{$title}"><xsl:value-of select="$title"/></span>
                        <br/>
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat($tei-source,'?format=raw')"/>
                            </xsl:attribute>
                            <i class="fas fa-download" title="show TEI source"/>
                        </a>
                    </h2>
                </div>
                <div class="col-md-2 card-body">
                    <h2 style="text-align:right;">
                        <xsl:if test="string-length($next) != 0">
                            <a>
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
    </xsl:template>
    
    <xsl:template match="tei:listPlace"> 
        
        <div class="table-responsive"> 
            <table class="table table-striped table-hover" id="tableOne">
                <thead>
                    <tr>
                        <th>
                            <span class="body_translations" title="Ortsname (normalisiert)"><xsl:text>Ortsname (normalisiert)</xsl:text></span>
                        </th>
                        <th>
                            <xsl:text>URI</xsl:text>
                        </th>
                        <th>
                            <xsl:text>Latitude</xsl:text>
                        </th>
                        <th>
                            <xsl:text>Longitude</xsl:text>
                        </th>
                    </tr>
                </thead>
                
                <tbody>
                    <xsl:for-each select="./tei:place">
                        
                        <xsl:choose>
                            <xsl:when test="./not(node())">
                                <!-- if tei:person does not have any nodes it does not include them -->
                            </xsl:when>
                            
                            <xsl:otherwise>
                                
                                <tr>           
                                    <td>                                           
                                        <xsl:value-of select="./tei:placeName"/>
                                    </td>  
                                    
                                    <td>
                                        <xsl:if test="./tei:idno">
                                            <xsl:for-each select="./tei:idno">
                                                <ul>
                                                    <li>                                                        
                                                        <a target="_blank">
                                                            <xsl:attribute name="href">
                                                                <xsl:value-of select="."/>
                                                            </xsl:attribute>
                                                            <xsl:apply-templates/>                                                               
                                                        </a>
                                                    </li>
                                                </ul>
                                            </xsl:for-each>   
                                        </xsl:if>
                                    </td>
                                    
                                    <td>
                                        <xsl:if test="string-length(./tei:location/tei:geo) != 0">
                                            <xsl:for-each select="./tei:location">
                                                <abbr>                                        
                                                    <xsl:variable name="coords-unformated" select="tokenize(./tei:geo,' ')"/>
                                                    <xsl:variable name="coords-formated-lat" select="subsequence($coords-unformated,1,1)"/>
                                                    <xsl:variable name="coords-formated-long" select="subsequence($coords-unformated,2,1)"/>
                                                    <xsl:attribute name="title">                                            
                                                        <xsl:variable name="coords-formated" select="concat('Latitude: ',$coords-formated-lat)"/>
                                                        <xsl:value-of select="$coords-formated"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="lat">                                            
                                                        <xsl:value-of select="$coords-formated-lat"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="long">                                           
                                                        <xsl:value-of select="$coords-formated-long"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="subtitle">                                           
                                                        <xsl:if test="following-sibling::tei:placeName">
                                                            <xsl:for-each select="following-sibling::tei:placeName">
                                                                <xsl:choose>
                                                                    <xsl:when test=".[not(@type='alt' or @type='pref')]">
                                                                        <xsl:value-of select=".[not(@type='alt' or @type='pref')]"/>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:value-of select=".[@type='pref']"/>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                                <br/>
                                                            </xsl:for-each>
                                                        </xsl:if>
                                                        <xsl:if test="preceding-sibling::tei:placeName">
                                                            <xsl:for-each select="preceding-sibling::tei:placeName">
                                                                <xsl:choose>
                                                                    <xsl:when test=".[not(@type='alt' or @type='pref')]">
                                                                        <xsl:value-of select=".[not(@type='alt' or @type='pref')]"/>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:value-of select=".[@type='pref']"/>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                                <br/>
                                                            </xsl:for-each>
                                                        </xsl:if> 
                                                    </xsl:attribute>
                                                    <xsl:attribute name="class">                                
                                                        <xsl:text>map-coordinates</xsl:text>
                                                    </xsl:attribute>                                        
                                                    <xsl:value-of select="$coords-formated-lat"/>
                                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                                        <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                    </svg>                                                       
                                                </abbr>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </td>   
                                    
                                    <td>
                                        <xsl:if test="string-length(./tei:location/tei:geo) != 0">
                                            <xsl:for-each select="./tei:location">
                                                <abbr>
                                                    <xsl:variable name="coords-unformated" select="tokenize(./tei:geo,' ')"/>
                                                    <xsl:variable name="coords-formated-lat" select="subsequence($coords-unformated,1,1)"/>
                                                    <xsl:variable name="coords-formated-long" select="subsequence($coords-unformated,2,1)"/>
                                                    <xsl:attribute name="title">                                            
                                                        <xsl:variable name="coords-formated" select="concat('Longitude: ',$coords-formated-long)"/>
                                                        <xsl:value-of select="$coords-formated"/>
                                                    </xsl:attribute>                                                                               
                                                    <xsl:value-of select="$coords-formated-long"/>
                                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                                        <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                    </svg>                                                       
                                                </abbr>
                                            </xsl:for-each> 
                                        </xsl:if>
                                    </td>                                                      
                                   
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>                            
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
        
    </xsl:template>
    
    <xsl:template match="tei:listOrg"> 
        
        <div class="table-responsive">           
            <table class="table table-striped table-hover" id="tableOne">
                
                <thead>
                    <tr>
                        <th>
                            <span class="body_translations" title="Organisationsname"><xsl:text>Organisationsname</xsl:text></span>
                        </th>                                             
                    </tr>
                </thead>
                
                <tbody>
                    <xsl:for-each select="./tei:org">
                        <xsl:choose>
                            
                            <xsl:when test="./not(node())">
                                <!-- if tei:person does not have any nodes it does not include them -->
                            </xsl:when>
                            
                            <xsl:otherwise>
                                <tr>      
                                    <td>
                                        <xsl:choose>
                                            
                                            <xsl:when test="./tei:idno">
                                                <xsl:for-each select="./tei:idno">
                                                    <ul>
                                                        <li>                                                            
                                                            <a target="_blank">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="."/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./tei:orgName"/>                                                              
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </xsl:for-each>                                                
                                            </xsl:when>
                                            
                                            <xsl:otherwise>
                                                <xsl:value-of select="./tei:orgName"/>
                                            </xsl:otherwise>
                                            
                                        </xsl:choose>                                        
                                    </td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>                            
                    </xsl:for-each>
                </tbody>
                
            </table>
        </div> 
        
    </xsl:template>
    
    <xsl:template match="tei:listPerson">  
        
        <div class="table-responsive">  
            
            <table class="table table-striped table-hover" id="tableOne" style="table-layout:fixed !important;">
                
                <thead>
                    <tr>
                        
                        <th>
                            <span class="body_translations" title="Name"><xsl:text>Name</xsl:text></span>
                        </th>
                        
                        <th>
                            <span class="body_translations" title="Vorname"><xsl:text>Vorname</xsl:text></span>
                        </th>
                        
                        <xsl:if test="./tei:person/tei:persName/tei:roleName">
                            <th>
                                <span class="body_translations" title="Rollenname"><xsl:text>Rollenname</xsl:text></span>
                            </th>
                        </xsl:if>
                        
                        <th>
                            <span class="body_translations" title="Lebensdaten"><xsl:text>Lebensdaten</xsl:text></span>
                        </th>  
                        
                        <th>
                            <xsl:text>URI</xsl:text>
                        </th>  
                        
                    </tr>
                </thead>
                
                <tbody>
                    <xsl:for-each select="./tei:person">
                        <xsl:choose>
                            
                            <xsl:when test="./not(node())">
                                <!-- if tei:person does not have any nodes it does not include them -->
                            </xsl:when>
                            
                            <xsl:otherwise>
                                <tr style="height:2em !important;">                                    
                                    <td>
                                        <xsl:value-of select="./tei:persName/tei:surname"/>
                                    </td> 
                                                                   
                                    <td>
                                        <xsl:value-of select="./tei:persName/tei:forename"/>
                                    </td> 
                                    
                                    <xsl:if test="./tei:persName/tei:roleName">
                                        <td>
                                            <xsl:value-of select="./tei:persName/tei:roleName"/>
                                        </td>
                                    </xsl:if>   
                                    
                                    <td style="height:2em !important;overflow:hidden !important;white-space:nowrap;">
                                        <xsl:if test="./tei:birth or ./tei:death">                  
                                            <a class="btn btn-sm bg-light" tabindex="0" data-toggle="popover" data-trigger="focus" title="Lebensdaten" 
                                                data-content="{concat('Geburtstag: ', format-date(./tei:birth/@when, '[D]. [M]. [Y]'),
                                                codepoints-to-string(10),
                                                ' Geburtsorg: ',./tei:birth/tei:placeName,
                                                codepoints-to-string(10),
                                                ' Todestag: ',format-date(./tei:death/@when, '[D]. [M]. [Y]'),
                                                codepoints-to-string(10),
                                                ' Todesort: ',./tei:death/tei:placeName)}
                                                ">Mehr anzeigen
                                            </a>
                                            <!--<ul>                                                
                                                <xsl:if test="./tei:birth/@when">
                                                    <li><strong>Geburtstag</strong></li>
                                                    <li><xsl:value-of select="format-date(./tei:birth/@when, '[D]. [M]. [Y]')"/></li>                                
                                                </xsl:if>
                                                <xsl:if test="./tei:birth/tei:placeName/node()">
                                                    <li><strong>Geburtsort</strong></li>
                                                    <li><xsl:value-of select="./tei:birth/tei:placeName"/></li>  
                                                </xsl:if>
                                                <xsl:if test="./tei:death/@when">                                                    
                                                    <li><strong>Todestag</strong></li>
                                                    <li><xsl:value-of select="format-date(./tei:death/@when, '[D]. [M]. [Y]')"/></li>
                                                </xsl:if>
                                                <xsl:if test="./tei:death/tei:placeName/node()">
                                                    <li><strong>Todesort</strong></li>
                                                    <li><xsl:value-of select="./tei:death/tei:placeName"/></li> 
                                                </xsl:if>                                                
                                            </ul>  -->
                                        </xsl:if>
                                    </td>                                       
                                                                            
                                    <td>
                                        <xsl:if test="./tei:idno">
                                            <xsl:for-each select="./tei:idno">                                                
                                                <xsl:variable name="multi-idno" select="tokenize(., ';')"/>
                                                <xsl:variable name="count" select="count($multi-idno)"/>
                                                <ul>
                                                    <li>
                                                        <xsl:call-template name="multi-idno-loop">                                       
                                                            <xsl:with-param name="count-after" select="$count"/>
                                                            <xsl:with-param name="multi-idno" select="$multi-idno"/>
                                                        </xsl:call-template>                                                                                                                
                                                    </li>
                                                </ul>
                                            </xsl:for-each> 
                                        </xsl:if>                                        
                                    </td>                                                                                
                                </tr>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                        
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
        
    </xsl:template>
    
    <xsl:template name="multi-idno-loop">
        <xsl:param name="multi-idno"/>        
        <xsl:param name="count-after"/>  
        <ul>
            <xsl:choose>
                <xsl:when test="$count-after > 0">   
                    <xsl:for-each select="$multi-idno[$count-after]">
                       <li style="margin-bottom:.5em;">
                           <a class="btn btn-sm bg-light" target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="$multi-idno[$count-after]"/>
                                </xsl:attribute>
                                Link                                                             
                            </a>
                       </li> 
                    </xsl:for-each>                
                    <xsl:call-template name="multi-idno-loop">
                        <xsl:with-param name="count-after" select="$count-after - 1"/>
                        <xsl:with-param name="multi-idno" select="$multi-idno"/>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:profileDesc">
        
        <table class="table table-striped">
            <tbody>
        
                <xsl:if test="./tei:abstract">
                    <tr>
                        <th class="body_translations" title="Zusammenfassung" style="text-transform:uppercase;">
                            Zusammenfassung
                        </th>
                        <td id="abstract">
                            <xsl:for-each select="./tei:abstract/child::*">                                                
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </td>
                    </tr>
                </xsl:if>
                
                <xsl:if test="preceding-sibling::tei:fileDesc/tei:notesStmt">
                    <tr>
                        <th class="body_translations" title="Anmerkungen" style="text-transform:uppercase;">
                            Anmerkungen
                        </th>
                        <td>
                            <xsl:value-of select="preceding-sibling::tei:fileDesc/tei:notesStmt/tei:note"/>                                        
                        </td>
                    </tr>
                </xsl:if>               
 
                <xsl:if test="./tei:textClass/tei:keywords[@scheme='original']">
                    <tr>
                        <th class="body_translations" title="Schlagwörter original" style="text-transform:uppercase;">
                            Schlagwörter original
                        </th>
                        <td>
                            <ul>
                                <xsl:for-each select="./tei:textClass/tei:keywords[@scheme='original']">
                                    <li><xsl:apply-templates/></li>
                                </xsl:for-each>
                                <!--<xsl:for-each select="./tei:textClass/tei:keywords[@scheme='original']/tei:list/tei:item">
                                    <li><xsl:apply-templates/></li>
                                </xsl:for-each>-->
                            </ul>                    
                        </td>
                    </tr>
                </xsl:if>
                
                <xsl:if test="./tei:textClass/tei:keywords[@scheme='http://www.w3.org/2004/02/skos/core#prefLabel']">
                    <tr>
                        <th class="body_translations" title="Schlagwörter normalisiert" style="text-transform:uppercase;">
                            Schlagwörter normalisiert
                        </th>
                        <td>
                            <ul>
                                <xsl:for-each select="./tei:textClass/tei:keywords[@scheme='http://www.w3.org/2004/02/skos/core#prefLabel']">
                                    <li><xsl:apply-templates/></li>
                                </xsl:for-each>
                                <!--<xsl:for-each select="./tei:textClass/tei:keywords[@scheme='http://www.w3.org/2004/02/skos/core#prefLabel']/tei:list/tei:item">
                                    <li><xsl:apply-templates/></li>
                                </xsl:for-each>-->
                            </ul>                    
                        </td>
                    </tr>
                </xsl:if>
                
                
            </tbody>
        </table>
        
    </xsl:template>
    
    <xsl:template match="tei:teiHeader">

        <table class="table table-striped">
            <tbody>
                
                <xsl:if test="./tei:fileDesc/tei:titleStmt/tei:editor">
                    <xsl:for-each select="./tei:fileDesc//tei:titleStmt/tei:editor">
                        <tr>
                            <th style="text-transform:uppercase;">
                                <xsl:value-of select="name(.)"/>
                            </th>
                            <td>
                                <xsl:for-each select=".">                                                
                                    <xsl:apply-templates/>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:if>                
                
                <xsl:if test="./tei:profileDesc/tei:creation">
                    <tr>
                        <th class="body_translations" style="text-transform:uppercase;" title="Datum">
                            Datum
                        </th>
                        <td>
                            <xsl:for-each select="./tei:profileDesc/tei:creation">     
                                <ul>
                                    <xsl:for-each select="./tei:date">
                                        
                                        <li><strong>Original</strong></li>   
                                        
                                        <xsl:choose>
                                            <xsl:when test="@when">
                                                <li><xsl:value-of select="format-date(., '[D]. [M]. [Y]')"/></li>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <li><xsl:value-of select="."/></li>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        
                                        <li><strong>Nicht vor normalisiert</strong></li>
                                        <li><xsl:value-of select="format-date(@notBefore, '[D]. [M]. [Y]')"/></li>
                                        <li><strong>Nicht nach normalisiert</strong></li>
                                        <li><xsl:value-of select="format-date(@notAfter, '[D]. [M]. [Y]')"/></li>
                                        
                                    </xsl:for-each>                                                    
                                </ul>
                            </xsl:for-each>
                        </td>
                    </tr>
                </xsl:if>  
                
                <xsl:if test="//tei:physDesc/tei:typeDesc">
                    <tr>
                        <th class="body_translations" title="Typ des Dokuments" style="text-transform:uppercase;">
                            Typ des Dokuments
                        </th>
                        <xsl:for-each select="//tei:physDesc/tei:typeDesc/tei:p">                           
                            <td>
                                <xsl:apply-templates/>
                            </td>
                        </xsl:for-each>
                    </tr>
                </xsl:if>
                
                <xsl:if test="./tei:fileDesc/tei:publicationStmt">
                    <tr>
                        <th style="text-transform:uppercase;">
                            <span class="body_translations" title="Publikation">Publikation</span>
                        </th>
                        <td>        
                            
                            <xsl:if test="./tei:fileDesc/tei:publicationStmt/tei:publisher">
                                <xsl:apply-templates select="./tei:fileDesc/tei:publicationStmt/tei:publisher"/>
                            </xsl:if>
                            
                            <xsl:if test="./tei:fileDesc/tei:publicationStmt/tei:idno">
                                <xsl:for-each select="./tei:fileDesc/tei:publicationStmt/tei:idno">
                                    <br/>
                                    <a class="navlink" target="_blank">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="."/>
                                        </xsl:attribute>
                                        <xsl:value-of select="."/>
                                    </a>
                                </xsl:for-each>                                                
                            </xsl:if>
                            
                        </td>
                    </tr>
                </xsl:if>
                
                <xsl:if test="//tei:msIdentifier/tei:repository">
                    <tr>
                        <th style="text-transform:uppercase;">
                            <span class="body_translations" title="(Archiv) Signatur">(Archiv) Signatur</span>
                        </th>
                        <td>
                            <xsl:value-of select="//tei:msIdentifier/tei:msName"/>
                        </td>
                    </tr>
                </xsl:if>
                
                <xsl:if test="//tei:msIdentifier/tei:msName">
                    <tr>
                        <th style="text-transform:uppercase;">
                            <span class="body_translations" title="(Archiv) Signatur">Archiv</span>
                        </th>
                        <td>
                            <xsl:value-of select="//tei:msIdentifier/tei:repository"/>
                        </td>
                    </tr>
                </xsl:if>

                <xsl:choose>
                    <xsl:when test="//tei:availability">
                        <tr>
                            <th class="body_translations" title="Lizenz" style="text-transform:uppercase;">
                                Lizenz
                            </th>
                            <td>
                                <a class="navlink" target="_blank">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="//tei:licence/@target"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="//tei:licence"/>
                                </a>
                            </td>
                        </tr>
                    </xsl:when>
                    
                    <xsl:otherwise>
                        <tr>
                            <th class="body_translations" title="Lizenz" style="text-transform:uppercase;">
                                Lizenz
                            </th>
                            <td>
                                <a class="navlink" target="_blank" href="https://creativecommons.org/licenses/by/4.0/">
                                    https://creativecommons.org/licenses/by/4.0/
                                </a>
                            </td>
                        </tr>
                    </xsl:otherwise>
                    
                </xsl:choose>       
                
                <xsl:if test="//tei:revisionDesc">
                    <tr>
                        <th class="body_translations" title="Kurationsgeschichte" style="text-transform:uppercase;">
                            Kurationsgeschichte
                        </th>
                        <td>
                            <ul>
                            <xsl:for-each select="//tei:revisionDesc/tei:change">
                                <li>
                                    <xsl:value-of select="concat('geändert von ', substring-after(@who, '#'), ' am ', @when)"/>  
                                </li>                   
                            </xsl:for-each>
                            </ul>
                        </td>
                    </tr>
                </xsl:if>
                
            </tbody>
        </table>                        
                   
    </xsl:template>
    
</xsl:stylesheet>