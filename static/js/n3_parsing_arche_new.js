function downloadArcheTopCol() {
    simulateBootstrapTaps();
    var project_title = $('#project-xsl')
        .text()
        .toLowerCase()
        .replace('\\s','_')
        .replace(".xsl","");

    if ($('#tableAjax_wrapper').length == 0) {
        // added bootstrap spinner loading animation
        createSpinner();

        if (localStorage.getItem(project_title) == null) {
            var downloader = ARCHEapi.ARCHEdownloadResourceIdM2;
            var query = ARCHEapi.ARCHErdfQuery;
            var host = "https://arche.acdh.oeaw.ac.at/api";
            var col_url = $('#child_col_url').text();
            var col_id = col_url.replace(host + '/','');
            var options = {
                "host": "https://arche.acdh.oeaw.ac.at/api",
                "format": "application/n-triples",
                "resourceId": col_id,
                "readMode": 'neighbors',
                "paginate": false
            };
            try {
                downloader(options)
                .then((response) => {          
                    var thead = `<thead>
                                    <tr>
                                        <th class="body_translations" title="Dokumenttitel">Dokumenttitel</th>
                                        <th class="body_translations" title="TEI/XML zu HTML">TEI/XML zu HTML</th>
                                        <th title="ARCHE">ARCHE</th>
                                        <th title="RDF/XML">RDF/XML</th>
                                        <th title="RDF/TURTLE">RDF/TURTLE</th>
                                    </tr>
                                </thead>`;   
                    $("#tableAjax").append(thead);       
                    var array = [];
                    let collection = getCollections(0, 865, col_url, response);
                    collection.value.forEach((el) => {
                        // console.log(element);                        
                        var rsID = el.isPartOf.subject.replace("https://arche.acdh.oeaw.ac.at/api/","");
                        let options = {
                            "host": "https://arche.acdh.oeaw.ac.at/api",
                            "format": "application/n-triples",
                            "resourceId": rsID,
                            "readMode": "resource"
                        };   
                        try {
                            downloader(options).then((data) => {
                                let options = {
                                    "subject": null,
                                    "predicate": null,
                                    "object": null,
                                    "expiry": 14,
                                    "paginate": false
                                };
                                var rss = query(options, data);
                                // console.log(rss)
                                array.push(rss);                                    
                            });
                        } catch (err) {
                            console.log(err);
                        }              
                    });  
                    // localStorage.setItem(projectsTitle, JSON.stringify(array));
                    // console.log("downloadData");
                    // console.log(array);
                    setTimeout(() => {                            
                        var table = createTable(array);                            
                        $("#tableAjax").append(table);
                        buildDataTable('tableAjax', 50);
                        $("#loader_wrapper").remove();           
                        $("#loaderEnd").removeClass("fade").addClass("active"); 
                    }, 2000);                               
                }); 
            } catch (error) {
                console.log(error);
            }
        } else {
            var arche = JSON.parse(localStorage.getItem(project_title.replace(".xsl","")));
            var arche2 = JSON.parse(localStorage.getItem(project_title.replace(".xsl","") + '_2'));
            console.log(arche);
            console.log(arche2);
            // if (arche2.data2.length !== 0) {
            //     var table = createTable(arche, arche2);
            // } else {
            //     var table = createTable2(arche);
            // }     
            // $("#tableAjax").append(table);
            // buildDataTable('tableAjax', 50);
            // $("#loader_wrapper").remove();           
            // $("#loaderEnd").removeClass("fade").addClass("active");
        }  
    }         
};

function simulateBootstrapTaps() {
    // CSS tansformations to show loader and hide content
    $("#about").removeClass("active").addClass("fade");
    $("#transform").removeClass("active").addClass("fade");
    $("#home").removeClass("active").addClass("fade");
    $("#search").removeClass("active").addClass("fade");
    $("#edition").removeClass("fade").addClass("active");
    $(".nav-link").removeClass("active show");
};

function createSpinner() {
    var create_spinner =    
        `<div id="loader_wrapper" class="text-center">
            <div class="spinner-border active" role="status"
                id="xyz_spinner" style="width: 5rem; height: 5rem;"
            </div>
        </div>`;
    $('#single-wrapper').prepend(create_spinner);
};

function getCollections(paginateStart, paginateEnd, col_url, data) {
    var query = ARCHEapi.ARCHErdfQuery;
    let options = {
        "subject": null,
        "predicate": "https://vocabs.acdh.oeaw.ac.at/schema#isPartOf",
        "object": col_url,
        "expiry": 14,
        "paginate": [paginateStart, paginateEnd]
    };
    var collections = query(options, data);
    return collections;
};

