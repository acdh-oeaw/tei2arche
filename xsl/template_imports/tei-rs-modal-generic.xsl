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
    
    <xsl:param name="baseURL"/>
    <xsl:param name="project"/>
    
    <xsl:template match="tei:rs[@ref or @key]">
        <strong>
            <xsl:value-of select="."/>
            <xsl:element name="a">
                <xsl:attribute name="class">reference</xsl:attribute>
                <xsl:attribute name="data-type">
                    <xsl:value-of select="'listperson.xml'"/>
                </xsl:attribute>
                <xsl:attribute name="project">
                    <xsl:value-of select="$project"/>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="substring-after(data(@ref), '#')"/>
                    <!-- <xsl:value-of select="@key"/> -->
                </xsl:attribute>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-layout-text-window" viewBox="0 0 16 16">
                    <path d="M3 6.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5z"/>
                    <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v1H1V2a1 1 0 0 1 1-1h12zm1 3v10a1 1 0 0 1-1 1h-2V4h3zm-4 0v11H2a1 1 0 0 1-1-1V4h10z"/>
                </svg>                
            </xsl:element>
        </strong>
    </xsl:template>
</xsl:stylesheet>