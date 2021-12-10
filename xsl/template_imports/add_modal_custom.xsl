<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://test.org/" exclude-result-prefixes="tei my xs xlink foo" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <xsl:import href="/home/daniel/Documents/tei2arche/xsl/template_imports/tei-event.xsl"/>
    
    <xsl:template name="modal-custom">        
        <!-- Modal -->
        <xsl:param name="ref-ID"/>
        <xsl:param name="title"/>
        <xsl:param name="transform"/>
        <div id="{$ref-ID}" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">                                            
                        <h4 class="modal-title" style="text-transform:uppercase;">
                            <xsl:value-of select="$title"/>
                        </h4>                                              
                        <h4><button type="button" class="ml-2 mb-1 close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button></h4>                                                        
                    </div>
                    
                    <div class="modal-body">
                        <table class="table table-striped">
                            <tbody>                                
                                <xsl:call-template name="listEvent">
                                    <xsl:with-param name="transform" select="$transform"/>
                                </xsl:call-template>                                               
                            </tbody>
                        </table>                                            
                    </div><!-- modal-body end -->                                                   
                    
                    <div class="modal-footer">
                        
                    </div>
                </div>                                           
            </div>
        </div><!-- modal content end -->
    </xsl:template>
    
</xsl:stylesheet>