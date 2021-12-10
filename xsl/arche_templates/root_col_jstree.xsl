<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:arche="https://vocabs.acdh.oeaw.ac.at/schema#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:foo="foo.com"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:template name="jstree">
        <xsl:param name="arche_root_col_url"/>
        <xsl:variable name="arche_context" select="document($arche_root_col_url)"/>
        <xsl:variable name="root_col_node" select="$arche_context//arche:TopCollection"/>
        <xsl:variable name="child_cols" select="$arche_context//arche:Collection[./arche:isPartOf]"/>
        <xsl:variable name="rdf" select="'/metadata?format=application/rdf%2Bxml'"/>
        <xsl:variable name="gui" select="'browser/oeaw_detail'"/>
        <xsl:variable name="turtle" select="'/metadata'"/>        
        <div class="card-header">
            <h3 title="Unterkollektionen" class="body_translations">Unterkollektionen</h3>
        </div>
        <div class="card-body">
            <input type="text" id="plugins4_q" onfocus="this.value=''" title="Suchen..." value="Suchen..." class="input body_translations" style="margin:0em auto 1em auto; display:block; padding:4px; border-radius:4px; border:1px solid silver;"/>            
            <div id="jstree" style="border:1px dotted;border-radius:5px;">                               
                <ul>
                    <xsl:for-each select="$child_cols">
                        <xsl:variable name="rdf_xml_child_col" select="concat(@rdf:about,$rdf)"/>
                        <li class="tree-li jstree-open child_col_de" data-target="{$rdf_xml_child_col}">
                            <span class="multiple-leaf">
                                <xsl:choose>
                                    <xsl:when test="./arche:hasTitle/@xml:lang='de'">
                                        <span class="resource-ajax"><xsl:value-of select="./arche:hasTitle[@xml:lang='de']"/></span>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <span class="resource-ajax"><xsl:value-of select="./arche:hasTitle"/></span>
                                    </xsl:otherwise>
                                </xsl:choose>  
                                <a target='_blank' title="GUI" class="res-act-button">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                    </xsl:attribute>
                                    <xsl:text>GUI-Zugriff</xsl:text>
                                </a>
                                <a target='_blank' title="RDF" class="res-act-button">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat(@rdf:about,$rdf)"/>
                                    </xsl:attribute>
                                    <xsl:text>RDF/XML</xsl:text>
                                </a>                                                
                                <a target='_blank' title="TURTLE" class="res-act-button">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat(@rdf:about,$turtle)"/>
                                    </xsl:attribute>
                                    <xsl:text>RDF/TURTLE</xsl:text>
                                </a>
                            </span>                                                                                        
                        </li><!-- .child_col -->
                    </xsl:for-each>
                </ul><!-- collections -->   
            </div><!-- jstree -->
        </div> <!-- .card-body -->
    </xsl:template>
</xsl:stylesheet>