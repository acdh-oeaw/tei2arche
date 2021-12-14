<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-rs-modal.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "tei-rs-modal" uses the same logic as the templace tei-rs, however creates a modal window instead of a single link..</p> 
            <p>The template "tei-rs-modal" can handle the tei/xml tag rs.</p> 
            <p>The template verifies if attributes like ref and target is available.</p>
            <p>If a target attribute is found the value is used as URL and a html link is created.</p>
            <p>If a ref attribute is found the template searches for URI, URL,VIAF or GND of a corresponding indo that is part of the same ref number.</p>
            <p>If a target attribute is found the ref value will be used as URL and create a html link if the value starts with http or www.</p>
            <p>The template rules for the tei:body verifies the attribute type value and seperates between place or org and person.</p>
            <p>For place and org an idno URL with the same parameters as mentioned before will be used to create a html link and coordinates via the tei:geo tag are retrieved and formated for further usage.</p>
            <p>For person an idno URL with the same parameters as mentioned before will be used to create a html link.</p>
        </desc>    
    </doc>
    
    <xsl:import href="https://acdh-oeaw.github.io/tei2arche/xsl/template_imports/tei-event.xsl"/>
    <xsl:param name="transform"/>
    
    <xsl:template match="tei:rs">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = '' or $view = 'links'">               
                <xsl:variable name="refId">
                    <xsl:value-of select="substring-after(data(@ref), '#')"/>
                </xsl:variable> 
                <xsl:variable name="refId-multi-token" select="tokenize(replace(@ref,'#',''),'\s')"/>                
                <xsl:variable name="count" select="count($refId-multi-token)"/> 
                <xsl:variable name="xmlId">
                    <xsl:value-of select="data(@xml:id)"/>
                </xsl:variable>  
                <xsl:choose>
                    <xsl:when test="@type='concept'">
                        <!-- Trigger the modal with a link -->                   
                        <span class="concept"><a href="#" data-toggle="modal" data-target="#{replace($refId,'\.','_')}">                                
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </a></span>
                        <xsl:choose>
                            <xsl:when test="//id($refId)">                                  
                                <xsl:for-each select="//id($refId)">                            
                                    <!-- Modal -->
                                    <div id="{replace($refId,'\.','_')}" class="modal fade" role="dialog">
                                        <div class="modal-dialog modal-lg">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">                                            
                                                    <h4 class="modal-title body_translations" style="text-transform:uppercase;" title="Konzept(e)">Konzept(e)</h4>                                             
                                                    <h4><button type="button" class="ml-2 mb-1 close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button></h4>                                                        
                                                </div>
                                                
                                                <div class="modal-body">
                                                    <table class="table table-striped">
                                                        <tbody>
                                                            <xsl:if test="exists(./rdf:Description/skos:prefLabel)">                                                        
                                                                <tr>
                                                                    <th>
                                                                        <ul>
                                                                            <xsl:for-each select="./rdf:Description/skos:prefLabel">                                                                                                                                                            
                                                                                <li style="text-transform:uppercase;"><xsl:value-of select="substring-after(name(),'pref')"/></li>                                                                                
                                                                            </xsl:for-each>
                                                                        </ul>
                                                                    </th>
                                                                    <td>
                                                                        <ul>
                                                                            <xsl:for-each select="./rdf:Description/skos:prefLabel">                                                                                                                                                            
                                                                                <li><xsl:apply-templates/></li>                                                                                
                                                                            </xsl:for-each>
                                                                        </ul>
                                                                    </td>
                                                                </tr>                                                                                                                
                                                            </xsl:if>
                                                            <xsl:if test="exists(./rdf:Description/dc:source)">                                                        
                                                                <tr>
                                                                    <th>
                                                                        <ul>
                                                                            <xsl:for-each select="./rdf:Description/dc:source">                                                                                                                                                            
                                                                                <li style="text-transform:uppercase;">
                                                                                    <xsl:value-of select="substring-after(name(),'dc:')"/>
                                                                                </li>                                                                                
                                                                            </xsl:for-each>
                                                                        </ul>
                                                                    </th>
                                                                    <td>
                                                                        <ul>
                                                                            <xsl:for-each select="./rdf:Description/dc:source">                                                                                                                                                            
                                                                                <li><xsl:apply-templates/></li>                                                                                
                                                                            </xsl:for-each>
                                                                        </ul>
                                                                    </td>
                                                                </tr>                                                                                                                
                                                            </xsl:if>                                                    
                                                            <xsl:if test="exists(./rdf:Description)">
                                                                <tr>
                                                                    <th>
                                                                        <ul>
                                                                            <xsl:for-each select="./rdf:Description">
                                                                                <li style="text-transform:uppercase;"><xsl:text>Uri</xsl:text></li>                                                                     
                                                                            </xsl:for-each> 
                                                                        </ul>                                                                                                                                
                                                                    </th>
                                                                    <td>
                                                                        <ul>
                                                                            <xsl:for-each select="./rdf:Description">      
                                                                                <li>
                                                                                    <xsl:value-of select="@rdf:about"/>                                                                            
                                                                                </li>                                                                        
                                                                            </xsl:for-each> 
                                                                        </ul>                                                                                                                                                                                               
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>                                                 
                                                            <xsl:if test="exists(./rdf:Description/rdf:type)">                                                        
                                                                <tr>
                                                                    <th>
                                                                        <ul>
                                                                            <xsl:for-each select="./rdf:Description/rdf:type">                                                                                                                                                            
                                                                                <li style="text-transform:uppercase;"><xsl:value-of select="substring-after(name(),'rdf:')"/></li>                                                                                
                                                                            </xsl:for-each>
                                                                        </ul>
                                                                    </th>
                                                                    <td>
                                                                        <ul>
                                                                            <xsl:for-each select="./rdf:Description/rdf:type">                                                                                                                                                            
                                                                                <li>
                                                                                    <xsl:value-of select="@rdf:resource"/>                                                                            
                                                                                </li>                                                                                
                                                                            </xsl:for-each>
                                                                        </ul>
                                                                    </td>
                                                                </tr>                                                                                                                
                                                            </xsl:if>
                                                            <xsl:if test="exists(./rdf:Description/skos:inScheme)">                                                        
                                                                <tr>
                                                                    <th>
                                                                        <ul>
                                                                            <xsl:for-each select="./rdf:Description/skos:inScheme">                                                                                                                                                            
                                                                                <li style="text-transform:uppercase;"><xsl:value-of select="substring-after(name(),'skos:')"/></li>                                                                                
                                                                            </xsl:for-each>
                                                                        </ul>
                                                                    </th>
                                                                    <td>
                                                                        <ul>
                                                                            <xsl:for-each select="./rdf:Description/skos:inScheme">                                                                                                                                                            
                                                                                <li>
                                                                                    <xsl:value-of select="@rdf:resource"/>                                                                            
                                                                                </li>                                                                                
                                                                            </xsl:for-each>
                                                                        </ul>
                                                                    </td>
                                                                </tr>                                                                                                                
                                                            </xsl:if>
                                                            <xsl:if test="exists(./rdf:Description/skos:topConceptOf)">                                                        
                                                                <tr>
                                                                    <th>
                                                                        <ul>
                                                                            <xsl:for-each select="./rdf:Description/skos:topConceptOf">                                                                                                                                                            
                                                                                <li style="text-transform:uppercase;"><xsl:value-of select="substring-after(name(),'skos:')"/></li>                                                                                
                                                                            </xsl:for-each>
                                                                        </ul>
                                                                    </th>
                                                                    <td>
                                                                        <ul>
                                                                            <xsl:for-each select="./rdf:Description/skos:topConceptOf">                                                                                                                                                            
                                                                                <li>
                                                                                    <xsl:value-of select="@rdf:resource"/>                                                                            
                                                                                </li>                                                                                
                                                                            </xsl:for-each>
                                                                        </ul>
                                                                    </td>
                                                                </tr>                                                                                                                
                                                            </xsl:if>
                                                        </tbody>
                                                    </table>                                            
                                                </div><!-- modal-body end -->                                                   
                                                
                                                <div class="modal-footer">
        
                                                </div>
                                            </div>                                           
                                        </div>
                                    </div><!-- modal content end -->                                                      
                                </xsl:for-each>                       
                            </xsl:when>                      
                            <xsl:otherwise>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="@type='place' or @type='org'">
                        <!-- Trigger the modal with a link -->                   
                        <span class="place-org"><a href="#" data-toggle="modal" data-target="#{replace($refId,'\.','_')}">
                            <xsl:attribute name="data-type">
                                <xsl:value-of select="'listplace.xml'"/>
                            </xsl:attribute>
                            <xsl:attribute name="data-key">
                                <xsl:value-of select="replace($refId,'\.','_')"/>
                            </xsl:attribute>                                        
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </a></span>               
                        <xsl:choose>
                            <xsl:when test="//id($refId)">                                  
                                <xsl:for-each select="//id($refId)">                            
                                    <!-- Modal -->
                                    <div id="{replace($refId,'\.','_')}" class="modal fade" role="dialog">
                                        <div class="modal-dialog modal-lg">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <xsl:choose>
                                                        <xsl:when test="exists(./tei:placeName)">
                                                            <h4 class="modal-title body_translations" title="Ort(e)">Ort(e)</h4>
                                                        </xsl:when>
                                                        <xsl:when test="exists(./tei:orgName)">
                                                            <h4 class="modal-title body_translations" title="Organisation(en)">Organisation(en)</h4>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                    <h4><button type="button" class="ml-2 mb-1 close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button></h4>                                                        
                                                </div>
                                                
                                                <div class="modal-body">
                                                    <table class="table table-striped">
                                                        <tbody>                                                    
                                                            <xsl:if test="exists(./tei:placeName)">
                                                                <tr>
                                                                    <th>
                                                                        <ul>
                                                                            <xsl:for-each select="./tei:placeName">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="@type='alt'">
                                                                                        <li class="body_translations" title="Alternative Bezeichnung">Alternative Bezeichnung</li>
                                                                                    </xsl:when>                                                                        
                                                                                    <xsl:otherwise>
                                                                                        <li class="body_translations" title="Bezeichnung">Bezeichnung</li>
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
                                                            <xsl:if test="exists(./tei:desc)">
                                                                <tr>
                                                                    <th>
                                                                        <span style="text-transform:uppercase;" class="body_translations" title="Beschreibung">Beschreibung</span>                                                                                                                                                                                     
                                                                    </th>
                                                                    <td>
                                                                        <xsl:value-of select="./tei:desc/tei:gloss"/>                                                                                                                                                                                           
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <xsl:if test="exists(./tei:orgName)">                                                        
                                                                <tr>
                                                                    <th>
                                                                        <ul>
                                                                            <xsl:for-each select="./tei:orgName">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="exists(@type)">                                                                                                                                                                   
                                                                                        <li style="text-transform:uppercase;"><xsl:value-of select="replace(@type,'_',' ')"/></li>                                                                                
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <li style="text-transform:uppercase;" class="body_translations" title="Typ nicht verfügbar">Typ nicht verfügbar</li>                                                                                
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
                                                                <tr>
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
                                                            <xsl:if test="exists(./tei:location/tei:geo) and string-length(./tei:location/tei:geo) != 0">
                                                                <tr>
                                                                    <th class="body_translations" title="Koordinaten">Koordinaten</th>
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
                                                                            <xsl:attribute name="subtitle">                                
                                                                                <xsl:value-of select="./tei:placeName"/>
                                                                            </xsl:attribute>
                                                                            <xsl:attribute name="incident">                                
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
                                                                <xsl:call-template name="listEvent">
                                                                    <xsl:with-param name="transform" select="$transform"/>
                                                                </xsl:call-template>                                                                                                                
                                                            </xsl:if>
                                                        </tbody>
                                                    </table>                                            
                                                </div><!-- modal-body end -->                                                   
                                                
                                                <div class="modal-footer">
                                                    <button type="button" class="ml-2 mb-1 close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                                                </div>
                                            </div>                                           
                                        </div>
                                    </div><!-- modal content end -->                                                      
                                </xsl:for-each>                       
                            </xsl:when>                      
                            <xsl:otherwise>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="@type='work'">
                        <span class="work"><a href="" data-toggle="modal" data-target="#{replace($refId,'\.','_')}">
                            <xsl:attribute name="data-type">
                                <xsl:value-of select="'work'"/>
                            </xsl:attribute>
                            <xsl:attribute name="data-key">
                                <xsl:value-of select="replace($refId,'\.','_')"/>
                            </xsl:attribute>                                
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </a></span>  
                        <xsl:choose>
                            <xsl:when test="//id($refId)">                                  
                                <xsl:for-each select="//id($refId)">                            
                                    <!-- Modal -->
                                    <div id="{replace($refId,'\.','_')}" class="modal fade" role="dialog">
                                        <div class="modal-dialog modal-lg">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title"><xsl:value-of select="./tei:title"/></h4>
                                                    <h4><button type="button" class="ml-2 mb-1 close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button></h4>                                                        
                                                </div>
                                                <div class="modal-body">
                                                    <table class="table table-striped">
                                                        <tbody>
                                                            <xsl:if test="exists(./tei:author)">
                                                                <xsl:for-each select="./tei:author">
                                                                    <tr>                                                                 
                                                                        <th>Name</th>
                                                                        <td><xsl:value-of select="./tei:surname"/></td>
                                                                    </tr>
                                                                    <tr>                                                                 
                                                                        <th>Vorname</th>
                                                                        <td><xsl:value-of select="./tei:forename"/></td>
                                                                    </tr>
                                                                    <xsl:if test="exists(./tei:term)">
                                                                        <tr>                                                                 
                                                                            <th>Schlagworte</th>
                                                                            <td>
                                                                                <ul>
                                                                                    <xsl:for-each select="./tei:term">
                                                                                        <li><xsl:apply-templates/></li>
                                                                                    </xsl:for-each>                                                                            
                                                                                </ul>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:if>
                                                                </xsl:for-each>                                                        
                                                            </xsl:if>
                                                            <xsl:if test="exists(./tei:date)">
                                                                <tr>
                                                                    <th class="body_translations" title="Datum">Datum</th>
                                                                    <td><xsl:value-of select="./tei:date"/></td>                                                           
                                                                </tr>   
                                                            </xsl:if>
                                                            <xsl:if test="exists(./tei:gloss)">
                                                                <tr>
                                                                    <th class="body_translations" title="Beschreibung">Beschreibung</th>
                                                                    <td><xsl:value-of select="./tei:gloss"/></td>                                                           
                                                                </tr>   
                                                            </xsl:if> 
                                                            <xsl:if test="exists(./tei:note)">                                                        
                                                                <tr>
                                                                    <th class="body_translations" title="Notiz">Notiz</th>
                                                                    <td>
                                                                        <ul>
                                                                            <xsl:for-each select="./tei:note">
                                                                                <li><xsl:apply-templates/></li>
                                                                            </xsl:for-each>                                                                            
                                                                        </ul>
                                                                    </td>                                                           
                                                                </tr>                                                                                                                                                                                       
                                                            </xsl:if>                                                                 
                                                        </tbody>
                                                    </table>                                            
                                                </div>
                                                <div class="modal-footer">
                                                    
                                                </div>
                                            </div>                                           
                                        </div>
                                    </div><!-- modal content -->                                 
                                </xsl:for-each>                       
                            </xsl:when>
                            <xsl:otherwise>
                                
                            </xsl:otherwise>
                        </xsl:choose>                        
                    </xsl:when>
                    <xsl:when test="@type='person'">
                        <!-- Trigger the modal with a link -->                   
                        <span class="person"><a href="" data-toggle="modal" data-target="#{replace($refId,'\.','_')}">
                            <xsl:attribute name="data-type">
                                <xsl:value-of select="'listperson'"/>
                            </xsl:attribute>
                            <xsl:attribute name="data-key">
                                <xsl:value-of select="replace($refId,'\.','_')"/>
                            </xsl:attribute>                                
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </a></span>  
                        <xsl:choose>
                            <xsl:when test="//id($refId)">                                  
                                <xsl:for-each select="//id($refId)">                            
                                    <!-- Modal -->
                                    <div id="{replace($refId,'\.','_')}" class="modal fade" role="dialog">
                                        <div class="modal-dialog modal-lg">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title"><xsl:value-of select="./tei:persName"/></h4>
                                                    <h4><button type="button" class="ml-2 mb-1 close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button></h4>                                                        
                                                </div>
                                                <div class="modal-body">
                                                    <table class="table table-striped">
                                                        <tbody>
                                                            <xsl:if test="exists(./tei:idno)">
                                                                <tr>
                                                                    <xsl:choose>
                                                                        <xsl:when test="./tei:idno[@type='URL' or @type='URI' or @type='GND' or @type='VIAF']">
                                                                            <th>
                                                                                Uri
                                                                            </th>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <th>
                                                                                ID
                                                                            </th>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>     
                                                                    <xsl:choose>
                                                                        <xsl:when test="./tei:idno[@type='URL' or @type='URI' or @type='GND' or @type='VIAF']">
                                                                            <td><ul>
                                                                                <xsl:for-each select="./tei:idno">
                                                                                    <li><a target="_blank">
                                                                                        <xsl:attribute name="href">
                                                                                            <xsl:apply-templates/>
                                                                                        </xsl:attribute>
                                                                                        <xsl:apply-templates/>                                                         
                                                                                    </a></li>                                                                            
                                                                                </xsl:for-each>
                                                                            </ul></td>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <td><ul>
                                                                                <xsl:for-each select="./tei:idno">
                                                                                    <li><xsl:value-of select="./@type"/>: <xsl:apply-templates/></li>
                                                                                </xsl:for-each>
                                                                            </ul></td>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                </tr>
                                                            </xsl:if>                                                   
                                                            <xsl:if test="exists(./tei:persName)">
                                                                <tr>
                                                                    <th>Name</th>
                                                                    <td><xsl:value-of select="./tei:persName"/></td>
                                                                </tr>
                                                            </xsl:if> 
                                                            <xsl:if test="exists(./tei:occupation)">
                                                                <tr>
                                                                    <th>Arbeit</th>
                                                                    <td><ul>
                                                                    <xsl:for-each select="./tei:occupation">
                                                                        <li><xsl:apply-templates/></li>
                                                                    </xsl:for-each> 
                                                                    </ul></td>
                                                                </tr>
                                                            </xsl:if>
                                                            <xsl:if test="exists(./tei:birth)">
                                                                <xsl:choose>
                                                                    <xsl:when test="./tei:birth/tei:date">
                                                                        <xsl:for-each select="./tei:birth/tei:date">
                                                                            <tr>
                                                                                <th class="body-translations" title="Geburtsdatum">Geburtsdatum</th>                                                              
                                                                                <td>
                                                                                    <xsl:apply-templates/>                                                                  
                                                                                </td> 
                                                                            </tr>                                                            
                                                                        </xsl:for-each>   
                                                                    </xsl:when>
                                                                    <xsl:when test="./tei:birth/tei:placeName">
                                                                        <xsl:for-each select="./tei:birth/tei:placeName">
                                                                            <tr>
                                                                                <th class="body-translations" title="Geburtsort">Geburtsort</th> 
                                                                                <td>                                                                    
                                                                                    <xsl:apply-templates/>                                                                
                                                                                </td> 
                                                                            </tr>   
                                                                        </xsl:for-each>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:for-each select="./tei:birth">
                                                                            <tr>
                                                                                <th class="body-translations" title="Geburtsdatum">Geburtsdaten</th>                                                              
                                                                                <td>
                                                                                    <xsl:apply-templates/>                                                                  
                                                                                </td> 
                                                                            </tr>                                                            
                                                                        </xsl:for-each>                                                                  
                                                                    </xsl:otherwise>
                                                                </xsl:choose>                                                        
                                                            </xsl:if>
                                                            <xsl:if test="exists(./tei:death)">
                                                                <xsl:choose>
                                                                    <xsl:when test="./tei:death/tei:date">
                                                                        <xsl:for-each select="./tei:death/tei:date">
                                                                            <tr>
                                                                                <th class="body-translations" title="Sterbedatum">Sterbedatum</th>
                                                                                <td>                                                                    
                                                                                    <xsl:apply-templates/>                                                                
                                                                                </td> 
                                                                            </tr>   
                                                                        </xsl:for-each>  
                                                                    </xsl:when>
                                                                    <xsl:when test="./tei:death/tei:placeName">
                                                                        <xsl:for-each select="./tei:death/tei:placeName">
                                                                            <tr>
                                                                                <th class="body-translations" title="Sterbeort">Sterbeort</th>
                                                                                <td>                                                                    
                                                                                    <xsl:apply-templates/>                                                                
                                                                                </td> 
                                                                            </tr> 
                                                                        </xsl:for-each>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:for-each select="./tei:death">
                                                                            <tr>
                                                                                <th class="body-translations" title="Sterbedaten">Sterbedaten</th>
                                                                                <td>                                                                    
                                                                                    <xsl:apply-templates/>                                                                
                                                                                </td> 
                                                                            </tr>   
                                                                        </xsl:for-each>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:if>
                                                            <xsl:if test="exists(./tei:note)"> 
                                                                <tr>
                                                                    <xsl:choose>
                                                                        <xsl:when test="./tei:note/tei:p">
                                                                            <th class="body_translations" title="Lebensdaten">Lebensdaten</th>
                                                                            <td><xsl:value-of select="./tei:note/tei:p[1]"/></td>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <th class="body_translations" title="Lebensdaten">Lebensdaten</th>
                                                                            <td><xsl:value-of select="./tei:note"/></td>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>                                                            
                                                                </tr>
                                                                <tr>
                                                                    <xsl:choose>
                                                                        <xsl:when test="./tei:note/tei:p">
                                                                            <th class="body_translations" title="Biographie">Biographie</th>
                                                                            <td><xsl:value-of select="./tei:note/tei:p[2]"/></td>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>                                                            
                                                                </tr>                                                                                                                               
                                                            </xsl:if>                                                   
                                                            
                                                            <!-- ************* template import tei-event ************* -->
                                                            <xsl:if test="exists(./tei:listEvent)">
                                                                <xsl:call-template name="listEvent">
                                                                    <xsl:with-param name="transform" select="$transform"/>
                                                                </xsl:call-template>
                                                            </xsl:if>                                           
                                                        </tbody>
                                                    </table>                                            
                                                </div>
                                                <div class="modal-footer">
                                                    
                                                </div>
                                            </div>                                           
                                        </div>
                                    </div><!-- modal content -->                                 
                                </xsl:for-each>                       
                            </xsl:when>
                            <xsl:otherwise>
                                
                            </xsl:otherwise>
                        </xsl:choose>                
                    </xsl:when> 
                    <xsl:when test="@type='multi-person'">  
                        <!-- Trigger the modal with a link -->   
                        <a href="" data-toggle="modal" data-target="#{replace(replace(replace(@ref,'#',''),'\.',''),' ','_')}">
                            <xsl:attribute name="data-type">
                                <xsl:value-of select="'listperson'"/>
                            </xsl:attribute>
                            <xsl:attribute name="data-key">
                                <xsl:value-of select="replace(replace(replace(@ref,'#',''),'\.',''),' ','_')"/>
                            </xsl:attribute>                                
                            <span class="person"><xsl:apply-templates/></span>          
                        </a>
                        <!-- Modal -->
                        <div id="{replace(replace(replace(@ref,'#',''),'\.',''),' ','_')}" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title"><xsl:apply-templates/></h4><br/>
                                        <h4><button type="button" class="ml-2 mb-1 close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button></h4>                                                        
                                    </div>
                                    <h6 class="modal-title" style="margin-left:1em;">Alias für mehrere Personen</h6>
                                    <xsl:call-template name="multi-person-loop">                                       
                                        <xsl:with-param name="count-after" select="$count"/>
                                        <xsl:with-param name="refId-multi" select="$refId-multi-token"/>
                                    </xsl:call-template>  
                                    <div class="modal-footer">
                                        <button type="button" class="ml-2 mb-1 close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                                    </div>
                                </div>                                           
                            </div>
                        </div><!-- modal content -->
                    </xsl:when>
                    <xsl:when test="starts-with(@ref,'#')">
                        <span class="person"><xsl:apply-templates/></span>               
                    </xsl:when>
                    <xsl:when test="@ref">
                        <span class="person"><xsl:apply-templates/></span> 
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
                        <span class="person"><xsl:apply-templates/></span> 
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
                        <span class="other">
                            <xsl:apply-templates>
                                <xsl:with-param name="view" select="$view"/>
                            </xsl:apply-templates>
                        </span>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates>
                    <xsl:with-param name="view" select="$view"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="multi-person-loop">
        <xsl:param name="refId-multi"/>        
        <xsl:param name="count-after"/>        
        <xsl:choose>
            <xsl:when test="$count-after > 0">
            <xsl:choose>
                <xsl:when test="//id($refId-multi[$count-after])"> 
                    <xsl:for-each select="//id($refId-multi[$count-after])">       
                        <div class="modal-body">
                            <h4>Person <xsl:value-of select="concat('#', $refId-multi[$count-after])"/></h4>
                            <table class="table table-striped">
                                <tbody>                                      
                                    <xsl:if test="exists(./tei:persName)">
                                        <tr>
                                            <th>Name</th>
                                            <td><xsl:value-of select="./tei:persName"/></td>
                                        </tr>
                                    </xsl:if> 
                                    <xsl:if test="exists(./tei:idno)">
                                        <tr>
                                            <xsl:choose>
                                                <xsl:when test="./tei:idno[@type='URL' or @type='URI' or @type='GND' or @type='VIAF']">
                                                    <th>
                                                        Uri
                                                    </th>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <th>
                                                        ID
                                                    </th>
                                                </xsl:otherwise>
                                            </xsl:choose>     
                                            <xsl:choose>
                                                <xsl:when test="./tei:idno[@type='URL' or @type='URI' or @type='GND' or @type='VIAF']">
                                                    <td><ul>
                                                        <xsl:for-each select="./tei:idno">
                                                            <li><a target="_blank">
                                                                <xsl:attribute name="href">
                                                                    <xsl:apply-templates/>
                                                                </xsl:attribute>
                                                                <xsl:apply-templates/>                                                         
                                                            </a></li>                                                                            
                                                        </xsl:for-each>
                                                    </ul></td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <td><ul>
                                                        <xsl:for-each select="./tei:idno">
                                                            <li><xsl:value-of select="./@type"/>: <xsl:apply-templates/></li>
                                                        </xsl:for-each>
                                                    </ul></td>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="exists(./tei:occupation)">
                                        <tr>
                                            <th>Arbeit</th>
                                            <td><ul>
                                                <xsl:for-each select="./tei:occupation">
                                                    <li><xsl:apply-templates/></li>
                                                </xsl:for-each> 
                                            </ul></td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="exists(./tei:birth)">
                                        <xsl:choose>
                                            <xsl:when test="./tei:birth/tei:date">
                                                <xsl:for-each select="./tei:birth/tei:date">
                                                    <tr>
                                                        <th class="body-translations" title="Geburtsdatum">Geburtsdatum</th>                                                              
                                                        <td>
                                                            <xsl:apply-templates/>                                                                  
                                                        </td> 
                                                    </tr>                                                            
                                                </xsl:for-each>   
                                            </xsl:when>
                                            <xsl:when test="./tei:birth/tei:placeName">
                                                <xsl:for-each select="./tei:birth/tei:placeName">
                                                    <tr>
                                                        <th class="body-translations" title="Geburtsort">Geburtsort</th> 
                                                        <td>                                                                    
                                                            <xsl:apply-templates/>                                                                
                                                        </td> 
                                                    </tr>   
                                                </xsl:for-each>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:for-each select="./tei:birth">
                                                    <tr>
                                                        <th class="body-translations" title="Geburtsdatum">Geburtsdaten</th>                                                              
                                                        <td>
                                                            <xsl:apply-templates/>                                                                  
                                                        </td> 
                                                    </tr>                                                            
                                                </xsl:for-each>                                                                  
                                            </xsl:otherwise>
                                        </xsl:choose>                                                        
                                    </xsl:if>
                                    <xsl:if test="exists(./tei:death)">
                                        <xsl:choose>
                                            <xsl:when test="./tei:death/tei:date">
                                                <xsl:for-each select="./tei:death/tei:date">
                                                    <tr>
                                                        <th class="body-translations" title="Sterbedatum">Sterbedatum</th>
                                                        <td>                                                                    
                                                            <xsl:apply-templates/>                                                                
                                                        </td> 
                                                    </tr>   
                                                </xsl:for-each>  
                                            </xsl:when>
                                            <xsl:when test="./tei:death/tei:placeName">
                                                <xsl:for-each select="./tei:death/tei:placeName">
                                                    <tr>
                                                        <th class="body-translations" title="Sterbeort">Sterbeort</th>
                                                        <td>                                                                    
                                                            <xsl:apply-templates/>                                                                
                                                        </td> 
                                                    </tr> 
                                                </xsl:for-each>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:for-each select="./tei:death">
                                                    <tr>
                                                        <th class="body-translations" title="Sterbedaten">Sterbedaten</th>
                                                        <td>                                                                    
                                                            <xsl:apply-templates/>                                                                
                                                        </td> 
                                                    </tr>   
                                                </xsl:for-each>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                    <xsl:if test="exists(./tei:note)"> 
                                        <tr>
                                            <xsl:choose>
                                                <xsl:when test="./tei:note/tei:p">
                                                    <th class="body_translations" title="Lebensdaten">Lebensdaten</th>
                                                    <td><xsl:value-of select="./tei:note/tei:p[1]"/></td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <th class="body_translations" title="Lebensdaten">Lebensdaten</th>
                                                    <td><xsl:value-of select="./tei:note"/></td>
                                                </xsl:otherwise>
                                            </xsl:choose>                                                            
                                        </tr>
                                        <tr>
                                            <xsl:choose>
                                                <xsl:when test="./tei:note/tei:p">
                                                    <th class="body_translations" title="Biographie">Biographie</th>
                                                    <td><xsl:value-of select="./tei:note/tei:p[2]"/></td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    
                                                </xsl:otherwise>
                                            </xsl:choose>                                                            
                                        </tr>                                                                                                                               
                                    </xsl:if>                                                   
                                    
                                    <!-- ************* template import tei-event ************* -->
                                    <xsl:if test="exists(./tei:listEvent)">
                                        <xsl:call-template name="listEvent">
                                            <xsl:with-param name="transform" select="$transform"/>
                                        </xsl:call-template>
                                    </xsl:if>                                           
                                </tbody>
                            </table>                                            
                        </div>
                        </xsl:for-each>    
                    </xsl:when>
                    <xsl:otherwise>
                        
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:call-template name="multi-person-loop">
                    <xsl:with-param name="count-after" select="$count-after - 1"/>
                    <xsl:with-param name="refId-multi" select="$refId-multi"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>