$('#ajax_request').on('click', function archeLoader() {
    var delayInMilliseconds = 2000;
    // CSS tansformations to show loader and hide content
    if ($('leaflet-map-one') !== null) {
        $("leaflet-map-one").css("display","none");
    }
    //var navLinks = document.getElementsByClassName("nav-link");
    $("#about").removeClass("active").addClass("fade");
    $("#transform").removeClass("active").addClass("fade");
    $("#home").removeClass("active").addClass("fade");
    $("#edition").removeClass("fade").addClass("active");
    $(".nav-link").removeClass("active show");
    setTimeout(function() {
        $("#progressBar").css({"width": "15%", "aria-valuenow": "15" });
        $("#progressBar").css({"width": "50%", "aria-valuenow": "50" });
        setTimeout(function() {
            $("#progressBar").css({"width": "100%", "aria-valuenow": "100" });
            //your code to be executed after 1,5 second
            // Hide loader animation and show content
            $("#loader_combo_wrapper").addClass("fade");            
            $("#loaderEnd").removeClass("fade").addClass("active");
            $("#loader_combo_wrapper").remove();     
        }, delayInMilliseconds);
    }, delayInMilliseconds);
})