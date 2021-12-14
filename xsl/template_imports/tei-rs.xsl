<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-rs.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "tei-rs" can handle the tei/xml tag rs.</p> 
            <p>The template verifies if attributes like ref and target is available.</p>
            <p>If a target attribute is found the value is used as URL and a html link is created.</p>
            <p>If a ref attribute is found the template searches for URI, URL,VIAF or GND of a corresponding indo that is part of the same ref number.</p>
            <p>If a target attribute is found the ref value will be used as URL and create a html link if the value starts with http or www.</p>
            <p>The template rules for the tei:body verifies the attribute type value and seperates between place or org and person.</p>
            <p>For place and org an idno URL with the same parameters as mentioned before will be used to create a html link and coordinates via the tei:geo tag are retrieved and formated for further usage.</p>
            <p>For person an idno URL with the same parameters as mentioned before will be used to create a html link.</p>
        </desc>    
    </doc>
    
    <xsl:template match="tei:rs">
        <xsl:variable name="refId">
            <xsl:value-of select="substring-after(data(@ref), '#')"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="//id($refId)//rdf:Description">
                <xsl:apply-templates/>
                    <xsl:for-each select="//id($refId)//rdf:Description">
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@rdf:about"/>
                            </xsl:attribute>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                            </svg>            
                        </a>
                    </xsl:for-each>
                
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="@type='place' or @type='org'">
                <span class="place-org"><xsl:apply-templates/></span>
                <xsl:choose>
                    <xsl:when test="//id($refId)//tei:idno">                            
                        <xsl:for-each select="//id($refId)//tei:idno">                           
                            <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>                           
                            </a>
                        </xsl:for-each>
                        <xsl:if test="exists(//id($refId)//tei:geo)">
                            <abbr>
                                <xsl:attribute name="title">
                                    <xsl:variable name="coords-unformated" select="tokenize(//id($refId)//tei:geo,' ')"/>
                                    <xsl:variable name="coords-formated" select="concat('Lat: ',subsequence($coords-unformated,1,1),' Long: ',subsequence($coords-unformated,2,1))"/>
                                    <xsl:value-of select="$coords-formated"/>
                                </xsl:attribute>
                                <xsl:attribute name="lat">
                                    <xsl:variable name="coords-unformated" select="tokenize(//id($refId)//tei:geo,' ')"/>
                                    <xsl:variable name="coords-formated" select="subsequence($coords-unformated,1,1)"/>
                                    <xsl:value-of select="$coords-formated"/>
                                </xsl:attribute>
                                <xsl:attribute name="long">
                                    <xsl:variable name="coords-unformated" select="tokenize(//id($refId)//tei:geo,' ')"/>
                                    <xsl:variable name="coords-formated" select="subsequence($coords-unformated,2,1)"/>
                                    <xsl:value-of select="$coords-formated"/>
                                </xsl:attribute>
                                <xsl:attribute name="subtitle">                                
                                    <xsl:value-of select="//id($refId)/tei:placeName"/>
                                </xsl:attribute> 
                                <xsl:attribute name="class">                                
                                    <xsl:value-of select="'map-coordinates'"/>
                                </xsl:attribute>                            
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                    <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                </svg>                            
                            </abbr>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@type='person'">
                <span class="person">
                <xsl:if test="//id($refId)/tei:birth/tei:date/@when-iso">
                    <xsl:attribute name="data-birthday">
                        <xsl:value-of select="data(//id($refId)/tei:birth/tei:date/@when-iso)"/>
                    </xsl:attribute>
                </xsl:if>                    
                <xsl:if test="//id($refId)//tei:placeName">
                    <xsl:attribute name="data-placeName">
                        <xsl:value-of select="//id($refId)//tei:placeName/text()"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates/>
                <xsl:if test="//id($refId)//tei:idno">                               
                    <xsl:for-each select="//id($refId)//tei:idno">
                        <xsl:if test="string-length(name(.)) != 0">
                            <xsl:if test="@type='GND' or @type='VIAF' or @type='URI' or @type='URL'">
                                <a target="_blank">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="."/>
                                    </xsl:attribute>
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                    </svg>            
                                </a>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>                       
                </xsl:if>
                </span>
            </xsl:when>                                       
            <xsl:when test="starts-with(@ref,'#')">
                <span class="person"><xsl:apply-templates/></span>               
            </xsl:when>
            <xsl:when test="@ref">
                <span><xsl:apply-templates/></span>                     
                <a target="_blank">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@ref"/>
                    </xsl:attribute>
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                    </svg>            
                </a>   
            </xsl:when>
            <xsl:when test="@target">
                <span><xsl:apply-templates/></span>                     
                <a target="_blank">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
                    </xsl:attribute>
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-up-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                    </svg>            
                </a>   
            </xsl:when>
            <xsl:otherwise>
                <span class="person"><xsl:apply-templates/></span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>