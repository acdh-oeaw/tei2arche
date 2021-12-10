function load_resources() {
    $(".load_resources").removeClass("fade").addClass("active");
    $(".load_resources").on("click", function() {
        var rs_id = $(this).attr('id');
        $('#' + "liveToast_" + rs_id).toast('show');       
        if ($("#" + "liveToast_" + rs_id).length == 0) {
            var rs_title = $(this).attr('title');
            $(this).children('svg').remove();
            var spinner = `<div id="${rs_id + "_spinner"}" class="spinner-border spinner-border-sm" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>` 
            $(this).append(spinner);
            createToast(rs_id, rs_title, spinner);
            //var project_title = $('#project-xsl').text().toLowerCase().replace('\\s','_');
            const downloader = ARCHEapi.ARCHEdownloadResourceIdM;
            const query = ARCHEapi.ARCHErdfQuery;
            const left_join = ARCHEapi.ARCHEmatchJSON;
            var host = "https://arche.acdh.oeaw.ac.at/api";
            var format = "application/n-triples";
            var col_url = $(this).attr('data-target');
            var resourceId = col_url.replace(host + '/','');
            var readMode = 'neighbors';
            downloader(host, resourceId, format, readMode, function(rs) {
                var subject = null;
                var predicate = "https://vocabs.acdh.oeaw.ac.at/schema#isPartOf";
                var object = col_url;
                var resources = query(subject, predicate, object, rs);
                var predicate = "https://vocabs.acdh.oeaw.ac.at/schema#hasTitle";
                var object = null;
                var titles = query(subject, predicate, object, rs);
                var predicate = "https://vocabs.acdh.oeaw.ac.at/schema#hasIdentifier";
                var identifiers = query(subject, predicate, object, rs);
                var arche = left_join(resources, titles);
                var arche2 = left_join(resources, identifiers);
                var arche = {
                    data: arche
                };
                var arche2 = {
                    data2: arche2
                };
                var resourceFiles = createBody(arche, arche2);
                var rs_modal = createModal(rs_id, rs_title, resourceFiles);
                var rs_link = `<button class="btn btn-primary" type="button" data-target="${'#' + rs_id + '_toast_rs_link'}" data-toggle="modal" title="Resourcen anzeigen" alt="Resourcen anzeigen">
                                <span>Einträge anzeigen</span>
                                </button>`
                $('#' + rs_id + '_toast_progress_wrapper').remove();
                $('#single-wrapper').append(rs_modal);
                createDataTable(rs_id);
                $('#' + rs_id + '_toast_body').append(rs_link);
                $('#' + rs_id + "_spinner").remove();
                $('#' + rs_id).append('anzeigen');
            });
        }
    });  
};

function createDataTable(rs_id) {
    $('#' + rs_id + '_modal_table').DataTable({
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
        },
        dom: 'fpBirtp',
        buttons:['copy', 'excel', 'pdf'],
        "lengthMenu":[25, 50, 75, 100, "All"],
        responsive: false,
        orderCellsTop: true,
        "pageLength": 25,
        keepConditions: true                    
    });
};

function createBody(arche, arche2) {
    var regex = new RegExp('@\\w+');
    // var tei_source = $('#tei_source').text();
    var turtle = "/metadata";
    var rdfxml = "/metadata?format=application/rdf%2Bxml";
    var browser = "/browser/oeaw_detail/";
    var transform = "?format=customTei2Html";
    var title = [];
    var tei2html = [];
    var browseArche = [];
    var xml = [];
    var rdf = [];   
    for (var i = 0; i < arche2.data2.length; i++) {
        if (arche2.data2[i].object.includes('id.acdh.oeaw.ac.at') && !arche2.data2[i].object.includes('id.acdh.oeaw.ac.at/cmdi')) {
            tei2html.push(arche2.data2[i].object + transform);
        }
    }
    for (var i = 0; i < arche.data.length; i++) {                        
        title.push(arche.data[i].object.replace(regex,''));
        browseArche.push(arche.data[i].subject.replace('/api/', browser));
        xml.push(arche.data[i].subject + rdfxml);
        rdf.push(arche.data[i].subject + turtle);            
    }
    var resourceFiles = "";
    for (var i = 0; i < title.length; i++) {
        resourceFiles +=   `<tr>
                                <td>
                                    <a title="${title[i]}" alt="${title[i]}" target="_blank" 
                                        href="${tei2html[i]}">
                                        ${title[i]}
                                    </a>
                                </td>
                                <td>
                                    <a title="ARCHE" alt="ARCHE" target="_blank" 
                                        href="${browseArche[i]}">
                                        Öffnen
                                    </a>
                                </td>
                                <td>
                                    <a title="RDF/Turtle" alt="RDF/Turtle" target="_blank" 
                                        href="${rdf[i]}">
                                        Öffnen
                                    </a>
                                </td>
                                <td>
                                    <a title="RDF/XML" alt="RDF/XML" target="_blank" 
                                        href="${xml[i]}">
                                        Öffnen
                                    </a>
                                </td>
                            </tr>`;
    }
    return resourceFiles;
};

function createModal(rs_id, rs_title, resourceFiles) {
    var regex = new RegExp('@\\w+');
    var rs_modal = `<div class="modal fade" id="${rs_id + '_toast_rs_link'}" tabindex="-1" aria-labelledby="downloadModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="downloadModalLabel">${rs_title.replace(regex,'')}</h5>
                                    <button type="button" class="ml-2 mb-1 close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body table-responsive">
                                    <table id="${rs_id + '_modal_table'}" class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>ARCHE</th>
                                                <th>RDF/Turtle</turtle>
                                                <th>RDF/XML</turtle>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            ${resourceFiles}
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>`;
    return rs_modal;
};

function createToast(rs_id, rs_title, spinner) {
    var toast = `<div class="anchor" id="${"liveToast_anchor_" + rs_id}"/>
                    <div class="toast" id="${"liveToast_" + rs_id}" role="alert" aria-live="assertive" aria-atomic="true">
                        <div class="toast-header">
                            <strong class="me-auto">ARCHE Download</strong>
                            <small>${rs_title}</small>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="toast-body" id="${rs_id + "_toast_body"}">
                            <div id="${rs_id + "_toast_progress_wrapper"}" class="text-center">
                                ${spinner}
                            </div>
                        </div>
                    </div>`;                       
    $('#toast_styles').css('min-height', '1px');
    $('#toast_wrapper').prepend(toast);
    $(".toast").toast({ autohide: false });
    $('#' + "liveToast_" + rs_id).toast('show'); 
};