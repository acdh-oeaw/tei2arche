<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:arche="https://vocabs.acdh.oeaw.ac.at/schema#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:foo="foo.com"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:template name="arche_root_col">
        <div class="card-header border-primary" id="metadata_title">            
            <div class="loading_animation_head"/>
        </div>
        <div class="card-body" id="metadata_description">
            <div class="loading_animation"/>
        </div>
        <div class="card-header" id="metadata_keyword">
            <div class="loading_animation_head"/>
        </div>
        <div class="card-body">
            <div class="loading_animation"/>
            <ul id="metadata_keywords">
                
            </ul>
        </div>
        <div class="card-header" id="metadata_actor">
            <div class="loading_animation_head"/>
        </div>
        <div class="card-body">
            <div class="loading_animation"/>
            <table class="table table-metadata">
                <tbody id="metadata_person" style="text-align:left">
                                                
                </tbody> 
            </table>
        </div>
        <div class="card-header" id="metadata_right">
            <div class="loading_animation_head"/>
        </div>
        <div class="card-body">
            <div class="loading_animation"/>
            <table class="table table-metadata">
                <tbody id="metadata_rights" style="text-align:left">
                    
                </tbody> 
            </table>
        </div>
        <div class="card-header" id="metadata_other">
            <div class="loading_animation_head"/>
        </div>
        <div class="card-body">
            <div class="loading_animation"/>
            <table class="table table-metadata">
                <tbody id="metadata_others" style="text-align:left">
                    
                </tbody> 
            </table>
        </div>                
    </xsl:template>

</xsl:stylesheet>
