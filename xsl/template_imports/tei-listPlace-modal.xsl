<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <xsl:import href="tei-event.xsl"/>
    <xsl:variable name="refId"/>
    
    <xsl:template name="listPlace-modal">
        <!-- Modal -->
        <div id="{$refId}" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <xsl:choose>
                            <xsl:when test="exists(./tei:placeName)">
                                <h4 class="modal-title"><xsl:text>Ort(e)</xsl:text></h4>
                            </xsl:when>
                            <xsl:when test="exists(./tei:orgName)">
                                <h4 class="modal-title"><xsl:text>Organisation(en)</xsl:text></h4>
                            </xsl:when>
                            <xsl:otherwise>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                        <h4><button type="button" class="close" data-dismiss="modal">Close</button></h4>                                                        
                    </div>
                    
                    <div class="modal-body">
                        <table class="table table-striped">
                            <tbody>                                                    
                                <xsl:if test="exists(./tei:placeName)">
                                    <tr class="table-light">
                                        <th>
                                            <ul>
                                                <xsl:for-each select="./tei:placeName">
                                                    <xsl:choose>
                                                        <xsl:when test="@type='alt'">
                                                            <li><xsl:text>Alternative Bezeichnung</xsl:text></li>
                                                            <br/>                                                                        
                                                        </xsl:when>                                                                        
                                                        <xsl:otherwise>
                                                            <li><xsl:text>Bezeichnung</xsl:text></li>
                                                            <br/>                                                                        
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:for-each> 
                                            </ul>                                                                                                                                
                                        </th>
                                        <td>
                                            <ul>
                                                <xsl:for-each select="./tei:placeName">
                                                    <xsl:choose>
                                                        <xsl:when test="@type='alt'">
                                                            <li><xsl:apply-templates/></li>                                                                                                                                                                                                                                   
                                                        </xsl:when>                                                                    
                                                        <xsl:otherwise>
                                                            <li><xsl:apply-templates/></li>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:for-each> 
                                            </ul>                                                                                                                                                                                               
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="exists(./tei:orgName)">                                                        
                                    <tr class="table-light">
                                        <th>
                                            <ul>
                                                <xsl:for-each select="./tei:orgName">
                                                    <xsl:choose>
                                                        <xsl:when test="exists(@type)">                                                                                                                                                                   
                                                            <li style="text-transform:uppercase;"><xsl:value-of select="replace(@type,'_',' ')"/></li>                                                                                
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <li style="text-transform:uppercase;"><xsl:text>Typ nicht verfügbar</xsl:text></li>                                                                                
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:for-each>
                                            </ul>
                                        </th>
                                        <td>
                                            <ul>
                                                <xsl:for-each select="./tei:orgName">                                                                                
                                                    <li><xsl:apply-templates/></li>                                                                                
                                                </xsl:for-each>
                                            </ul>
                                        </td>
                                    </tr>                                                                                                                
                                </xsl:if>
                                <xsl:if test="exists(./tei:idno)">
                                    <tr class="table-light">
                                        <th>
                                            Uri
                                        </th>
                                        <td>
                                            <xsl:for-each select="./tei:idno">
                                                <ul>
                                                    <li>
                                                        <xsl:apply-templates/>
                                                        <a target="_blank">
                                                            <xsl:attribute name="href">
                                                                <xsl:value-of select="."/>
                                                            </xsl:attribute>
                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                                            </svg>                                                               
                                                        </a>
                                                    </li>
                                                </ul>
                                            </xsl:for-each>                                                                
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="exists(./tei:location/tei:geo)">
                                    <tr class="table-light">
                                        <th>Koordinaten</th>
                                        <td>                                                               
                                            <abbr>
                                                <xsl:attribute name="title">
                                                    <xsl:variable name="coords-unformated" select="tokenize(./tei:location/tei:geo,' ')"/>
                                                    <xsl:variable name="coords-formated" select="concat('Lat: ',subsequence($coords-unformated,1,1),' Long: ',subsequence($coords-unformated,2,1))"/>
                                                    <xsl:value-of select="$coords-formated"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="lat">
                                                    <xsl:variable name="coords-unformated" select="tokenize(./tei:location/tei:geo,' ')"/>
                                                    <xsl:variable name="coords-formated" select="subsequence($coords-unformated,1,1)"/>
                                                    <xsl:value-of select="$coords-formated"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="long">
                                                    <xsl:variable name="coords-unformated" select="tokenize(./tei:location/tei:geo,' ')"/>
                                                    <xsl:variable name="coords-formated" select="subsequence($coords-unformated,2,1)"/>
                                                    <xsl:value-of select="$coords-formated"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="subTitle">                                
                                                    <xsl:value-of select="./tei:placeName"/>
                                                </xsl:attribute> 
                                                <xsl:attribute name="class">                                
                                                    <xsl:value-of select="'map-coordinates'"/>
                                                </xsl:attribute>                                                                    
                                                <xsl:value-of select="./tei:location/tei:geo"/>
                                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                                    <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                </svg>                                                       
                                            </abbr>                                                                
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="exists(./tei:listEvent)">                                                    
                                    <xsl:call-template name="listEvent"/>                                                                                                                
                                </xsl:if>
                            </tbody>
                        </table>                                            
                    </div><!-- modal-body end -->                                                   
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>                                           
            </div>
        </div><!-- modal content end -->    
        
    </xsl:template>
</xsl:stylesheet>