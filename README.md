# tei2arche

* repo to collect XML/TEI files from different projects and create XSLTs to display those XML/TEIs in an appealing way as HTML

## Projects

The following project stylesheets were created with this repostitory:

* [Grundbücher](https://id.acdh.oeaw.ac.at/grundbuecher/e00329_1438-02-06.xml?format=customTei2Html)
* [Thun Korrespondenz](https://id.acdh.oeaw.ac.at/thun/editions/thesen-gegen-kirchenbeschluesse-protestanten-ungarn-od-a3-xxi-d490.xml?format=customTei2Html)
* [DAACDA](https://id.acdh.oeaw.ac.at/daacda/bomber__744.xml?format=customTei2Html)
* [Mächtekongress](https://id.acdh.oeaw.ac.at/maechtekongresse/editions/Aachen_Dok_50.xml?format=customTei2Html)
* [Arthur Schnitzler Tagebücher](https://id.acdh.oeaw.ac.at/schnitzler/schnitzler-tagebuch/editions/entry__1879-11-18.xml?format=customTei2Html)
* [Arthur Schnitzler Briefe](https://id.acdh.oeaw.ac.at/schnitzler/schnitzler-briefe/editions/L01563.xml?format=customTei2Html)
* [Gebrüder Pez Korrespondenz](https://id.acdh.oeaw.ac.at/pez/pez-nachlass/msDesc_430582.xml?format=customTei2Html)
* [Große Transformation](https://id.acdh.oeaw.ac.at/gtrans/archiv/archresource/3316?format=customTei2Html)

## Getting Started

Download as Zip, clone or fork this repository.

Run `script.sh` in your terminal to create a copy of test.xsl and /test_project.
The script will prompt you to enter a project name which will be used as name of the output files. 
The project name must match the hasCustomXsl attribute value (without file-extention) of ARCHE.

### test.xsl and test_project folder

All xsl transformation templates are in the `xsl` sub-folder. While there are already several project that use this repository, each of this projects requires one main xsl transformation file and a project specific folder contains an xsl template for a `content_block` and another one for `navbar-links`. Use the `test.xsl` template together with the `test_project` folder to start your project and further adapt it to your needs. Test it by applying it to your TEI/XML without prior changing it. The `test.xsl` stylesheet has necessary HTML structure pre-set as well as all required TEI template imports. To start a new project you can use this template to transform TEI/XML into HTML. The pre-set test templates include all relevant HTML elements for your webpage based on the ACDH Fundament project. Important inline templates for a `teiHeader` and `tei:body` are included. What is missing are project specific xsl templates for the TEI/BODY. 

The `test_project` folder contains two basic templates. The `content_block` template containes the html body content. It uses Bootstrap 4 card, card-header and card-body classes to set css styles. Additionally it uses Bootstrap 4 taps to switch between content. Create your project specific xsl templates inside this file and override other imported templates if necessary. The `navbar-links` template contains HTML list elements for the main navbar. The user can add and remove list elements and with it the corresponding links in the HTML navbar. Important! If list elements are added or removed the corresponding tap-pane inside `content_block` must be manually adapted. For further information on Bootstrap Tabs and Cards visit [Bootstrap](https://getbootstrap.com/).

The following templates are currently available in: 

* template_imports
* arche_templates

The following folder contains files to start your project with:
(You can rename or copy the folder but have to change the url of the project specific template imports within the main transformation xsl e.g. `test.xsl`.)

* test_project

### Parameters

To adapt your project to a specific collection use xsl param values. These param values are set within the main xsl template e.g. `test.xsl`.

* `param name="app-name"` : name of the application `as string`
* `param name="document"` : TEI/XML filename incl. file-extention `as string`
* `param name="transform"` : Transformation xsl filepath + filename incl. extention `as string`
* `param name="collection-name"` : Name of the collection to be displayed in the navbar `as string`
* `param name="iiif"` : Filepath to where facsimiles are stored `as string`
* `param name="tei-source"` : Filepath + filename incl. extention of current file `as string`
* `param name="project-xsl"` : Transformation xsl filename incl. extention `as string`
* `param name="image-url"` : Project Image/Thumbnail Url for image shown in the navbar `as string`
* `param name="navbar-color"` : Bootstrap 4 color classes for the navbar e.g. "navbar-dark bg-dark" `as string`
* `param name="baseURL"` : Filepath where all TEI/XML files are stored `as string`
* `param name="title"` : Collection Title  displayed as HTML Site Title and metatdata title `as string`
* `param name="next"` : Filepath + filename incl. extention to the next TEI/XML file `as string`
* `param name="prev"` : Filepath + filename incl. extention to the previous TEI/XML file `as string`
* `param name="arche_root_col_url"` : ARCHE TopCollection metadata URL e.g. https://arche.acdh.oeaw.ac.at/api/108253 `as string`
* `param name="arche_child_col_url"` : ARCHE Collection metadata URL e.g. https://arche.acdh.oeaw.ac.at/api/108254 `as string` (Needed only if one sub-collection exists)    

### JAVASCRIPT

Javascript templates are available in the static/js folder.
Required Javascript files are already added to `test.xsl` as follows:

* `handle_links_inside_bootstrap_tabs.js` : If you add an anchor to jump to one of the hidden tabs this script is required.
* `change_color_theme.js` : Several available Bootstrap themese are available and the user can switch between them.
* `language-switcher-generic.js`: Changes the language of manually added `strings`. Will not change TEI/XML content language.
* `arche_api_searchText.js` : Enables access to ARCHE full text search API. Requires `param project-xsl` and `param arche_root_col_url`. 
* `n3_parsing_arche_metadata.js`: Enables access to ARCHE GET API to download rdf metadata as N-Triples and collects project specific metadata displayed in an DataTable. Requires `param arche_root_col_url` and `param tei_source`.

#### Other scripts

* `n3_parsing_arche.js`: In case the projects has one child Collection that contains all projects Resources this script can be used to download their project specific links and titles. Displays the data in a DataTable.  Requires `param arche_root_col_url` and `param arche_child_col_url` and `param tei_source`.
* `n3_parsing_arche_no_edition` : If there are several child Collections where each contains projects Resources this script accesses the TopCollection and downloads all Collection that it points to. Creates the same result as in the previous point. Requires `param arche_root_col_url` and `param arche_child_col_url` and `param tei_source`.
* `n3_parsing_arche_onclick` : This script works on top of `n3_parsing_arche_no_edition` or `n3_parsing_arche.js`. It enables a seperate download for Collection specific Resources and downloads their projects links and titles. Displays the data as DataTable within a modal. Requires `param tei_source`.

Each of the `n3_` scripts has a duplicate `_dev` script for development. The development script should be used when the projects is hosted on ARCHE development instead of production.

* `datatable_one.js` : Creates a DataTable from an Html table. Table ID must be adjusted. Requires DataTable base css and scripts which are available as template imports.
* `two_datatables.js` : Ceates up to three DataTables from Html tables. Table IDs must be adjusted.
* `one_leaflet.js` : Create a leaflet map and adds it to a map container. Requires `tei-geo.xsl` called as template and adjusted to the ID set in the script. Requires Leaflet base css and scripts which are available as template imports.
* `two_leaflet.js` : Creates up to two maps. Same requiresments as in previous point. 
* `datatable_leaflet_combination` : If both, a DataTable and Leaflet are required, this script creates both and connects the DataTable Search and Pagination with the Leaflet Map to search for data in the Table and on the Leaflet Map. 
* `osd.js` : If the projects contains facsimiles, this script uses OpenSeaDragon to display them. Requires OSD base css and js which are provides as xsl import. Requires `tei-facsimiles.xsl`.

## Examples

Feel free to explore the other projects and their projects specific xsl files. This examples contain a mix of template_imports and scripts to transform and display TEI/XML as HTML. 

## CSS 

Stylesheet templates are availabile in the static/css folder. Project specific css should be created within the main xsl template e.g. test.xsl.

minor
