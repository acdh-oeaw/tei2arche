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
            <div class="row">
                <div class="col-md-12 content-area"> 
                    <!-- ######## Title and Navigation ########## -->
                    <div class="card-header">
                        <xsl:call-template name="header-nav"/>                     
                    </div>
                    <xsl:apply-templates select="//tei:body"/>
                </div><!-- .content-area -->
            </div> <!-- .row -->
        </div>  
    </xsl:template>
    <!-- ####################################### ################## --> 
    <!-- ################## body templates start ################## --> 
    <!-- ####################################### ################## --> 
    
    <xsl:template match="tei:body">
        
        <xsl:apply-templates/>
        
    </xsl:template>
    
    <xsl:template match="tei:textLang">
        
        <span class="badge bg-light text-dark">
            
            <xsl:call-template name="small"/>
            
        </span>
        
        <span class="{name()}"><xsl:apply-templates/></span>
        
    </xsl:template>
    
    <xsl:template match="tei:item">
        
        <li style="padding:.5em;">
            <span class="badge badge-block bg-light text-dark">
                
                <xsl:call-template name="small"/>
                
            </span>
        </li>
        
        <li style="padding:.5em;">
            <ul class="card-header" style="margin-bottom:.5em;padding:.5em;">                           
                <xsl:for-each select="./child::*">                    
                    <li style="padding:.5em;">                        
                        <span class="badge bg-light text-dark">
                            
                            <xsl:call-template name="small"/>
                            
                        </span>                        
                        <span class="{./name()}"><xsl:apply-templates/></span>                        
                    </li>                    
                </xsl:for-each>
                
                <xsl:for-each select="text()">                    
                    <span style="color:red;"><xsl:value-of select="."/></span>                    
                </xsl:for-each>                
            </ul>
        </li>
                   
    </xsl:template>
    
    <xsl:template match="tei:title"> 
        
        <xsl:choose>
            <xsl:when test="@type='main'">
                <span class="badge badge-block bg-light text-dark">                
                    
                    <xsl:call-template name="small"/>
                    
                </span>
                <h4>
                    <span class="{name()}"><xsl:apply-templates/></span>     
                </h4>
                
            </xsl:when>
            
            <xsl:otherwise>
                
                <span class="badge bg-light text-dark">                
                    
                    <xsl:call-template name="small"/>
                    
                </span>            
                <span class="{name()}"><xsl:apply-templates/></span>            
                
            </xsl:otherwise>
        </xsl:choose>
         
    </xsl:template>    
    
    <xsl:template match="tei:ab">
        
        <p style="color:red;"><xsl:apply-templates/></p>
        
    </xsl:template>
    
    <xsl:template match="tei:head">
                 
        <span class="badge bg-light text-dark">
            
            <xsl:call-template name="small"/>
            
        </span>            
        <span class="{name()}"><xsl:apply-templates/></span> 
        
    </xsl:template>
    
    <xsl:template match="tei:div">
        
        <xsl:for-each select="text()">                    
            <span style="color:red;"><xsl:value-of select="."/></span>                    
        </xsl:for-each>  
        
        <xsl:choose>
            <xsl:when test="@type='entry' or parent::tei:body">
                <div class="row">                    
                    <div class="col-md-12">                        
                       <div class="card">
                           
                           <div class="card-header">                               
                               <span class="badge badge-block bg-light text-dark">
                                   
                                   <xsl:call-template name="small"/>
                                   
                               </span>
                               <br/>                               
                           </div>
                           
                           <div class="card-header">                                   
                               <xsl:apply-templates/>                               
                           </div>
                           
                       </div>
                        
                    </div>                    
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="row">
                    <div class="col-md-12">                        
                        <div class="card">                            
                            <div class="card-header">                                
                                <span class="badge badge-block bg-light text-dark">
                                    
                                    <xsl:call-template name="small"/>
                                    
                                </span>                                
                            </div>                            
                            <div class="card-body">
                                <xsl:apply-templates/>
                            </div>                            
                        </div>                        
                    </div> 
                </div>
            </xsl:otherwise>            
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        
        <xsl:choose>
            <xsl:when test="not(parent::tei:listBibl)">                
                <div class="card">
                    <div class="card-header">
                        <span class="badge badge-block bg-light text-dark">
                            
                            <xsl:call-template name="small"/>
                            
                        </span> 
                    </div>
                    <div class="card-body">
                        <span class="{./name()}">
                            <xsl:apply-templates/>
                        </span>
                    </div>
                </div>                               
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="tei:idno">
        
        <span class="badge badge-block bg-light text-dark">
            
            <xsl:call-template name="small"/>
            
        </span>
        <span class="{./name()}">
            <xsl:apply-templates/>
        </span> 
        
    </xsl:template>
    
    <xsl:template match="tei:lb">
        
        <br/>
        
    </xsl:template>
    
    <xsl:template match="tei:cit">

        <span class="badge bg-light text-dark">
            
            <xsl:call-template name="small"/>
            
        </span>
        
        <span class="{name()}"><xsl:apply-templates/></span> 

    </xsl:template>
    
    <xsl:template match="tei:quote">
        
        <span class="badge bg-light text-dark">
            
            <xsl:call-template name="small"/>
            
        </span>
        
        <cite class="{name()}">
            <xsl:apply-templates/>
        </cite>
        
    </xsl:template>
    
    <xsl:template match="tei:lg">
        
        <span class="badge bg-light text-dark">
            
            <xsl:call-template name="small"/>
            
        </span>
        
        <ul>
            <xsl:apply-templates/>
        </ul>
        
    </xsl:template>
    
    <xsl:template match="tei:l">
        
        <li>
            <span class="badge bg-light text-dark">
                
                <xsl:call-template name="small"/>
                
            </span>
            <xsl:apply-templates/>
        </li>
        
    </xsl:template>
    
    <xsl:template match="tei:note">        

        <span class="badge badge-block bg-light text-dark">
            
            <xsl:call-template name="small"/>
            
        </span> 
        <span class="{name()}"><small><xsl:apply-templates/></small></span>
        
        
    </xsl:template>
    
    <xsl:template match="tei:series">        
        
        <span class="badge bg-light text-dark">
            
            <xsl:call-template name="small"/>
            
        </span> 
        <span class="{name()}"><xsl:apply-templates/></span>
        
        
    </xsl:template>
    
    <xsl:template match="tei:p">
        
        <xsl:choose>            
            <xsl:when test="parent::tei:div[not(@type='entry')] or ancestor::tei:div[not(@type='entry')]">                
                <span class="badge badge-block bg-light text-dark">
                    
                    <xsl:call-template name="small"/>
                    
                </span>                
                <p class="{name()}"><xsl:apply-templates/></p>
                
            </xsl:when>
            
            <xsl:when test="parent::tei:list">
            
                <div class="card" style="border:1px solid red">                    
                    <span class="badge badge-block bg-light text-dark">
                        
                        <xsl:call-template name="small"/>
                        
                    </span>                    
                    <p class="{name()}"><xsl:apply-templates/></p>                    
                </div>
            
            </xsl:when>
            
            <xsl:otherwise>
                
                <div class="card" style="border:1px solid red">                    
                    <span class="badge badge-block bg-light text-dark">
                        
                        <xsl:call-template name="small"/>
                        
                    </span>                    
                    <p class="{name()}"><xsl:apply-templates/></p>                    
                </div>
                
            </xsl:otherwise>            
        </xsl:choose>
   
    </xsl:template>
    
    <xsl:template match="tei:hi">
        
        <span class="badge bg-light text-dark">
            
            <xsl:call-template name="small"/>
            
        </span>
        
        <span class="{concat(name(), ' ', @rend)}">
            <xsl:apply-templates/>
        </span>
        
    </xsl:template>
    
    <xsl:template match="tei:biblScope">
        
        <xsl:choose>
            <xsl:when test="@unit">                
                <p>
                    <span class="badge badge-block bg-light text-dark">
                        
                        <xsl:call-template name="small"/>
                        
                    </span>
                    
                    <span class="{name()}">
                        <xsl:apply-templates/>
                    </span>
                </p>          
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>
    
    
    <xsl:template match="tei:listBibl">
        
        <xsl:for-each select="text()">                    
            <span style="color:red;"><xsl:value-of select="."/></span>                    
        </xsl:for-each>  
        
        <xsl:choose>
            <xsl:when test="parent::tei:div[not(@type='entry')] or ancestor::tei:div[not(@type='entry')]">              
                <xsl:choose>
                    <xsl:when test="not(child::tei:bibl)">                            
                        <div style="border:1px solid red">  
                            
                            <xsl:call-template name="div_card_badge_block"/>    
                            
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        
                        <xsl:call-template name="div_card_badge_block"/>
                        
                    </xsl:otherwise>
                </xsl:choose>            
            </xsl:when>
            <xsl:otherwise>
                <div class="card" style="border:1px solid red">                    
                    <div class="card-header">                        
                        <xsl:choose>
                            <xsl:when test="not(child::tei:bibl)">                                
                                <div style="border:1px solid red">    
                                    
                                    <xsl:call-template name="div_card_badge_block"/>  
                                    
                                </div>
                            </xsl:when>
                            <xsl:otherwise>  
                                
                                <xsl:call-template name="div_card_badge_block"/> 
                                
                            </xsl:otherwise>
                        </xsl:choose>            
                    </div>                    
                </div>                
            </xsl:otherwise>            
        </xsl:choose>
        
    </xsl:template>
    
</xsl:stylesheet>