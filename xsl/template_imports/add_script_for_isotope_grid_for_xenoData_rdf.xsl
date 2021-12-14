<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget add_script_for_isotope_grid_for_xenoData_rdf.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied before the closing html:body tag.</p>
            <p>The template "add_script_for_isotope_grid_for_xenoData_rdf" adds base js for isotope masonry grids.</p>     
        </desc>    
    </doc>
    
    <xsl:template name="isotope-grid-rdf">
        <!-- isotope.metafizzy masony grid -->
        <script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>  
    </xsl:template>
</xsl:stylesheet>