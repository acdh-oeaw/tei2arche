function loadRegister(xslt, xml, element) {
    // CSS tansformations to show loader and hide content
    $("#about").removeClass("active").addClass("fade");
    $("#transform").removeClass("active").addClass("fade");
    $("#home").removeClass("active").addClass("fade");
    $("#search").removeClass("active").addClass("fade");
    $("#edition").removeClass("active").addClass("fade");
    $("#listplace-tab").css("display", "none");
    $("#listorg-tab").css("display", "none");
    $("#listperson-tab").css("display", "none");
    $(".nav-link").removeClass("active show");
    $(".saxon-request").remove();
    if ($(`#${element}`).length == 0) {
        var create_spinner =    `<div id="loader_wrapper" class="text-center">
                                        <div class="spinner-border active" role="status"
                                            id="xyz_spinner" style="width: 5rem; height: 5rem;"
                                        </div>
                                    </div>`;
        $('#single-wrapper').prepend(create_spinner);
        SaxonJS.transform({
            stylesheetLocation: `../xsl/template_imports_sef_json/${xslt}.sef.json`, // https://tei4arche.acdh-dev.oeaw.ac.at
            sourceLocation: xml,
            destination: "serialized"
        }, "async")
        .then(() => {
            buildDataTable(element, 50);
            $("#loader_wrapper").remove();
            $(`#${element}-tab`).css("display", "block");
        });
    } else {
        $(`#${element}-tab`).css("display", "block");
    }
}

function buildDataTable(table_id, pageLength) {
    if (document.getElementById(table_id + "_wrapper") === null) {  
        var tableOne = $('#' + table_id).DataTable({
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
        if ($('#listplace')) {
            buildLeaflet(tableOne);
        }
    }
}

function buildLeaflet(tableOne) {                
    $(document).ready(function() {                
        // display map container
        $('#leaflet-map-one').css({'display': 'flex'});
        // leaflet map:
        var latStart = document.body.querySelectorAll('.map-coordinates')[0].getAttribute('lat');
        var longStart = document.body.querySelectorAll('.map-coordinates')[0].getAttribute('long');
        var mymap = L.map('leaflet-map-one').setView([latStart,longStart], 2);
        
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: 'Map data &amp;copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.openstreetmap.org/">OpenStreetMap</a>',
            maxZoom: 18,
            zIndex: 1
        }).addTo(mymap);
        
        //create labels for each coordinate existing lat long coordinate
        var markers = L.markerClusterGroup();
        var markersStart = L.markerClusterGroup();
        var coordinatesStart = getCoordinates();
        mymap.addLayer(markers);
        try {
            mymap.fitBounds(markers.getBounds());
        } catch (err) {
            console.log(err);
        }
                     
        // // variable id #tableOne must match table id in html
        // var tableOne = $('#' + table_id).DataTable({
        //     "language": {
        //         "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
        //         },
        //     dom: 'fpBirtp',
        //     buttons:['copy', 'excel', 'pdf'],
        //     "lengthMenu":[25, 50, 75, 100, "All"],
        //     responsive: true,
        //     orderCellsTop: true,
        //     "pageLength": pageLength,
        //     keepConditions: true
        // });
        
        tableOne.on('search.dt', function(){
            markers.clearLayers();
            var currentLayer = getCoordinates();
            mymap.addLayer(markers);
            try {
                mymap.fitBounds(markers.getBounds());
            } catch (err) {
                console.log(err);
            }
    
        });
        
        tableOne.on('page.dt', function(){
            markers.clearLayers();
            var currentLayer = getCoordinates();
            mymap.addLayer(markers);
            try {
                mymap.fitBounds(markers.getBounds());
            } catch (err) {
                console.log(err);
            }
        });
            
        function getCoordinates(){
            document.body.querySelectorAll('.map-coordinates').forEach(function(node){
                var lat = node.getAttribute('lat');
                var long = node.getAttribute('long');
                var place = node.getAttribute('subtitle');
                markers.addLayer(L.marker([lat,long]).bindPopup(place));
                markersStart.addLayer(L.marker([lat,long]).bindPopup(place));
            });
        };
    });
}