<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-header_xenoData_RDF.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "tei-header_xenoData_RDF" can handle the tei/xml tag xenoData that is used for rdf data.</p>
            <p>The template creates an isotope masonry grid with a search button filter containing the rdf metadata.</p>
        </desc>    
    </doc>
    
    <xsl:template name="rdf-xenoData">
        <div class="button-group filter-button-group" style="display:none;">
            <button class="button is-checked btn btn-primary" data-filter="*">Show all</button>
            <xsl:for-each-group select="//tei:xenoData/rdf:Description/skos:inScheme" group-by="@rdf:resource">
                <button class="button btn btn-primary">
                    <xsl:attribute name="data-filter">
                        <!-- non generic -->
                        <!--<xsl:value-of select="concat('.',substring-before(substring-after(current-grouping-key(),'aschach/'),'/Schema'))"/>-->
                        <!-- generic -->
                        <xsl:variable name="schema" select="tokenize(current-grouping-key(),'/')"/>
                        <xsl:variable name="schema-formated" select="concat('.',subsequence($schema,count($schema)-1,1))"/>
                        <xsl:value-of select="$schema-formated"/>
                    </xsl:attribute>
                    <!-- non generic -->
                    <!--<xsl:value-of select="concat('Schema: ',substring-before(substring-after(current-grouping-key(),'aschach/'),'/Schema'))"/>-->
                    <!-- generic -->
                    <xsl:variable name="schema" select="tokenize(current-grouping-key(),'/')"/>
                    <xsl:variable name="schema-formated" select="subsequence($schema,count($schema)-1,1)"/>
                    <xsl:value-of select="concat('Scheme: ',$schema-formated)"/>
<!--                    <a target="_blank"><xsl:attribute name="href">
                        <xsl:value-of select="current-grouping-key()"/>
                    </xsl:attribute>
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                            <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                        </svg></a>-->
                </button>
            </xsl:for-each-group>
            <br/>
            <hr/>
            <xsl:for-each select="//tei:xenoData/rdf:Description">
                <button class="button btn btn-secondary">
                    <xsl:attribute name="data-filter">
                        <xsl:choose>
                            <xsl:when test="./skos:prefLabel">
                                <xsl:variable name="spaces" select="replace(./skos:prefLabel,'\s','_')"/>
                                <xsl:variable name="brackets" select="replace($spaces,'\(','')"/>
                                <xsl:variable name="slash" select="replace($brackets,'/','-')"/>
                                <xsl:variable name="label_cleaned" select="replace($slash,'\)','')"/>
                                <xsl:value-of select="concat('.',$label_cleaned)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat('.',./skos:prefLabel)"/>
                            </xsl:otherwise>
                        </xsl:choose>                                 
                    </xsl:attribute> 
                    <xsl:value-of select="./skos:prefLabel"/>                                                         
                </button> 
            </xsl:for-each>
        </div>
        <div class="grid-sizer"></div>
        <div class="grid">
            <xsl:for-each-group select="//tei:xenoData" group-by=".//rdf:Description/skos:inScheme/@rdf:resource">
                <xsl:for-each select=".">                                                              
                    <xsl:for-each select="current-group()//rdf:Description">                                                        
                        <div>
                            <xsl:attribute name="class">
                                <xsl:value-of select="'grid-item '"/> 
                                <xsl:value-of select="'card-body '"/>
                                <xsl:choose>
                                    <xsl:when test="./skos:prefLabel">
                                        <xsl:variable name="spaces" select="replace(./skos:prefLabel,'\s','_')"/>
                                        <xsl:variable name="brackets" select="replace($spaces,'\(','')"/>
                                        <xsl:variable name="slash" select="replace($brackets,'/','-')"/>
                                        <xsl:variable name="label_cleaned" select="replace($slash,'\)','')"/>
                                        <xsl:value-of select="$label_cleaned"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="./skos:prefLabel"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!-- non generic -->
                                <!--<xsl:value-of select="concat(' ',substring-before(substring-after(current-grouping-key(),'aschach/'),'/Schema'))"/>-->
                                <!-- generic -->
                                <xsl:variable name="schema" select="tokenize(current-grouping-key(),'/')"/>
                                <xsl:variable name="schema-formated" select="concat(' ',subsequence($schema,count($schema)-1,1))"/>
                                <xsl:value-of select="$schema-formated"/>
                            </xsl:attribute>
                            <dl class="grid-dl">
                                <xsl:for-each select="./*">
                                    <xsl:choose>
                                        <xsl:when test="@rdf:resource">
                                            <dt><xsl:value-of select="substring-after(./name(.),':')"/></dt>
                                            <dd><h5><xsl:value-of select="."/><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@rdf:resource"/></xsl:attribute>
                                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                                </svg></a></h5></dd>                                                                                  
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <dt><xsl:value-of select="substring-after(./name(.),':')"/></dt>
                                            <dd><h5><xsl:value-of select="."/></h5></dd>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    
                                    <!-- non generic xslt -->
                                    
                                    <!--<dt><xsl:value-of select="substring-after(./skos:prefLabel/name(.),':')"/></dt>                                       
                                    <dd><h5><xsl:value-of select="./skos:prefLabel"/></h5></dd>
                                    <dt><xsl:value-of select="substring-after(./skos:definition/name(.),':')"/></dt>
                                    <dd><h5><xsl:value-of select="./skos:definition"/></h5></dd>
                                    <dt><xsl:value-of select="substring-after(./skos:altLabel/name(.),':')"/></dt>
                                    <dd><h5><xsl:value-of select="./skos:altLabel"/></h5></dd>
                                    <dt>URI</dt>                                                     
                                    <dd><h5><xsl:value-of select="substring-after(data(@rdf:about), 'waren/')"/><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@rdf:about"/></xsl:attribute>
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                    </svg></a></h5></dd>
                                    <!-\-<dt>Schema URI</dt>
                                    <dd><h5><xsl:value-of select="substring-before(substring-after(current-grouping-key(),'aschach/'),'/Schema')"/><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="current-grouping-key()"/></xsl:attribute>
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                        </svg></a></h5></dd>-\->
                                    <dt><xsl:value-of select="substring-after(./dc:source/name(.),':')"/></dt>
                                    <dd><h5><xsl:value-of select="./dc:source"/></h5></dd>-->
                                    
                                </xsl:for-each>
                                <dt>URI</dt>                                                     
                                <dd><h5><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@rdf:about"/></xsl:attribute>
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                    </svg></a></h5>
                                </dd>
                            </dl>
                        </div>
                    </xsl:for-each>                                                       
                </xsl:for-each>          
            </xsl:for-each-group> 
        </div><!-- .grid -->
    </xsl:template>
</xsl:stylesheet>