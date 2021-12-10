<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://test.org/" exclude-result-prefixes="tei my xs xlink foo" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <xsl:template name="search">
        <div class="tab-pane container fade" id="search" tabindex="-1">                                                               
            <div id="searchEnd" class="row fade">                                   
                <div class="col-md-12 content-area" id="search-area"> 
                    <div class="card border-secondary">
                        <div class="card-header">
                            <h3 class="body_translations" title="Suchergebnis">Suchergebnis</h3>                                                
                        </div>
                        <div class="card-body table-responsive" id="searchTable">
                            
                        </div>
                    </div>                                                                                                                                                            
                </div><!-- .content-area -->
            </div> <!-- .row -->
        </div>
    </xsl:template>
</xsl:stylesheet>