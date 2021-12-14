$("#register_show").click(function(){
    // display map container
    $('#leaflet-map-one').css({'display': 'flex'});
    // leaflet map:
    var latStart = document.body.querySelectorAll('.map-coordinates')[0].getAttribute('lat');
    var longStart = document.body.querySelectorAll('.map-coordinates')[0].getAttribute('long');
    var mymap = L.map('leaflet-map-one').setView([latStart,longStart], 10);
    setTimeout(function(){ mymap.invalidateSize()}, 300);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Map data &amp;copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.openstreetmap.org/">OpenStreetMap</a>',
        maxZoom: 18,
        zIndex: 1
    }).addTo(mymap);

    //create labels for each coordinate existing lat long coordinate
    document.body.querySelectorAll('.map-coordinates').forEach(function(node){
        if (node.getAttribute('lat').length != 0) {
            var lat = node.getAttribute('lat');
            var long = node.getAttribute('long');
            var place = node.getAttribute('subtitle');                    
            L.marker([lat,long]).bindPopup(place).addTo(mymap);
            }
        });
});
