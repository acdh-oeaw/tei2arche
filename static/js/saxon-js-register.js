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
    $(".table-responsive").remove();
    if ($(`#${element}`).length == 0) {
        var create_spinner =    `<div id="loader_wrapper" class="text-center">
                                        <div class="spinner-border active" role="status"
                                            id="xyz_spinner" style="width: 5rem; height: 5rem;"
                                        </div>
                                    </div>`;
        $('#single-wrapper').prepend(create_spinner);
        SaxonJS.transform({
            stylesheetLocation: `https://tei4arche.acdh-dev.oeaw.ac.at/xsl/template_imports_sef_json/${xslt}.sef.json`,
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