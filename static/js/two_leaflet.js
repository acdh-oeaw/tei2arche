// ############### custom script ###############
// display map container
$('#leaflet-map-two').css({'display': 'inline'});
// leaflet map:
var latStart = document.body.querySelectorAll('.map-coordinates')[0].getAttribute('lat');
var longStart = document.body.querySelectorAll('.map-coordinates')[0].getAttribute('long');
var mymap = L.map('leaflet-map-two').setView([latStart, longStart], 2);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: 'Map data &amp;copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.openstreetmap.org/">OpenStreetMap</a>',
    maxZoom: 18,
    zIndex: 1
}).addTo(mymap);

var markers = L.markerClusterGroup();

document.body.querySelectorAll('.map-coordinates').forEach(function(node){
    if (node.getAttribute('lat').length != 0) {
        var lat = node.getAttribute('lat');
        var long = node.getAttribute('long');
        var place = node.getAttribute('subtitle');                    
        markers.addLayer(L.marker([lat,long]));
        //markers.bindPopup(place).openPopup();
        }
    });
markers.addTo(mymap);
try {
    mymap.fitBounds(markers.getBounds());
} catch (err) {
    console.log(err);
}
    
// invaldidateSize error fix bootstrap tab link #crew-info

/*var crewInfoTab = document.getElementById('crew-info');
var observer = new MutationObserver(function(){
if(crewInfoTab.style.display != 'none'){
    mymap.invalidateSize();
    }
});
observer.observe(crewInfoTab, {attributes: true});*/ 