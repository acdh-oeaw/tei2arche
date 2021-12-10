<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://test.org/" exclude-result-prefixes="tei my xs xlink foo" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget add_footer_to_body.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied to html:body below page content.</p>
            <p>The template "add_footer_to_body" containes the basic ACDH-CH fundament footer.</p>     
        </desc>    
    </doc>
    
    <xsl:template name="fundament-footer">
        <!-- .wrapper-footer-full start -->
        <div class="wrapper fundament-default-footer" id="wrapper-footer-full">
            <div class="container-fluid" id="footer-full-content" tabindex="-1">
                <div class="footer-separator">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle">
                        <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"/>
                    </svg> CONTACT
                </div>
                <div class="row">
                    <div class="footer-widget col-lg-1 col-md-2 col-sm-2 col-xs-6 col-3">
                        <div class="textwidget custom-html-widget">
                            <a href="https://www.oeaw.ac.at/acdh/">
                                <img src="https://fundament.acdh.oeaw.ac.at/common-assets/images/acdh_logo.svg" class="image" alt="ACDH Logo" style="max-width: 100%; height: auto;" title="ACDH Logo"/>
                            </a>
                        </div>
                    </div>
                    <!-- .footer-widget -->
                    <div class="footer-widget col-lg-4 col-md-4 col-sm-6 col-9">
                        <div class="textwidget custom-html-widget">
                            <p>
                                ACDH-ÖAW
                                
                                <br/>
                                Austrian Centre for Digital Humanities
                                <br/>
                                Austrian Academy of Sciences
                            </p>
                            <p>
                                Sonnenfelsgasse 19,
                                
                                <br/>
                                1010 Vienna
                            </p>
                            <p>
                                T: +43 1 51581-2200
                                
                                <br/>
                                E:
                                <a href="mailto:acdh@oeaw.ac.at">acdh@oeaw.ac.at</a>
                            </p>
                        </div>
                    </div>
                    <!-- .footer-widget -->
                    <div class="footer-widget col-lg-3 col-md-4 col-sm-4 ml-auto">
                        <div class="textwidget custom-html-widget">
                            <h6>HELPDESK</h6>
                            <p>ACDH runs a helpdesk offering advice for questions related to various digital humanities topics.</p>
                            <p>
                                <a class="helpdesk-button" href="mailto:acdh-helpdesk@oeaw.ac.at">ASK US!</a>
                            </p>
                        </div>
                    </div>
                    <!-- .footer-widget -->
                    
                </div>
            </div>
        </div>
        <!-- #wrapper-footer-full -->
        <div class="footer-imprint-bar" id="wrapper-footer-secondary" style="text-align:center; padding:0.4rem 0; font-size: 0.9rem;">
            <a href="https://www.oeaw.ac.at/die-oeaw/impressum/">Impressum/Imprint</a>
        </div>
        <!-- f.wrapper-footer-full end -->
    </xsl:template>
</xsl:stylesheet>