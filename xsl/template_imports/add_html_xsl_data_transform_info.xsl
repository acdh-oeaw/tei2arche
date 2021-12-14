<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template name="xsl_transform_info">
        <div id="navBarLanguage">
            <ul class="nav nav-tabs" id="dropdown-lang">
                <li class="nav-item"><a title="Deutsch" href="#lang-de2" data-toggle="tab" class="nav-link-lang nav-link active">Deutsch</a></li>
                <li class="nav-item"><a title="English" href="#lang-en2" data-toggle="tab" class="nav-link-lang nav-link">English</a></li>
            </ul>
        </div>
        <div class="tab-content">
            <!-- ############################################ -->
            <!-- ############### GERMAN CONTENT ############# -->
            <!-- ############################################ -->
            <div class="tab-pane active" id="lang-de2">
                <div class="card-header">
                    <h3>Wie die DATEN-Darstellung funktioniert</h3>
                </div>
                <div class="card-body">
                    <p>
                        Die angezeigten Daten sind auf ARCHE, im XML oder RDF Format, gespeichert bzw. archiviert.
                        Die Daten können sehr unterschiedlich dargestellt werden. In dieser HTML-Darstellung wurden XSLT-Stylesheets und XPath verwendet 
                        um Daten von ARCHE abzufragen und in eine HTML-Struktur zu transformieren. 
                        Dieser Prozess schafft die Möglichkeit, eine benutzerfreundliche Web-Applikation zu erstellen.
                    </p>
                </div>
                <div class="card-header">
                    <h3>Beta Version</h3>
                </div>
                <div class="card-body">
                    <p>
                        Der <span class="badge bg-light text-dark">Beta</span> Badge weißt darauf hin, dass die XSLT-Stylesheets derzeit noch in Entwicklung sind.
                        Die Darstellung der Daten kann sich daher ändern. Zusätzliche Information zum Projekt oder weitere 
                        Funktionen könnten in Zukunft noch hinzukommen.
                    </p>
                </div>
                <div class="card-header">
                    <h3>Weitere Informationen</h3>
                </div>
                <div class="card-body">
                    <ul>
                        <li><a target="_blank" title="XSLT: W3C" href="https://www.w3schools.com/xml/xsl_intro.asp">XSLT: W3Schools Tutorial</a></li>
                        <li><a target="_blank" title="XPath: W3C" href="https://www.w3schools.com/xml/xpath_intro.asp">XPath: W3Schools Tutorial</a></li>
                    </ul>                
                </div>
            </div>
            <!-- ############################################ -->
            <!-- ############### ENGLISH CONTENT ############# -->
            <!-- ############################################ -->
            <div class="tab-pane fade" id="lang-en2">
                <div class="card-header">
                    <h3>How the DATA-Representation works</h3>
                </div>
                <div class="card-body">
                    <p>
                        The visualized data are saved and archived on ARCHE in XML or RDF formats. This data can be represented differently.
                        In this HTML-Representation the data is transformed into a HTML structure. This process is achieved with XSLT-Stylesheets and XPath.                        
                    </p>
                </div>
                <div class="card-header">
                    <h3>Beta Version</h3>
                </div>
                <div class="card-body">
                    <p>
                        The <span class="badge bg-light text-dark">Beta</span> Badge is active because the XSLT-Stylesheets are still in development.
                        Therefore, the Web-Application can change and data could be visualized differently. Furthermore, additonal data or functions could be added.
                    </p>
                </div>
                <div class="card-header">
                    <h3>More Information</h3>
                </div>
                <div class="card-body">
                    <ul>
                        <li><a target="_blank" title="XSLT: W3C" href="https://www.w3schools.com/xml/xsl_intro.asp">XSLT: W3Schools Tutorial</a></li>
                        <li><a target="_blank" title="XPath: W3C" href="https://www.w3schools.com/xml/xpath_intro.asp">XPath: W3Schools Tutorial</a></li>
                    </ul>                
                </div>                
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>