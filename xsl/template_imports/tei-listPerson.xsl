<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <xsl:import href="tei-event.xsl"/>
    <xsl:param name="entityID"/>
    <xsl:variable name="entity" as="node()">
        <xsl:choose>
            <xsl:when test="//tei:person[@xml:id=$entityID][1]">
                <xsl:value-of select="//tei:person[@xml:id=$entityID][1]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="false()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:template name="listPerson">
        <!-- Modal -->
        <div id="{$entityID}" class="modal fade" role="dialog" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
                <div class="modal-content">
                    <xsl:choose>
                        <xsl:when test="$entity">
                            <div class="modal-header">
                                <xsl:variable name="entity" select="//tei:person[@xml:id=$entityID]"/>
                                <h4 class="modal-title">
                                    <xsl:choose>
                                        <xsl:when test="//$entity//tei:surname[1]/text()">
                                            <xsl:value-of select="$entity//tei:surname[1]/text()"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$entity//tei:persName[1]"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <br/>
                                    <small>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="concat('hits.html?searchkey=', $entityID)"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="target">_blank</xsl:attribute>
                                            erwähnt in
                                        </a>
                                    </small>
                                </h4>
                                <h3><button type="button" class="close" data-dismiss="modal">Close</button></h3>                                                        
                            </div>
                            <div class="modal-body">
                                <table class="table table-striped">
                                    <tbody>
                                        <xsl:variable name="entity" select="//tei:person[@xml:id=$entityID]"/>
                                        <xsl:for-each select="$entity">
                                            <xsl:if test="exists(./tei:idno)">
                                                <tr>
                                                    <th>
                                                        Uri
                                                    </th>
                                                    <td>
                                                        <xsl:value-of select="./tei:idno"/>
                                                        <a target="_blank">
                                                            <xsl:attribute name="href">
                                                                <xsl:value-of select="./tei:idno"/>
                                                            </xsl:attribute>
                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                                            </svg>                                                               
                                                        </a>
                                                    </td>
                                                </tr>                                                                                            
                                            </xsl:if>                                                   
                                            <xsl:if test="exists(./tei:persName)">
                                                <tr>
                                                    <th>Name</th>
                                                    <td><xsl:value-of select="./tei:persName"/></td>
                                                </tr>
                                            </xsl:if>                                                    
                                            <!--<xsl:if test="exists(./tei:birth)">
                                                <xsl:for-each select="./tei:birth/tei:date">
                                                    <tr class="table-light">
                                                        <th>                                                                 
                                                            <xsl:value-of select="'Birth-Date'"/>
                                                            
                                                        </th>
                                                        <td>
                                                            <xsl:apply-templates/>                                                                  
                                                        </td> 
                                                    </tr>                                                            
                                                </xsl:for-each>   
                                                <xsl:for-each select="./tei:birth/tei:placeName">
                                                    <tr class="table-light">
                                                        <th>                                                                   
                                                            <xsl:value-of select="'Birth-Place'"/>
                                                        </th>
                                                        <td>                                                                    
                                                            <xsl:apply-templates/>                                                                
                                                        </td> 
                                                    </tr>   
                                                </xsl:for-each>
                                            </xsl:if>
                                            <xsl:if test="exists(./tei:death)">
                                                <xsl:for-each select="./tei:death/tei:date">
                                                    <tr class="table-light">
                                                        <th>                                                                   
                                                            <xsl:value-of select="'Death-Date'"/>
                                                        </th>
                                                        <td>                                                                    
                                                            <xsl:apply-templates/>                                                                
                                                        </td> 
                                                    </tr>   
                                                </xsl:for-each>   
                                                <xsl:for-each select="./tei:death/tei:placeName">
                                                    <tr class="table-light">
                                                        <th>                                                                   
                                                            <xsl:value-of select="'Death-Place'"/>
                                                        </th>
                                                        <td>                                                                    
                                                            <xsl:apply-templates/>                                                                
                                                        </td> 
                                                    </tr> 
                                                </xsl:for-each>
                                            </xsl:if>
                                            <xsl:if test="exists(./tei:note)"> 
                                                <tr class="table-light">
                                                    <th>Lebensdaten</th>
                                                    <td><xsl:value-of select="./tei:note/tei:p[1]"/></td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>Biographie</th>
                                                    <td><xsl:value-of select="./tei:note/tei:p[2]"/></td>
                                                </tr>                                                                                                                               
                                            </xsl:if>                                                   
                                            
                                            <!-\- ************* template import tei-event ************* -\->
                                            <xsl:if test="exists(./tei:listEvent)">
                                                <xsl:call-template name="listEvent"/>
                                            </xsl:if> -->
                                        </xsl:for-each>
                                    </tbody>
                                </table>                                            
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </xsl:when>
                        <xsl:otherwise>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span class="fa fa-times"/>
                                </button>
                                <h3 class="modal-title">
                                    Looks like there doesn't exist an index entry <strong>
                                        <xsl:value-of select="$entityID"/>
                                    </strong> for the entity you were looking for 
                                </h3>
                                
                            </div>
                        </xsl:otherwise>
                    </xsl:choose>

                </div><!-- modal-dialog -->                                             
            </div><!-- modal-content -->   
        </div><!-- modal -->      
        <script type="text/javascript">
            $(window).load(function(){
                $('#myModal').modal('show');
            });
        </script>
    </xsl:template>
    
</xsl:stylesheet>