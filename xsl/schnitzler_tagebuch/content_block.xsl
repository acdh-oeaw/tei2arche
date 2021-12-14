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
    <xsl:param name="iiif"/>
    <xsl:variable name="source_volume">
        <xsl:value-of select="replace(//tei:monogr//tei:biblScope[@unit='volume']/text(), '-', '_')"/>
    </xsl:variable>
    <xsl:variable name="source_base_url">https://austriaca.at/buecher/files/arthur_schnitzler_tagebuch/Tagebuch1879-1931Einzelseiten/schnitzler_tb_</xsl:variable>
    <xsl:variable name="source_page_nr">
        <xsl:value-of select="format-number(//tei:monogr//tei:biblScope[@unit='page']/text(), '000')"/>
    </xsl:variable>
    <xsl:variable name="source_pdf">
        <xsl:value-of select="concat($source_base_url, $source_volume, 's', $source_page_nr, '.pdf')"/>
    </xsl:variable>
    
    <xsl:template name="cards">
        <xsl:param name="arche_root_col_url"/>
        <!-- ######## add active or fade to classes ########## -->
        <div class="tab-pane container active" id="home" tabindex="-1">
            <div class="row">
                <div class="col-md-12 content-area">   
                    <div class="card">
                        <!-- ######## Title and Navigation ########## -->                                      
                        <!-- ######## card header to describe specific content ########## -->
                        <xsl:call-template name="header-nav"/> 
                                               
                        <!-- ######## card body for body templates ########## -->
                        <div class="card-body">
                            <xsl:apply-templates select="//tei:body"/>
                        </div>
                        <div id="OSD-images" style="padding:.5em;">
                            <!-- image container accessed by OSD script -->
                            <div id="non-OSD-images">
                                <!-- #non-OSD-images is removed with openSeaDragon script -->
                                <!-- if no script is available it holds the images from tei/xml -->
                                <xsl:apply-templates select="//tei:facsimile"/>                                    
                            </div>                                
                        </div>
                        <xsl:if test="//tei:place or //tei:person or //tei:listBibl/tei:bibl">
                            <div id="register_dropdown_info">
                                <button style="margin:2%;width:96% !important;" id="register_show" class="btn btn-light" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-index-thumb" viewBox="0 0 16 16">
                                        <path d="M6.75 1a.75.75 0 0 1 .75.75V8a.5.5 0 0 0 1 0V5.467l.086-.004c.317-.012.637-.008.816.027.134.027.294.096.448.182.077.042.15.147.15.314V8a.5.5 0 0 0 1 0V6.435l.106-.01c.316-.024.584-.01.708.04.118.046.3.207.486.43.081.096.15.19.2.259V8.5a.5.5 0 1 0 1 0v-1h.342a1 1 0 0 1 .995 1.1l-.271 2.715a2.5 2.5 0 0 1-.317.991l-1.395 2.442a.5.5 0 0 1-.434.252H6.118a.5.5 0 0 1-.447-.276l-1.232-2.465-2.512-4.185a.517.517 0 0 1 .809-.631l2.41 2.41A.5.5 0 0 0 6 9.5V1.75A.75.75 0 0 1 6.75 1zM8.5 4.466V1.75a1.75 1.75 0 1 0-3.5 0v6.543L3.443 6.736A1.517 1.517 0 0 0 1.07 8.588l2.491 4.153 1.215 2.43A1.5 1.5 0 0 0 6.118 16h6.302a1.5 1.5 0 0 0 1.302-.756l1.395-2.441a3.5 3.5 0 0 0 .444-1.389l.271-2.715a2 2 0 0 0-1.99-2.199h-.581a5.114 5.114 0 0 0-.195-.248c-.191-.229-.51-.568-.88-.716-.364-.146-.846-.132-1.158-.108l-.132.012a1.26 1.26 0 0 0-.56-.642 2.632 2.632 0 0 0-.738-.288c-.31-.062-.739-.058-1.05-.046l-.048.002zm2.094 2.025z"/>
                                    </svg>
                                </button>
                                <div class="collapse" id="collapseExample">
                                    <div class="card card-body bg-dark">
                                        <div class="tab-content"> 
                                            <div id="navBarLanguage" style="margin-bottom:1em;">
                                                <ul class="nav nav-tabs" id="dropdown-lang">
                                                    <xsl:if test="//tei:place">
                                                        <li class="nav-item"><a title="Erwähnte Orte" alt="Erwähnte Orte" href="#register_places" data-toggle="tab" class="body_translations nav-link active">Erwähnte Orte</a></li>
                                                    </xsl:if>
                                                    <xsl:if test="//tei:person">
                                                        <li class="nav-item"><a title="Erwähnte Personen" alt="Erwähnte Personen" href="#register_persons" data-toggle="tab" class="body_translations nav-link">Erwähnte Personen</a></li>
                                                    </xsl:if>
                                                    <xsl:if test="//tei:listBibl/tei:bibl">
                                                        <li class="nav-item"><a title="Erwähnte Werke" alt="Erwähnte Werke" href="#register_works" data-toggle="tab" class="body_translations nav-link">Erwähnte Werke</a></li>
                                                    </xsl:if>
                                                    <xsl:if test="//tei:facsimile/tei:graphic">
                                                        <li class="nav-item"><a title="Facsimile" href="#register_facsimile" data-toggle="tab" class="body_translations nav-link">Facsimile</a></li>
                                                    </xsl:if>
                                                </ul>
                                            </div>
                                            <xsl:if test="//tei:place">
                                                <div class="tab-pane container active" id="register_places" tabindex="-1">
                                                    <div class="row">
                                                        <div class="col-md-4">                                                           
                                                            <ul>
                                                                <xsl:for-each select="//tei:place">                                                   
                                                                    <li style="margin-top:1em; background-color: #3E91BB; padding:.5em;border-radius:3px;">
                                                                        <table>
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>
                                                                                        <span class="text-light">
                                                                                            <xsl:attribute name="title">
                                                                                                <xsl:value-of select="./tei:placeName"/>
                                                                                            </xsl:attribute>
                                                                                            <xsl:attribute name="alt">
                                                                                                <xsl:value-of select="./tei:placeName"/>
                                                                                            </xsl:attribute>
                                                                                            <xsl:value-of select="./tei:placeName"/>                                                                               
                                                                                        </span>
                                                                                    </th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>                                                                                
                                                                                <tr>
                                                                                    <td style="text-transform:capitalize;" class="text-light" title="{./tei:location}" alt="{./tei:location}"><xsl:value-of select="concat(./tei:location/name(.),'(',replace(./tei:location/tei:geo/@decls,'#',''),')')"/>: <xsl:value-of select="./tei:location"/></td>
                                                                                </tr>
                                                                                <xsl:for-each select="./tei:idno">
                                                                                    <tr>
                                                                                        <td><a class="text-light" href="{.}" title="{./@type}" alt="{./@type}"><xsl:value-of select="."/></a></td>
                                                                                    </tr>
                                                                                </xsl:for-each>
                                                                            </tbody>
                                                                        </table>                                                                        
                                                                   </li>                                                         
                                                                </xsl:for-each>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <xsl:call-template name="add_map_container"/>
                                                        </div>
                                                    </div>
                                                </div><!-- places tab -->
                                            </xsl:if>
                                            <xsl:if test="//tei:person">
                                                <div class="tab-pane container fade" id="register_persons" tabindex="-1">
                                                    <div class="row">
                                                        <div class="col-md-12 table-responsive">
                                                            <ul>
                                                                <xsl:for-each select="//tei:person">                                                   
                                                                    <li style="margin-top:1em; background-color: #3E91BB; padding:.5em;border-radius:3px;">                                                                                                                                 
                                                                        <table class="table">
                                                                            <tbody>  
                                                                                <tr>
                                                                                    <th class="text-light" style="border:none !important;">Name</th>
                                                                                    <td style="border:none !important;">
                                                                                        <span class="text-light">
                                                                                            <xsl:attribute name="title">
                                                                                                <xsl:value-of select="./tei:persName"/>
                                                                                            </xsl:attribute>
                                                                                            <xsl:attribute name="alt">
                                                                                                <xsl:value-of select="./tei:persName"/>
                                                                                            </xsl:attribute>
                                                                                            <xsl:value-of select="./tei:persName"/>                                                                               
                                                                                        </span>
                                                                                    </td>
                                                                                </tr>  
                                                                                <tr>
                                                                                    <th class="text-light" style="text-transform: capitalize;border:none !important;"><xsl:value-of select="./tei:occupation[1]/name(.)"/></th>
                                                                                    <xsl:for-each select="./tei:occupation">                                                                                        
                                                                                        <td style="border:none !important;" class="text-light" title="{.}" alt="{.}"><xsl:value-of select="."/></td>                                                                                        
                                                                                    </xsl:for-each>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th class="text-light"></th>
                                                                                    <th class="text-light">Date</th>
                                                                                    <th class="text-light">Place</th>
                                                                                </tr>                                                                                
                                                                                <tr>
                                                                                    <xsl:for-each select="./tei:birth">
                                                                                        <th class="text-light" style="text-transform: capitalize;border:none !important;"><xsl:value-of select="./name(.)"/></th>
                                                                                        <td class="text-light" style="text-transform: capitalize;border:none !important;" title="{./tei:date}" alt="{./tei:date}"><xsl:value-of select="./tei:date"/></td>
                                                                                        <td style="text-transform: capitalize;border:none !important;" class="text-light" title="{./tei:placeName}" alt="{./tei:placeName}"><xsl:value-of select="./tei:placeName"/></td>
                                                                                    </xsl:for-each>                                       
                                                                                </tr>
                                                                                <tr>
                                                                                    <xsl:for-each select="./tei:death">
                                                                                        <th class="text-light" style="text-transform: capitalize;border:none !important;"><xsl:value-of select="./name(.)"/></th>
                                                                                        <td style="text-transform: capitalize;border:none !important;" class="text-light" title="{./tei:date}" alt="{./tei:date}"><xsl:value-of select="./tei:date"/></td>
                                                                                        <td style="text-transform: capitalize;border:none !important;" class="text-light" title="{./tei:placeName}" alt="{./tei:placeName}"><xsl:value-of select="./tei:placeName"/></td>
                                                                                    </xsl:for-each>                                       
                                                                                </tr> 
                                                                                <tr>
                                                                                    <th class="text-light" ></th>
                                                                                    <xsl:for-each select="./tei:idno">
                                                                                        <th class="text-light"><xsl:value-of select="@type"/></th>                                                               
                                                                                    </xsl:for-each>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th class="text-light" style="text-transform: capitalize;border:none !important;">ID</th>
                                                                                    <xsl:for-each select="./tei:idno">                                                                          
                                                                                        <td style="border:none !important;" class="text-light" href="{.}" title="{./@type}" alt="{./@type}"><xsl:value-of select="."/></td>                                                                                        
                                                                                    </xsl:for-each> 
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </li>                                                         
                                                                </xsl:for-each>
                                                            </ul>
                                                        </div>                                                
                                                    </div>
                                                </div><!-- register persons -->
                                            </xsl:if>
                                            <xsl:if test="//tei:listBibl/tei:bibl">
                                                <div class="tab-pane container fade" id="register_works" tabindex="-1">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <ul>
                                                                <xsl:for-each select="//tei:listBibl/tei:bibl">                                                   
                                                                    <li style="margin-top:1em;">                                                                                                                                 
                                                                        <span class="text-light" style="background-color: #3E91BB; padding:.5em;border-radius:3px;"><xsl:value-of select="./tei:title"/></span>                                                               
                                                                    </li>                                                         
                                                                </xsl:for-each>
                                                            </ul>
                                                        </div>                                                
                                                    </div>
                                                </div><!-- register works -->
                                            </xsl:if>
                                            <xsl:if test="//tei:facsimile">                             
                                                <div class="tab-pane container fade" id="register_facsimile" tabindex="-1">
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                            <ul>
                                                                <xsl:for-each select="//tei:facsimile/tei:graphic">                                                   
                                                                    <li style="margin-top:1em;">                                                                                                                                 
                                                                        <a target="_blank">
                                                                            <xsl:attribute name="href">
                                                                                <xsl:value-of select="concat($iiif, @url)"/>
                                                                            </xsl:attribute>
                                                                            <img style="width:100px;margin-right:.5em;border-radius:3px;" src="{concat($iiif, @url)}"/>
                                                                            <span class="text-light" style="background-color: #3E91BB; padding:.5em;border-radius:3px;"><xsl:value-of select="concat($iiif, @url)"/></span>
                                                                        </a>                                                               
                                                                    </li>                                                         
                                                                </xsl:for-each>
                                                            </ul>
                                                        </div>      
                                                        <div class="col-md-4">
                                                            <ul>
                                                                <li><a href="{$source_pdf}" target="_blank">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-file-earmark-pdf" viewBox="0 0 16 16">
                                                                        <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
                                                                        <path d="M4.603 14.087a.81.81 0 0 1-.438-.42c-.195-.388-.13-.776.08-1.102.198-.307.526-.568.897-.787a7.68 7.68 0 0 1 1.482-.645 19.697 19.697 0 0 0 1.062-2.227 7.269 7.269 0 0 1-.43-1.295c-.086-.4-.119-.796-.046-1.136.075-.354.274-.672.65-.823.192-.077.4-.12.602-.077a.7.7 0 0 1 .477.365c.088.164.12.356.127.538.007.188-.012.396-.047.614-.084.51-.27 1.134-.52 1.794a10.954 10.954 0 0 0 .98 1.686 5.753 5.753 0 0 1 1.334.05c.364.066.734.195.96.465.12.144.193.32.2.518.007.192-.047.382-.138.563a1.04 1.04 0 0 1-.354.416.856.856 0 0 1-.51.138c-.331-.014-.654-.196-.933-.417a5.712 5.712 0 0 1-.911-.95 11.651 11.651 0 0 0-1.997.406 11.307 11.307 0 0 1-1.02 1.51c-.292.35-.609.656-.927.787a.793.793 0 0 1-.58.029zm1.379-1.901c-.166.076-.32.156-.459.238-.328.194-.541.383-.647.547-.094.145-.096.25-.04.361.01.022.02.036.026.044a.266.266 0 0 0 .035-.012c.137-.056.355-.235.635-.572a8.18 8.18 0 0 0 .45-.606zm1.64-1.33a12.71 12.71 0 0 1 1.01-.193 11.744 11.744 0 0 1-.51-.858 20.801 20.801 0 0 1-.5 1.05zm2.446.45c.15.163.296.3.435.41.24.19.407.253.498.256a.107.107 0 0 0 .07-.015.307.307 0 0 0 .094-.125.436.436 0 0 0 .059-.2.095.095 0 0 0-.026-.063c-.052-.062-.2-.152-.518-.209a3.876 3.876 0 0 0-.612-.053zM8.078 7.8a6.7 6.7 0 0 0 .2-.828c.031-.188.043-.343.038-.465a.613.613 0 0 0-.032-.198.517.517 0 0 0-.145.04c-.087.035-.158.106-.196.283-.04.192-.03.469.046.822.024.111.054.227.09.346z"/>
                                                                    </svg>
                                                                    PDF Download</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div><!-- register facsimile -->
                                            </xsl:if>
                                        </div>
                                    </div>
                                </div>                            
                            </div>
                        </xsl:if>
                    </div><!-- card main -->
                    <div class="card card-footer">
                        <xsl:call-template name="footnote-citation"/>
                    </div>
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
    <xsl:template match="tei:div">
        <xsl:apply-templates/>     
    </xsl:template>  
    <xsl:template match="tei:p">
        <xsl:for-each select=".">
            <span class="card-text text"><xsl:apply-templates/></span>
        </xsl:for-each>  
    </xsl:template>
</xsl:stylesheet>