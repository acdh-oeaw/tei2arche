// DataTables:
$(document).ready(function() {
    $('#tableOne').DataTable();
    $('#tableTwo').DataTable();
    $('#tableThree').DataTable();
});
// variable id #tableOne must match table id in html
var tableOne = $('#tableOne').DataTable({
    /*"lanaguage": {
        "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
        },*/
    dom: 'fpBirtp',
    buttons:['copy', 'excel', 'pdf'],
    "lengthMenu":[25, 50, 75, 100, "All"],
    responsive: false,
    orderCellsTop: true,
    "pageLength": 25,
    keepConditions: true
});
// variable id #tableOne must match table id in html
var tableTwo = $('#tableTwo').DataTable({
    /*"language": {
        "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
        },*/
    dom: 'fpBirtp',
    buttons:['copy', 'excel', 'pdf'],
    "lengthMenu":[25, 50, 75, 100, "All"],
    responsive: false,
    orderCellsTop: true,
    "pageLength": 25,
    keepConditions: true
});
// variable id #tableOne must match table id in html
var tableThree = $('#tableThree').DataTable({
    /*"language": {
        "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
        },*/
    dom: 'fpBirtp',
    buttons:['copy', 'excel', 'pdf'],
    "lengthMenu":[25, 50, 75, 100, "All"],
    responsive: false,
    orderCellsTop: true,
    "pageLength": 25,
    keepConditions: true
});