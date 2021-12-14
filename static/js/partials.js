export function createSpinner(html_id) {
    var create_spinner =    `<div id="loader_wrapper" class="text-center"> 
                                <div class="spinner-border active" role="status" 
                                    id="xyz_spinner" style="width: 5rem; height: 5rem;"
                                </div>
                            </div>`;        
    $('#' + html_id).prepend(create_spinner);
};

export function buildDataTable(html_id, pageLength) {
    if (document.getElementById( html_id + "_wrapper") === null) {
        // Transform table to DataTable
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
};