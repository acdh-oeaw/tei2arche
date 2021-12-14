$(document).ready(function() {
    //declaring variables for loader animation
    var loader = document.getElementById("loaderHome");
    var loaderEnd = document.getElementById("loaderHomeEnd");                
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
                   
    // variable id #tableOne must match table id in html
    var tableOne = $('#tableOne').DataTable({
        /*"language": {
            "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
            },*/
        dom: 'fpBirtp',
        buttons:['copy', 'excel', 'pdf'],
        "lengthMenu":[25, 50, 75, 100, "All"],
        responsive: true,
        orderCellsTop: true,
        "pageLength": 50,
        keepConditions: true
    });
    
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
    loader.remove();
    loaderEnd.classList.remove('fade');               
    loaderEnd.classList.add('active');
});