// Execute a function when the user releases a key on the keyboard
function searchText(event) {
    if ($('#searchTable_dt_wrapper') !== null) {
        $('#searchTable_dt_wrapper').remove();
    }
    $("#searchEnd").removeClass("active").addClass("fade");
    $("#loader_wrapper").remove();  
    // CSS tansformations to show loader and hide content
    var create_spinner =    `<div id="loader_wrapper" class="text-center"> 
                                    <div class="spinner-border active" role="status" 
                                        id="xyz_spinner" style="width: 5rem; height: 5rem;"
                                    </div>
                                </div>`;        
    $('#single-wrapper').prepend(create_spinner);  
    // var navLinks = document.getElementsByClassName("nav-link");
    $("#about").removeClass("active").addClass("fade");
    $("#transform").removeClass("active").addClass("fade");
    $("#home").removeClass("active").addClass("fade");
    $("#edition").removeClass("active").addClass("fade");
    if ($("#collections") !== null) {
        $("#collections").removeClass("active").addClass("fade");
    }
    $("#search").removeClass("fade").addClass("active");
    $(".nav-link").removeClass("active show");

    event.preventDefault();
    const data = new FormData(event.target);
    const value = data.get('q');

    const query = ARCHEapi.ARCHErdfQuery;
    const search = ARCHEapi.ARCHEsearchText;

    const host = "https://arche-dev.acdh-dev.oeaw.ac.at/api/search?";
    const property0 = "https://vocabs.acdh.oeaw.ac.at/schema%23hasCustomXsl";
    const value0 = "https://tei4arche.acdh-dev.oeaw.ac.at/xsl/" + $('#project-xsl').text().toLowerCase();
    const searchQuery = value;
    const ftsMaxFragments = 1;

    search(host, property0, value0, searchQuery, ftsMaxFragments, (rs) => {
        var search = query(null,"https://vocabs.acdh.oeaw.ac.at/schema#hasTitle",null,rs);
        var search2 = query(null,"https://vocabs.acdh.oeaw.ac.at/schema#hasIdentifier",null,rs);
        var search3 = query(null,"search://fts",null,rs);
        var search = {
            data: search
        };
        var search2 = {
            data: search2
        };
        var search3 = {
            data: search3
        };
        var table = createSearchTable(search, search2, search3);          
        $("#searchTable").append(table);   
        createSearchDataTable();
        $("#loader_wrapper").remove();            
        $("#searchEnd").removeClass("fade").addClass("active");
    });
};

const form = document.querySelector('form');
form.addEventListener('submit', searchText);

function createSearchTable(search, search2, search3) {
    var regex = new RegExp('@\\w+');
    // var teiSource = $('#tei_source').text() + '/';
    var browser = "/browser/oeaw_detail/";
    var rdfxml = "/metadata?format=application/rdf%2Bxml";
    var transform = "?format=customTei2Html";
    var turtle = "/metadata";
    var regex = new RegExp('@\\w+');
    var tbodyOpen = "<tbody>";
    var tbodyClose = "</tbody>";
    var title = [];
    var tei2html = [];
    var browseArche = [];
    var xml = [];
    var rdf = [];
    var searchresult = [];  
    for (var i = 0; i < search2.data.length; i++) {
        if (search2.data[i].object.includes('id.acdh.oeaw.ac.at') && !search2.data[i].object.includes('id.acdh.oeaw.ac.at/cmdi')) {
            tei2html.push(search2.data[i].object + transform);
        }
    }
    for (var i = 0; i < search.data.length; i++) {                        
        title.push(search.data[i].object.replace(regex,''));
        browseArche.push(search.data[i].subject.replace('/api/', browser));
        xml.push(search.data[i].subject + rdfxml);
        rdf.push(search.data[i].subject + turtle);            
    }
    for (var i = 0; i < search3.data.length; i++) {                        
        searchresult.push(search3.data[i].object.replace(regex,''));           
    }
    for (var i = 0; i < searchresult.length; i++) {
        tbodyOpen += `<tr>
        <td>${searchresult[i]}</td>
        <td>${title[i]}</td>
        <td><a href=${tei2html[i]} target="_blank" class="body_translations" title="Öffnen">Öffnen</a></td>
        <td><a href=${browseArche[i]} target="_blank" class="body_translations" title="Öffnen">Öffnen</a></td>
        <td><a href=${xml[i]} target="_blank" class="body_translations" title="Öffnen">Öffnen</a></td>
        <td><a href=${rdf[i]} target="_blank" class="body_translations" title="Öffnen">Öffnen</a></td>
        </tr>`;
    }
    var tbody = tbodyOpen.concat(tbodyClose);
    var table = `<table id="searchTable_dt" class="table table-responsive table-striped">
                    <thead>
                        <tr>
                            <th class="body_translations" title="Suchergebnis">Suchergebnis</th>
                            <th class="body_translations" title="Dokumenttitel">Dokumenttitel</th>
                            <th class="body_translations" title="TEI/XML zu HTML">TEI/XML zu HTML</th>
                            <th title="ARCHE">ARCHE</th>
                            <th title="RDF/XML">RDF/XML</th>
                            <th title="RDF/TURTLE">RDF/TURTLE</th>
                        </tr>
                    </thead>` + tbody + `</table>`;
    return table;
};

function createSearchDataTable() {
    if (document.getElementById("searchTable_dt_wrapper") === null) {
        // Transform table to DataTable
        $('#searchTable_dt').DataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
            },
            dom: 'fpBirtp',
            buttons:['copy', 'excel', 'pdf'],
            "lengthMenu":[25, 50, 75, 100, "All"],
            responsive: true,
            orderCellsTop: true,
            "pageLength": 50,
            keepConditions: true                    
        }); 
    }
};