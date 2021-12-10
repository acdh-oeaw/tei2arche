<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
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
    <xsl:param name="arche_child_col_url"/>
    
    <xsl:template name="navbar-links">
        <xsl:variable name="transform-person"><xsl:value-of select="concat('https://id.acdh.oeaw.ac.at/thun/indices/listperson.xml', $transform)"/></xsl:variable>
        <xsl:variable name="transform-places"><xsl:value-of select="concat('https://id.acdh.oeaw.ac.at/thun/indices/listplace.xml', $transform)"/></xsl:variable>
        <xsl:variable name="transform-org"><xsl:value-of select="concat('https://id.acdh.oeaw.ac.at/thun/indices/listorg.xml', $transform)"/></xsl:variable>
        <li class="nav-item">
            <a title="Dokument" href="#home" data-toggle="tab" class="nav-link active body_translations">Dokument</a>
        </li>
        <li class="nav-item">
            <a title="Über das Projekt" href="#about" data-toggle="tab" class="nav-link body_translations" id="load_arche_metadata">Über das Projekt</a>
        </li>
        <li class="nav-item">
            <a title="DATEN-Repräsentation" href="#transform" data-toggle="tab" class="nav-link body_translations">DATEN-Repräsentation</a>
        </li>
        <li class="dropdown nav-item">                        
            <a title="Bestände" class="nav-link bi bi-sliders dropdown-toggle body_translations" data-toggle="dropdown" href="#">Bestände</a>                               
            
            <ul class="dropdown-menu pull-left navbar-dark bg-dark" role="menu" aria-labelledby="dropdownMenu">                                        
                <li class="nav-item">
                    <a title="Arche Editions" class="nav-link body_translations" tabindex="1">
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
            <a title="Register" class="nav-link bi bi-sliders dropdown-toggle body_translations" data-toggle="dropdown" href="#">Register</a>
            <ul class="dropdown-menu pull-left navbar-dark bg-dark" role="menu" aria-labelledby="dropdownMenu">          
                <li class="nav-item">
                    <a title="In Progress" class="nav-link body_translations" tabindex="1"><xsl:attribute name="href"><xsl:value-of select="'https://arche-dev.acdh-dev.oeaw.ac.at/browser/oeaw_detail/8973'"/></xsl:attribute>In Progress</a>                                                                            
                </li>
                <!--<li class="nav-item">
                    <a title="Orte" class="nav-link body_translations" tabindex="1"><xsl:attribute name="href"><xsl:value-of select="$transform-places"/></xsl:attribute>Orte</a>                                                                            
                </li>
                <li class="nav-item">
                    <a title="Personen" class="nav-link body_translations" tabindex="1"><xsl:attribute name="href"><xsl:value-of select="$transform-person"/></xsl:attribute>Personen</a>                                                                            
                </li>
                <li class="nav-item">
                    <a title="Institutionen" class="nav-link body_translations" tabindex="1"><xsl:attribute name="href"><xsl:value-of select="$transform-org"/></xsl:attribute>Institutionen</a>                                                                        
                </li>-->
            </ul>                                      
        </li>
    </xsl:template>

</xsl:stylesheet>