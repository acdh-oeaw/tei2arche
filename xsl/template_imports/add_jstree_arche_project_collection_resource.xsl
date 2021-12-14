<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:arche="https://vocabs.acdh.oeaw.ac.at/schema#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:template name="add_jstree_arche_project_collection_resource">
        <xsl:param name="arche_root_col_url"/>
        <xsl:variable name="arche_context" select="document($arche_root_col_url)"/>
        <xsl:variable name="root_col_node" select="$arche_context//arche:TopCollection"/>
        <xsl:variable name="child_cols" select="$arche_context//arche:Collection[./arche:isPartOf]"/>
        <xsl:variable name="rdf" select="'/metadata?format=application/rdf%2Bxml&amp;readMode=relatives&amp;parentProperty=https://vocabs.acdh.oeaw.ac.at/schema%23isPartOf'"/>
        <xsl:variable name="gui" select="'browser/oeaw_detail'"/>
        <xsl:variable name="turtle" select="'/metadata'"/>
        
        <!-- ####### GERMAN CONTENT ######## -->
        
        <div class="card-header">
            <h3>Unterkollektionen</h3>
        </div>
        
        <div class="card-body">
            <input type="text" id="plugins4_q" onfocus="this.value=''" value="Search..." class="input" style="margin:0em auto 1em auto; display:block; padding:4px; border-radius:4px; border:1px solid silver;"/>
            <div id="jstree">
                <ul>
                    <li class="jstree-open"><xsl:value-of select="$root_col_node/arche:hasTitle"/>
                        <ul>
                            <xsl:for-each select="$child_cols">
                                <xsl:variable name="child-res" select="document(concat(@rdf:about,$rdf))"/>
                                <li class="tree-li jstree-open">
                                    <span class="multiple-leaf">
                                        <xsl:choose>
                                            <xsl:when test="./arche:hasTitle/@xml:lang='de'">
                                                <xsl:value-of select="./arche:hasTitle[@xml:lang='de']"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="./arche:hasTitle"/>
                                            </xsl:otherwise>
                                        </xsl:choose>                           
                                        <a target='_blank' title="RDF" class="res-act-button">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="concat(@rdf:about,$rdf)"/>
                                            </xsl:attribute>
                                            <xsl:text>RDF/XML</xsl:text>
                                        </a>
                                        <a target='_blank' title="GUI" class="res-act-button">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                            </xsl:attribute>
                                            <xsl:text>GUI access</xsl:text>
                                        </a>
                                        <a target='_blank' title="TURTLE" class="res-act-button">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="concat(@rdf:about,$turtle)"/>
                                            </xsl:attribute>
                                            <xsl:text>RDF/TURTLE</xsl:text>
                                        </a>
                                    </span>
                                    <ul>
                                        <xsl:choose>
                                            <xsl:when test="exists($child-res//arche:Resource)">
                                                <xsl:for-each select="$child-res//arche:Resource/arche:hasTitle">                                                
                                                    <li class="tree-li">
                                                        <span class="multiple-leaf">
                                                            <xsl:choose>
                                                                <xsl:when test="@xml:lang='de'">
                                                                    <xsl:value-of select=".[@xml:lang='de']"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:value-of select="."/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>                                              
                                                            <a target='_blank' title="RDF" class="res-act-button">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="concat(parent::arche:Resource/@rdf:about,$rdf)"/>
                                                                </xsl:attribute>
                                                                <xsl:text>RDF/XML</xsl:text>
                                                            </a>
                                                            <a target='_blank' title="TURTLE" class="res-act-button">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="concat(parent::arche:Resource/@rdf:about,$turtle)"/>
                                                                </xsl:attribute>
                                                                <xsl:text>RDF/TURTLE</xsl:text>
                                                            </a>
                                                            <a target='_blank' title="GUI" class="res-act-button">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="replace(parent::arche:Resource/@rdf:about,'api',$gui)"/>
                                                                </xsl:attribute>
                                                                <xsl:text>GUI access</xsl:text>
                                                            </a>
                                                        </span>
                                                    </li>                                                
                                                </xsl:for-each>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:for-each select="$child-res//rdf:Description[./arche:isPartOf]/arche:hasTitle">
                                                    <li class="tree-li">
                                                        <span class="multiple-leaf">
                                                            <xsl:choose>
                                                                <xsl:when test="@xml:lang='de'">
                                                                    <xsl:value-of select=".[@xml:lang='de']"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:value-of select="."/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>                                 
                                                            <a target='_blank' title="RDF" class="res-act-button">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="concat(parent::rdf:Description/@rdf:about,$rdf)"/>
                                                                </xsl:attribute>
                                                                <xsl:text>RDF/XML</xsl:text>
                                                            </a>                                                    
                                                            <a target='_blank' title="TURTLE" class="res-act-button">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="concat(parent::rdf:Description/@rdf:about,$turtle)"/>
                                                                </xsl:attribute>
                                                                <xsl:text>RDF/TURTLE</xsl:text>                                                        
                                                            </a>
                                                            <a target='_blank' title="GUI" class="res-act-button">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="replace(parent::rdf:Description/@rdf:about,'api',$gui)"/>
                                                                </xsl:attribute>
                                                                <xsl:text>GUI access</xsl:text>
                                                            </a>
                                                        </span>
                                                    </li>                                                
                                                </xsl:for-each>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </ul><!-- nested list -->
                                </li><!-- main list item -->
                            </xsl:for-each>
                        </ul><!-- main list -->
                    </li><!-- root lit item -->
                </ul><!-- root list -->
            </div><!-- .jstree --> 
        </div>
        
        <!-- ####### ENGLISH CONTENT ######## -->
        <div class="card-header">
            <h3>Sub-Collections</h3>
        </div>
        
        <div class="card-body">
            <input type="text" id="plugins4_p" onfocus="this.value=''" value="Search..." class="input" style="margin:0em auto 1em auto; display:block; padding:4px; border-radius:4px; border:1px solid silver;"/>
            <div id="jstree2">
                <ul>
                    <li class="jstree-open"><xsl:value-of select="$root_col_node/arche:hasTitle"/>
                        <ul>
                            <xsl:for-each select="$child_cols">
                                <xsl:variable name="child-res" select="document(concat(@rdf:about,$rdf))"/>
                                <li class="tree-li jstree-open">
                                    <span class="multiple-leaf">
                                        <xsl:choose>
                                            <xsl:when test="./arche:hasTitle/@xml:lang='en'">
                                                <xsl:value-of select="./arche:hasTitle[@xml:lang='en']"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="./arche:hasTitle"/>
                                            </xsl:otherwise>
                                        </xsl:choose>                           
                                        <a target='_blank' title="RDF" class="res-act-button">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="concat(@rdf:about,$rdf)"/>
                                            </xsl:attribute>
                                            <xsl:text>RDF/XML</xsl:text>
                                        </a>
                                        <a target='_blank' title="GUI" class="res-act-button">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                            </xsl:attribute>
                                            <xsl:text>GUI access</xsl:text>
                                        </a>
                                        <a target='_blank' title="TURTLE" class="res-act-button">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="concat(@rdf:about,$turtle)"/>
                                            </xsl:attribute>
                                            <xsl:text>RDF/TURTLE</xsl:text>
                                        </a>
                                    </span>
                                    <ul>
                                        <xsl:choose>
                                            <xsl:when test="exists($child-res//arche:Resource)">
                                                <xsl:for-each select="$child-res//arche:Resource/arche:hasTitle">                                                
                                                    <li class="tree-li">
                                                        <span class="multiple-leaf">
                                                            <xsl:choose>
                                                                <xsl:when test="@xml:lang='en'">
                                                                    <xsl:value-of select=".[@xml:lang='en']"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:value-of select="."/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>                                              
                                                            <a target='_blank' title="RDF" class="res-act-button">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="concat(parent::arche:Resource/@rdf:about,$rdf)"/>
                                                                </xsl:attribute>
                                                                <xsl:text>RDF/XML</xsl:text>
                                                            </a>
                                                            <a target='_blank' title="TURTLE" class="res-act-button">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="concat(parent::arche:Resource/@rdf:about,$turtle)"/>
                                                                </xsl:attribute>
                                                                <xsl:text>RDF/TURTLE</xsl:text>
                                                            </a>
                                                            <a target='_blank' title="GUI" class="res-act-button">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="replace(parent::arche:Resource/@rdf:about,'api',$gui)"/>
                                                                </xsl:attribute>
                                                                <xsl:text>GUI access</xsl:text>
                                                            </a>
                                                        </span>
                                                    </li>                                                
                                                </xsl:for-each>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:for-each select="$child-res//rdf:Description[./arche:isPartOf]/arche:hasTitle">
                                                    <li class="tree-li">
                                                        <span class="multiple-leaf">
                                                            <xsl:choose>
                                                                <xsl:when test="@xml:lang='en'">
                                                                    <xsl:value-of select=".[@xml:lang='en']"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:value-of select="."/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>                                 
                                                            <a target='_blank' title="RDF" class="res-act-button">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="concat(parent::rdf:Description/@rdf:about,$rdf)"/>
                                                                </xsl:attribute>
                                                                <xsl:text>RDF/XML</xsl:text>
                                                            </a>                                                    
                                                            <a target='_blank' title="TURTLE" class="res-act-button">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="concat(parent::rdf:Description/@rdf:about,$turtle)"/>
                                                                </xsl:attribute>
                                                                <xsl:text>RDF/TURTLE</xsl:text>                                                        
                                                            </a>
                                                            <a target='_blank' title="GUI" class="res-act-button">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="replace(parent::rdf:Description/@rdf:about,'api',$gui)"/>
                                                                </xsl:attribute>
                                                                <xsl:text>GUI access</xsl:text>
                                                            </a>
                                                        </span>
                                                    </li>                                                
                                                </xsl:for-each>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </ul><!-- nested list -->
                                </li><!-- main list item -->
                            </xsl:for-each>
                        </ul><!-- main list -->
                    </li><!-- root lit item -->
                </ul><!-- root list -->
            </div><!-- main list -->
        </div><!-- card-body -->
    </xsl:template>
</xsl:stylesheet>