<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://test.org/" exclude-result-prefixes="tei my xs xlink foo" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget add_navbar_to_body</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied to html:body above page content.</p>
            <p>The template "add_navbar_to_body" containes the basic ACDH-CH fundament navbar.</p>     
        </desc>    
    </doc>
    
    <xsl:param name="transform"/>
    
    <xsl:template name="navbar-links">
        <li class="nav-item">
            <a title="Dokument" href="#home" data-toggle="tab" class="nav-link active body_translations" onclick="$('#listplace-tab, #listorg-tab, #listperson-tab').css('display','none');">Dokument</a>
        </li>
        <li class="nav-item">
            <a title="Über das Projekt" href="#about" data-toggle="tab" class="nav-link body_translations" id="load_arche_metadata" onclick="$('#listplace-tab, #listorg-tab, #listperson-tab').css('display','none');">Über das Projekt</a>
        </li>
        <li class="nav-item">
            <a title="DATEN-Repräsentation" href="#transform" data-toggle="tab" class="nav-link body_translations" onclick="$('#listplace-tab, #listorg-tab, #listperson-tab').css('display','none');">DATEN-Repräsentation</a>
        </li>
        <li class="dropdown nav-item">                        
            <a title="Bestände" class="nav-link bi bi-sliders dropdown-toggle body_translations" data-toggle="dropdown" href="#">Bestände</a>                               
            
            <ul class="dropdown-menu pull-left navbar-dark bg-dark" role="menu" aria-labelledby="dropdownMenu">                                        
                <li class="nav-item">
                    <a title="Arche Editions" class="nav-link body_translations" tabindex="1" onclick="$('#listplace-tab, #listorg-tab, #listperson-tab').css('display','none');">
                        <xsl:attribute name="href">
                            <xsl:value-of select="replace($arche_child_col_url,'api','browser/oeaw_detail')"/>
                        </xsl:attribute>
                        ARCHE Editionen
                    </a>                                                               
                </li>
                <li class="nav-item">
                    <a title="Gesamter Bestand" class="nav-link body_translations" id="ajax_request" tabindex="1" href="#">Gesamter Bestand</a>                                                                                           
                </li>
            </ul>                                       
        </li>
        <li class="dropdown nav-item">                              
            <li class="dropdown nav-item">                            
                <a title="Register" class="nav-link bi bi-sliders dropdown-toggle body_translations" data-toggle="dropdown" href="#">Register</a>
                <ul class="dropdown-menu pull-left navbar-dark bg-dark" role="menu" aria-labelledby="dropdownMenu">                                        
                    <li class="nav-item">
                        <a href="#" title="Personen" class="nav-link body_translations" tabindex="1" onclick="loadRegister('tei-listPerson', 'https://arche.acdh.oeaw.ac.at/api/143597', 'listperson')">Persons</a>                                                                            
                    </li>
                    <li class="nav-item">
                        <a href="#" title="Orte" class="nav-link body_translations" tabindex="1" onclick="loadRegister('tei-listPlace', 'https://arche.acdh.oeaw.ac.at/api/143598', 'listplace')">Orte</a>                                                                                
                    </li>
                    <li class="nav-item">
                        <a href="#" title="Institutionen" class="nav-link body_translations" tabindex="1" onclick="loadRegister('tei-listOrg', 'https://arche.acdh.oeaw.ac.at/api/143596', 'listorg')">Institutionen</a>                                                                            
                    </li>
                    <li class="nav-item">
                        <a href="#" title="Bibliographie" class="nav-link body_translations" tabindex="1" onclick="loadRegister('tei-listBibl', 'https://arche.acdh.oeaw.ac.at/api/143599', 'listbibl')">Bibliographie</a>                                                                            
                    </li>
                </ul>                                       
            </li>
        </li>
    </xsl:template>

</xsl:stylesheet>