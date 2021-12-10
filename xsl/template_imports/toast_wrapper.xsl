<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:arche="https://vocabs.acdh.oeaw.ac.at/schema#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:foo="foo.com"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:template name="toast_wrapper">
        <div id="toast_styles" aria-live="polite" aria-atomic="true" style="position: relative; z-index:999;">
            <div id="toast_wrapper" style="position: absolute; top: 0; right: 0;">
                
            </div>
        </div>        
    </xsl:template>
    
</xsl:stylesheet>