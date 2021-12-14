$(document).ready(function() {
    //declaring variables for loader animation
    var loader = document.getElementById("loaderHome");
    var loaderEnd = document.getElementById("loaderHomeEnd");            
    // DataTables:
    $(document).ready(function () {
        $('#tableOne').DataTable();
    });
    // variable id #tableOne must match table id in html
    var tableOne = $('#tableOne').DataTable({
        /*"language": {
            "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
        },*/
        dom: 'fpBirtp',
        buttons:['copy', 'excel', 'pdf'],
        "lengthMenu":[25, 50, 75, 100, "All"],
        //responsive: true,
        orderCellsTop: true,
        "pageLength": 50,
        keepConditions: true
    });
    //loader.classList.add('fade');
    loader.remove();
    loaderEnd.classList.remove('fade');               
    loaderEnd.classList.add('active');
});