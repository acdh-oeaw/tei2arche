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
    <xsl:param name="transform"/>
    
    <xsl:template name="cards-project">
        <xsl:param name="arche_root_col_url"/>
        <!-- ######## add active or fade to classes ########## -->
        
        <div class="tab-pane container fade" id="about" tabindex="-1">
            <div class="row fade" id="aboutEnd">                                    
                <div class="col-md-12 content-area" id="about-area"> 
                    <div class="card border-secondary">
                        <xsl:call-template name="arche_root_col"/>                        
                    </div>                                                                                                                                                            
                </div><!-- .content-area -->
            </div> <!-- .row -->
        </div>
        <div class="tab-pane container fade" id="transform" tabindex="-1">
            <div class="row">                                    
                <div class="col-md-12 content-area" id="transformation-area"> 
                    <div class="card border-secondary">
                        <xsl:call-template name="xsl_transform_info"/>                                               
                    </div>                                                                                                                                                            
                </div><!-- .content-area -->
            </div> <!-- .row -->
        </div>
    </xsl:template>

</xsl:stylesheet>