<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:arche="https://vocabs.acdh.oeaw.ac.at/schema#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:foo="foo.com"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:template name="arche_root_col">
        <xsl:param name="arche_root_col_url"/>
        <xsl:variable name="arche_context" select="document($arche_root_col_url)"/>
        <xsl:variable name="root_col_node" select="$arche_context//arche:TopCollection"/>
        <xsl:variable name="child_cols" select="$arche_context//arche:Collection[./arche:isPartOf]"/>
        <xsl:variable name="rdf" select="'/metadata?format=application/rdf%2Bxml'"/>
        <xsl:variable name="gui" select="'browser/oeaw_detail'"/>
        <xsl:variable name="turtle" select="'/metadata'"/>
        
        <div id="navBarLanguage">
            <ul class="nav nav-tabs" id="dropdown-lang">
                <li class="nav-item"><a title="Deutsch" href="#lang-de" data-toggle="tab" class="nav-link-lang nav-link active">Deutsch</a></li>
                <li class="nav-item nav-item-lang"><a title="English" href="#lang-en" data-toggle="tab" class="nav-link-lang nav-link">English</a></li>
            </ul>
        </div>
        <div class="tab-content">
            <!-- ############################################ -->
            <!-- ############### GERMAN CONTENT ############# -->
            <!-- ############################################ -->
            <div class="tab-pane active" id="lang-de">
                <div class="card-header border-primary">
                    <h1>
                        <xsl:value-of select="$root_col_node/arche:hasTitle"/>
                    </h1>
                </div>
                <div class="card-body tab-pane">
                    <p>
                        <xsl:value-of select="$root_col_node/arche:hasDescription[@xml:lang='de']"/>
                    </p>
                </div>
                <div class="card-header">
                    <h3>Schlagwörter</h3>
                </div>
                <div class="card-body">
                    <ul class="ul-no-bullets">
                        <xsl:for-each select="$root_col_node//arche:hasSubject[@xml:lang='de']">
                            <li><xsl:apply-templates/></li>
                        </xsl:for-each>
                    </ul>
                </div>
                <div class="card-header">
                    <h3>Akteure</h3>
                </div>
                <div class="card-body">
                    <xsl:variable name="hasContact" select="$root_col_node//arche:hasContact/@rdf:resource"/>
                    <xsl:variable name="hasMetadataCreator" select="$root_col_node//arche:hasMetadataCreator/@rdf:resource"/>
                    <xsl:variable name="hasCurator" select="$root_col_node//arche:hasCurator/@rdf:resource"/>
                    <xsl:variable name="hasOwner" select="$root_col_node//arche:hasOwner/@rdf:resource"/>
                    <table class="table table-striped table-responsive">
                        <thead>
                            <tr>
                                <xsl:for-each select="$root_col_node//arche:hasOwner">
                                    <th><xsl:text>Principal Investigator</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasContact">
                                    <th><xsl:text>Kontakt</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasContributor">
                                    <th><xsl:text>Mitwirkende(r)</xsl:text></th>
                                </xsl:for-each>                                
                            </tr>                            
                        </thead>
                        <tbody>
                            <tr>
                                <xsl:for-each select="$arche_context">
                                    <xsl:for-each select="//arche:Person[@rdf:about=$hasOwner]">
                                        <td>
                                            <xsl:value-of select="concat(./hasPersonalTitle,' ',./arche:hasTitle)"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-Zugriff</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>
                                    <xsl:for-each select="//arche:Person[@rdf:about=$hasContact]">
                                            <td>
                                                <xsl:value-of select="concat(./hasPersonalTitle,' ',./arche:hasTitle)"/>
                                                <a target='_blank' title="GUI" class="res-act-button">
                                                    <xsl:attribute name="href">
                                                        <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                    </xsl:attribute>
                                                    <xsl:text>GUI-Zugriff</xsl:text>
                                                </a>
                                            </td>
                                    </xsl:for-each>
                                    <xsl:variable name="hasContributor" select="//arche:hasContributor/@rdf:resource"/>
                                    <xsl:for-each select="//arche:Person[@rdf:about=$hasContributor]">
                                        <td>
                                            <xsl:value-of select="concat(./hasPersonalTitle,' ',./arche:hasTitle[1])"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-Zugriff</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>                                     
                                </xsl:for-each>                              
                            </tr>                            
                        </tbody> 
                    </table>
                    <table class="table table-striped table-responsive">
                        <thead>
                            <tr>
                                <xsl:for-each select="$root_col_node//arche:hasCreator">
                                    <th><xsl:text>AuthorIn</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasCurator">
                                    <th><xsl:text>KuratorIn</xsl:text></th>
                                </xsl:for-each>
                            </tr>                            
                        </thead>
                        <tbody>                            
                            <tr>
                                <xsl:for-each select="$arche_context">
                                    <xsl:variable name="hasCreator" select="//arche:hasCreator/@rdf:resource"/>
                                    <xsl:for-each select="//arche:Person[@rdf:about=$hasCreator]">
                                        <td>
                                            <xsl:value-of select="concat(./hasPersonalTitle,' ',./arche:hasTitle[1])"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-Zugriff</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>  
                                    <xsl:for-each select="//arche:Person[@rdf:about=$hasCurator]">
                                        <td>
                                            <xsl:value-of select="concat(./hasPersonalTitle,' ',./arche:hasTitle[1])"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-Zugriff</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>
                                </xsl:for-each>                              
                            </tr>
                        </tbody> 
                    </table>
                </div>
                <div class="card-header">
                    <h3>Rechte</h3>
                </div>
                <div class="card-body">
                    <xsl:variable name="hasLicensor" select="$root_col_node//arche:hasLicensor/@rdf:resource"/>
                    <xsl:variable name="hasLicense" select="$root_col_node//arche:hasLicense/@rdf:resource"/>
                    <xsl:variable name="hasAccessRestriction" select="$root_col_node//arche:hasAccessRestriction/@rdf:resource"/>
                    <table class="table table-striped table-responsive">
                        <thead>
                            <tr>
                                <xsl:for-each select="$root_col_node//arche:hasLicensor">
                                    <th><xsl:text>LizenzgeberIn</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasLicense">
                                    <th><xsl:text>Lizenz</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasAccessRestriction">
                                    <th><xsl:text>Zugangsbeschränkung</xsl:text></th>
                                </xsl:for-each>
                            </tr>                            
                        </thead>
                        <tbody>
                            <tr>
                                <xsl:for-each select="$arche_context">
                                    <xsl:for-each select="//arche:Person[@rdf:about=$hasLicensor]">
                                        <td>
                                            <xsl:value-of select="concat(./hasPersonalTitle,' ',./arche:hasTitle)"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-Zugriff</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>
                                    <xsl:for-each select="//skos:Concept[@rdf:about=$hasLicense]">
                                        <td>
                                            <xsl:value-of select="./skos:prefLabel[@xml:lang='de']"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-Zugriff</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>
                                    <xsl:for-each select="//skos:Concept[@rdf:about=$hasAccessRestriction]">
                                        <td>
                                            <xsl:value-of select="./skos:prefLabel[@xml:lang='de']"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-Zugriff</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </tr>
                        </tbody> 
                    </table>
                </div>
                <div class="card-header">
                    <h3>Weitere Informationen</h3>
                </div>
                <div class="card-body">
                    <xsl:variable name="hasRelatedDiscipline" select="$root_col_node//arche:hasRelatedDiscipline/@rdf:resource"/>
                    <xsl:variable name="hasRelatedProject" select="$root_col_node//arche:hasRelatedProject/@rdf:resource"/>
                    <table class="table table-striped table-responsive">
                        <thead>
                            <tr>
                                <xsl:for-each select="$root_col_node//arche:hasRelatedDiscipline">
                                    <th><xsl:text>Verwandte Disziplin</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasRelatedProject">
                                    <th><xsl:text>Verwandtes Projekt</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasCreatedStartDate">
                                    <th><xsl:text>Erstellungsdatum Anfang</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasCreatedEndDate">
                                    <th><xsl:text>Erstellungsdatum Ende</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasNumberOfItems">
                                    <th><xsl:text>Anzahl der Inhalte</xsl:text></th>
                                </xsl:for-each>
                            </tr>                            
                        </thead>
                        <tbody>
                            <tr>
                                <xsl:for-each select="$arche_context//skos:Concept[@rdf:about=$hasRelatedDiscipline]">
                                    <td><xsl:value-of select="./skos:prefLabel[@xml:lang='de']"/></td>
                                </xsl:for-each>
                                <xsl:for-each select="$arche_context//arche:Project[@rdf:about=$hasRelatedProject]">
                                    <td>
                                        <xsl:value-of select="./arche:hasTitle"/>
                                        <a target='_blank' title="GUI" class="res-act-button">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                            </xsl:attribute>
                                            <xsl:text>GUI-Zugriff</xsl:text>
                                        </a>
                                    </td>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasCreatedStartDate">
                                    <td><xsl:apply-templates/></td>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasCreatedEndDate">
                                    <td><xsl:apply-templates/></td>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasNumberOfItems">
                                    <td><xsl:apply-templates/></td>
                                </xsl:for-each>                               
                            </tr>
                        </tbody> 
                    </table>
                </div>                
            </div><!-- .tab-pane -->
            <!-- ############################################ -->
            <!-- ############### ENGLISH CONTENT ############ -->
            <!-- ############################################ -->
            <div class="tab-pane fade" id="lang-en">
                <div class="card-header border-primary">
                    <h1>
                        <xsl:value-of select="$root_col_node/arche:hasTitle"/>
                    </h1>
                </div>
                <div class="card-body">
                    <p>
                        <xsl:value-of select="$root_col_node/arche:hasDescription[@xml:lang='en']"/>
                    </p>
                </div>
                <div class="card-header">
                    <h3>Keywords</h3>
                </div>
                <div class="card-body">
                    <ul class="ul-no-bullets">
                        <xsl:for-each select="$root_col_node//arche:hasSubject[@xml:lang='en']">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </div>
                <div class="card-header">
                    <h3>Actors</h3>
                </div>
                <div class="card-body">
                    <xsl:variable name="hasContact" select="$root_col_node//arche:hasContact/@rdf:resource"/>
                    <xsl:variable name="hasMetadataCreator" select="$root_col_node//arche:hasMetadataCreator/@rdf:resource"/>
                    <xsl:variable name="hasCurator" select="$root_col_node//arche:hasCurator/@rdf:resource"/>
                    <xsl:variable name="hasOwner" select="$root_col_node//arche:hasOwner/@rdf:resource"/>
                    <table class="table table-striped table-responsive">
                        <thead>
                            <tr>
                                <xsl:for-each select="$root_col_node//arche:hasOwner">
                                    <th><xsl:text>Principal Investigator</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasContact">
                                    <th><xsl:text>Contact</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasContributor">
                                    <th><xsl:text>Contributor</xsl:text></th>
                                </xsl:for-each>                                
                            </tr>                            
                        </thead>
                        <tbody>
                            <tr>
                                <xsl:for-each select="$arche_context">
                                    <xsl:for-each select="//arche:Person[@rdf:about=$hasOwner]">
                                        <td>
                                            <xsl:value-of select="concat(./hasPersonalTitle,' ',./arche:hasTitle[1])"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-access</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>
                                    <xsl:for-each select="//arche:Person[@rdf:about=$hasContact]">
                                        <td>
                                            <xsl:value-of select="concat(./hasPersonalTitle,' ',./arche:hasTitle[1])"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-access</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>
                                    <xsl:variable name="hasContributor" select="//arche:hasContributor/@rdf:resource"/>
                                    <xsl:for-each select="//arche:Person[@rdf:about=$hasContributor]">
                                        <td>
                                            <xsl:value-of select="concat(./hasPersonalTitle,' ',./arche:hasTitle[1])"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-access</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>                                     
                                </xsl:for-each>                              
                            </tr>                            
                        </tbody> 
                    </table>
                    <table class="table table-striped table-responsive">
                        <thead>
                            <tr>
                                <xsl:for-each select="$root_col_node//arche:hasCreator">
                                    <th><xsl:text>Creator</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasCurator">
                                    <th><xsl:text>Curator</xsl:text></th>
                                </xsl:for-each>
                            </tr>                            
                        </thead>
                        <tbody>                            
                            <tr>
                                <xsl:for-each select="$arche_context">
                                    <xsl:variable name="hasCreator" select="//arche:hasCreator/@rdf:resource"/>
                                    <xsl:for-each select="//arche:Person[@rdf:about=$hasCreator]">
                                        <td>
                                            <xsl:value-of select="concat(./hasPersonalTitle,' ',./arche:hasTitle[1])"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-access</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>  
                                    <xsl:for-each select="//arche:Person[@rdf:about=$hasCurator]">
                                        <td>
                                            <xsl:value-of select="concat(./hasPersonalTitle,' ',./arche:hasTitle[1])"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-access</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>
                                </xsl:for-each>                              
                            </tr>
                        </tbody> 
                    </table>
                </div>
                <div class="card-header">
                    <h3>Rights</h3>
                </div>
                <div class="card-body">
                    <xsl:variable name="hasLicensor" select="$root_col_node//arche:hasLicensor/@rdf:resource"/>
                    <xsl:variable name="hasLicense" select="$root_col_node//arche:hasLicense/@rdf:resource"/>
                    <xsl:variable name="hasAccessRestriction" select="$root_col_node//arche:hasAccessRestriction/@rdf:resource"/>
                    <table class="table table-striped table-responsive">
                        <thead>
                            <tr>
                                <xsl:for-each select="$root_col_node//arche:hasLicensor">
                                    <th><xsl:text>Licensor</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasLicense">
                                    <th><xsl:text>License</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasAccessRestriction">
                                    <th><xsl:text>Access Restriction</xsl:text></th>
                                </xsl:for-each>
                            </tr>                            
                        </thead>
                        <tbody>
                            <tr>
                                <xsl:for-each select="$arche_context">
                                    <xsl:for-each select="//arche:Person[@rdf:about=$hasLicensor]">
                                        <td>
                                            <xsl:value-of select="concat(./hasPersonalTitle,' ',./arche:hasTitle)"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-access</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>
                                    <xsl:for-each select="//skos:Concept[@rdf:about=$hasLicense]">
                                        <td>
                                            <xsl:value-of select="./skos:prefLabel[@xml:lang='en']"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-access</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>
                                    <xsl:for-each select="//skos:Concept[@rdf:about=$hasAccessRestriction]">
                                        <td>
                                            <xsl:value-of select="./skos:prefLabel[@xml:lang='en']"/>
                                            <a target='_blank' title="GUI" class="res-act-button">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                                </xsl:attribute>
                                                <xsl:text>GUI-access</xsl:text>
                                            </a>
                                        </td>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </tr>
                        </tbody> 
                    </table>
                </div>
                <div class="card-header">
                    <h3>More Information</h3>
                </div>
                <div class="card-body">
                    <xsl:variable name="hasRelatedDiscipline" select="$root_col_node//arche:hasRelatedDiscipline/@rdf:resource"/>
                    <xsl:variable name="hasRelatedProject" select="$root_col_node//arche:hasRelatedProject/@rdf:resource"/>
                    <table class="table table-striped table-responsive">
                        <thead>
                            <tr>
                                <xsl:for-each select="$root_col_node//arche:hasRelatedDiscipline">
                                    <th><xsl:text>Related Discipline</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasRelatedProject">
                                    <th><xsl:text>Related Project</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasCreatedStartDate">
                                    <th><xsl:text>Created Start Date</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasCreatedEndDate">
                                    <th><xsl:text>Created End Date</xsl:text></th>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasNumberOfItems">
                                    <th><xsl:text>Number of Items</xsl:text></th>
                                </xsl:for-each>
                            </tr>                            
                        </thead>
                        <tbody>
                            <tr>
                                <xsl:for-each select="$arche_context//skos:Concept[@rdf:about=$hasRelatedDiscipline]">
                                    <td><xsl:value-of select="./skos:prefLabel[@xml:lang='en']"/></td>
                                </xsl:for-each>
                                <xsl:for-each select="$arche_context//arche:Project[@rdf:about=$hasRelatedProject]">
                                    <td>
                                        <xsl:value-of select="./arche:hasTitle"/>
                                        <a target='_blank' title="GUI" class="res-act-button">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="replace(@rdf:about,'api',$gui)"/>
                                            </xsl:attribute>
                                            <xsl:text>GUI-access</xsl:text>
                                        </a>
                                    </td>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasCreatedStartDate">
                                    <td><xsl:apply-templates/></td>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasCreatedEndDate">
                                    <td><xsl:apply-templates/></td>
                                </xsl:for-each>
                                <xsl:for-each select="$root_col_node//arche:hasNumberOfItems">
                                    <td><xsl:apply-templates/></td>
                                </xsl:for-each>                           
                            </tr>
                        </tbody> 
                    </table>
                </div>
            </div><!-- .tab-pane -->
        </div><!-- tab-content bootstrap end -->
    </xsl:template>

</xsl:stylesheet>
