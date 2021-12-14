<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/terms/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:sparql="http://www.w3.org/2005/sparql-results#" xmlns:my="http://test.org/" exclude-result-prefixes="tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <xsl:template name="load_modal">
        <script type="text/javascript">
            /*script for loading the content of the modal */
            $(document).ready(function () {
                var trigger = $('a[data-type]');
                $(trigger).click(function () {
                    var dataType = $(this).attr('data-type');
                    var dataKey = $(this).attr('id');
                    /*var xsl = dataType.replace(".xml", "");
                    var project = $(this).attr('project');
                    var baseUrl = "showNoTemplate.html?directory=" + project + "&amp;document=";
                    var url = baseUrl + dataType + "&amp;entityID=" + dataKey; */
                    var hashtag = '#';
                    $(hashtag.concat(dataKey)).modal('show');
                        
                    });
                });
            });
        </script>

    </xsl:template>
    
</xsl:stylesheet>