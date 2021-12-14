<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>

    
    <xsl:template name="listPlace"> 
        <xsl:param name="transform"/>
        <xsl:for-each select="//tei:listPlace"> 
            <div class="table-responsive"> 
                <table class="table table-striped table-hover" id="tableOne">
                    <thead>
                        <tr>
                            <th>
                                <span class="body_translations" title="Ortsname (normalisiert)"><xsl:text>Ortsname (normalisiert)</xsl:text></span>
                            </th>
                            <th>
                                <span class="body_translations" title="Alternative Schreibweisen"><xsl:text>Alternative Schreibweisen</xsl:text></span>
                            </th>
                            <th>
                                <xsl:text>URI</xsl:text>
                            </th>
                            <th>
                                <xsl:text>Latitude</xsl:text>
                            </th>
                            <th>
                                <xsl:text>Longitude</xsl:text>
                            </th>
                            <th>
                                <span class="body_translations" title="Erwähnungen"><xsl:text>Erwähnungen</xsl:text></span>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="./tei:place">
                            <xsl:choose>
                                <xsl:when test="./not(node())">
                                    <!-- if tei:person does not have any nodes it does not include them -->
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr>
                                        <td>                                            
                                            <xsl:choose>
                                                <xsl:when test="./tei:note/tei:p">
                                                    <a href="#" data-toggle="modal" >
                                                        <xsl:attribute name="data-target">
                                                            <xsl:value-of select="concat('#',@xml:id)"/>
                                                        </xsl:attribute>
                                                        <xsl:choose>
                                                            <xsl:when test="./tei:placeName[not(@type='alt' or @type='pref')]">
                                                                <xsl:value-of select="./tei:placeName[not(@type='alt' or @type='pref')]"/>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:value-of select="./tei:placeName[@type='pref']"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>                                    
                                                    </a>
                                                    <xsl:call-template name="modal-custom">
                                                        <xsl:with-param name="ref-ID" select="@xml:id"/>
                                                        <xsl:with-param name="transform" select="$transform"/>
                                                        <xsl:with-param name="title">
                                                            <xsl:choose>
                                                                <xsl:when test="./tei:placeName[not(@type='alt' or @type='pref')]">
                                                                    <xsl:value-of select="./tei:placeName[not(@type='alt' or @type='pref')]"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:value-of select="./tei:placeName[@type='pref']"/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:with-param>
                                                    </xsl:call-template>  
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="./tei:placeName"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td>
                                            <xsl:if test="./tei:placeName[@type='alt'] or ./tei:placeName[@type='pref']">
                                                <ul>
                                                    <xsl:for-each select="./tei:placeName[@type='alt']">
                                                        <li>
                                                            <xsl:apply-templates/>
                                                        </li>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="./tei:placeName[@type='pref']">
                                                        <li>
                                                            <xsl:apply-templates/>
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>       
                                            </xsl:if>
                                        </td> 
                                        <td>
                                            <xsl:if test="./tei:idno">
                                                <xsl:for-each select="./tei:idno">
                                                    <ul>
                                                        <li>                                                        
                                                            <a target="_blank">
                                                                <xsl:attribute name="href">
                                                                    <xsl:value-of select="."/>
                                                                </xsl:attribute>
                                                                <xsl:apply-templates/>                                                               
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </xsl:for-each>   
                                            </xsl:if>
                                        </td>
                                        <td>
                                            <xsl:if test="string-length(./tei:location/tei:geo) != 0">
                                                <xsl:for-each select="./tei:location">
                                                    <abbr>                                        
                                                        <xsl:variable name="coords-unformated" select="tokenize(./tei:geo,' ')"/>
                                                        <xsl:variable name="coords-formated-lat" select="subsequence($coords-unformated,1,1)"/>
                                                        <xsl:variable name="coords-formated-long" select="subsequence($coords-unformated,2,1)"/>
                                                        <xsl:attribute name="title">                                            
                                                            <xsl:variable name="coords-formated" select="concat('Latitude: ',$coords-formated-lat)"/>
                                                            <xsl:value-of select="$coords-formated"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="lat">                                            
                                                            <xsl:value-of select="$coords-formated-lat"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="long">                                           
                                                            <xsl:value-of select="$coords-formated-long"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="subtitle">                                           
                                                            <xsl:if test="following-sibling::tei:placeName">
                                                                <xsl:for-each select="following-sibling::tei:placeName">
                                                                    <xsl:choose>
                                                                        <xsl:when test=".[not(@type='alt' or @type='pref')]">
                                                                            <xsl:value-of select=".[not(@type='alt' or @type='pref')]"/>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <xsl:value-of select=".[@type='pref']"/>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                    <br/>
                                                                </xsl:for-each>
                                                            </xsl:if>
                                                            <xsl:if test="preceding-sibling::tei:placeName">
                                                                <xsl:for-each select="preceding-sibling::tei:placeName">
                                                                    <xsl:choose>
                                                                        <xsl:when test=".[not(@type='alt' or @type='pref')]">
                                                                            <xsl:value-of select=".[not(@type='alt' or @type='pref')]"/>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <xsl:value-of select=".[@type='pref']"/>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                    <br/>
                                                                </xsl:for-each>
                                                            </xsl:if> 
                                                        </xsl:attribute>
                                                        <xsl:attribute name="class">                                
                                                            <xsl:text>map-coordinates</xsl:text>
                                                        </xsl:attribute>                                        
                                                        <xsl:value-of select="$coords-formated-lat"/>
                                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                                            <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                        </svg>                                                       
                                                    </abbr>
                                                </xsl:for-each>
                                            </xsl:if>
                                        </td>     
                                        <td>
                                            <xsl:if test="string-length(./tei:location/tei:geo) != 0">
                                                <xsl:for-each select="./tei:location">
                                                    <abbr>
                                                        <xsl:variable name="coords-unformated" select="tokenize(./tei:geo,' ')"/>
                                                        <xsl:variable name="coords-formated-lat" select="subsequence($coords-unformated,1,1)"/>
                                                        <xsl:variable name="coords-formated-long" select="subsequence($coords-unformated,2,1)"/>
                                                        <xsl:attribute name="title">                                            
                                                            <xsl:variable name="coords-formated" select="concat('Longitude: ',$coords-formated-long)"/>
                                                            <xsl:value-of select="$coords-formated"/>
                                                        </xsl:attribute>                                                                               
                                                        <xsl:value-of select="$coords-formated-long"/>
                                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                                            <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                        </svg>                                                       
                                                    </abbr>
                                                </xsl:for-each> 
                                            </xsl:if>
                                        </td>                                                               
                                        <td>
                                            <xsl:if test="./tei:listEvent">
                                                <xsl:for-each select="./tei:listEvent">
                                                    <xsl:value-of select="count(tei:event)"/>
                                                </xsl:for-each>    
                                            </xsl:if>
                                        </td>
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>                            
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>