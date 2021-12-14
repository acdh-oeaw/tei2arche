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
            var coordinatesStart = getCoordinates();
            var startLayer = L.geoJson(getCoordinatesGeojson, {
                onEachFeature: function(feature, layer) {
                    layer.bindPopup(feature.properties.name);
                }
            });
            markers.addLayer(startLayer);
            mymap.addLayer(markers);
            try {
                mymap.fitBounds(markers.getBounds());
            } catch (err) {
                console.log(err);
            }            
               
            // variable id #tableOne must match table id in html
            var tableOne = $('#tableOne').DataTable({
                "language": {
                    "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
                    },
                dom: 'fpBirtp',
                buttons: [{
                    extend: 'colvis',
                    className: 'btn-outline-green',
                    init: function(api, node, config) {
                        $(node).removeClass('btn-secondary')
                    }
                },
                {
                    extend: 'copyHtml5',
                    text: '<i class="far fa-copy"/>',
                    titleAttr: 'Copy',
                    className: 'btn-link',
                    init: function(api, node, config) {
                        $(node).removeClass('btn-secondary')
                    }
                },
                {
                    extend: 'excelHtml5',
                    text: '<i class="far fa-file-excel"/>',
                    titleAttr: 'Excel',
                    className: 'btn-link',
                    init: function(api, node, config) {
                        $(node).removeClass('btn-secondary')
                }
                },
                {
                    extend: 'pdfHtml5',
                    text: '<i class="far fa-file-pdf"/>',
                    titleAttr: 'PDF',
                    className: 'btn-link',
                    init: function(api, node, config) {
                        $(node).removeClass('btn-secondary')
                    }
                }
                ],
                responsive: true,
                orderCellsTop: true,
                "pageLength": 50,
                keepConditions: true
            });
               
            tableOne.on('search.dt', function(){
                markers.clearLayers();
                var geoJsonLayer = L.geoJson(getCoordinatesGeojson, {
                    onEachFeature: function(feature, layer) {
                        layer.bindPopup(feature.properties.name);
                    }
                });
                markers.addLayer(geoJsonLayer);
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
                    });
                };
                
            function getCoordinatesGeojson(){
                var geojsonArray = [];
                document.body.querySelectorAll('.map-coordinates').forEach(function(node, i){
                    var geojson = new Object();
                    var lat = node.getAttribute('lat');
                    var long = node.getAttribute('long');
                    var place = node.getAttribute('subtitle');
                    geojson.id = i;
                    geojson.type = "Feature";
                    geojson.geometry = {
                        "type": "Point",
                        "coordinates": [
                            lat,
                            long
                            ]
                        };
                    geojson.properties = {
                        "name": place
                        };
                    geojsonArray.push(geojson);
                });
                return geojsonArray;
            };
            
            function onEachFeature(feature, layer) {
                layer.bindPopup(feature.properties.name);
            };