function createTable(array) {
    // var teiSource = $('#tei_source').text() + '/';
    var tbodyOpen = "<tbody>";
    var tbodyClose = "</tbody>";
    var browser = "/browser/oeaw_detail/";
    var rdfxml = "/metadata?format=application/rdf%2Bxml";
    var transform = "?format=customTei2Html";
    var turtle = "/metadata";
    var regex = new RegExp('@\\w+');
    var title = [];
    var tei2html = [];
    var browseArche = [];
    var xml = [];
    var rdf = []; 
    array.forEach((rs) => {
        rs.value.forEach((el) => {
            if (el.hasTitle && el.hasTitle.lang == "de") {
                console.log(el.hasTitle);
                title.push(el.hasTitle.object);
                browseArche.push(el.hasTitle.subject.replace('/api/', browser));
                xml.push(el.hasTitle.subject + rdfxml);
                rdf.push(el.hasTitle.subject + turtle); 
            }
            
        });
        rs.value.forEach((el) => {
            if (el.hasIdentifier) {
                if (el.hasIdentifier.object.includes('id.acdh.oeaw.ac.at') && !el.hasIdentifier.object.includes('id.acdh.oeaw.ac.at/cmdi')) {
                    tei2html.push(`${el.hasIdentifier.object}${transform}`);
                }
            }            
        });  
    });
    for (var i = 0; i < title.length; i++) {
        tbodyOpen += `<tr>
        <td>${title[i]}</td>
        <td><a href=${tei2html[i]} target="_blank" class="body_translations" title="Öffnen">Öffnen</a></td>
        <td><a href=${browseArche[i]} target="_blank" class="body_translations" title="Öffnen">Öffnen</a></td>
        <td><a href=${xml[i]} target="_blank" class="body_translations" title="Öffnen">Öffnen</a></td>
        <td><a href=${rdf[i]} target="_blank" class="body_translations" title="Öffnen">Öffnen</a></td>
        </tr>`;
    }
    return tbodyOpen.concat(tbodyClose);
};

function createTable2(arche) {
    var browser = "/browser/oeaw_detail/";
    var rdfxml = "/metadata?format=application/rdf%2Bxml";
    var turtle = "/metadata";
    var regex = new RegExp('@\\w+');
    var tbodyOpen = "<tbody>";
    var tbodyClose = "</tbody>";
    var title = [];
    var dl_id = [];
    var browseArche = [];
    var plainURL = []
    var xml = [];
    var rdf = [];   
    for (var i = 0; i < arche.data.length; i++) {    
        dl_id.push("resource_" + Math.ceil(Math.random() * 10) + Math.ceil(Math.random() * 10) +Math.ceil(Math.random() * 10));                    
        title.push(arche.data[i].object.replace(regex,''));
        browseArche.push(arche.data[i].subject.replace('/api/', browser));
        xml.push(arche.data[i].subject + rdfxml);
        rdf.push(arche.data[i].subject + turtle);      
        plainURL.push(arche.data[i].subject)      
    }
    for (var i = 0; i < title.length; i++) {
        tbodyOpen += `<tr>
                        <td>
                            <a class="load_resources fade" id="${dl_id[i]}" title="${title[i]}" data-target="${plainURL[i]}"  href="${'#liveToast_anchor_' + dl_id[i]}">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
                                </svg>
                            </a>
                        </td>
                        <td>${title[i]}</td>
                        <td><a href=${browseArche[i]} target="_blank" class="body_translations" title="Öffnen">Öffnen</a></td>
                        <td><a href=${xml[i]} target="_blank" class="body_translations" title="Öffnen">Öffnen</a></td>
                        <td><a href=${rdf[i]} target="_blank" class="body_translations" title="Öffnen">Öffnen</a></td>
                    </tr>`;
    }
    var thead = `<thead>
                    <tr>
                        <th class="body_translations" title="klicken um zu aktivieren"><a style="color: #3E91BB !important;" onclick="load_resources()"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
                        </svg>Download</a></th>
                        <th class="body_translations" title="Dokumenttitel">Dokumenttitel</th>
                        <th title="ARCHE">ARCHE</th>
                        <th title="RDF/XML">RDF/XML</th>
                        <th title="RDF/TURTLE">RDF/TURTLE</th>
                    </tr>
                </thead>`;
    var tbody = tbodyOpen.concat(tbodyClose);
    return thead.concat(tbody);
};

function buildDataTable(html_id, pageLength) {
    if (document.getElementById(html_id + "_wrapper") === null) {
        $('#' + html_id).DataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
            },
            dom: 'fpBirtp',
            buttons:['copy', 'excel', 'pdf'],
            "lengthMenu":[25, 50, 75, 100, "All"],
            responsive: true,
            orderCellsTop: true,
            "pageLength": pageLength,
            keepConditions: true
        });
    }
}