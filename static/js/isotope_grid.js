// show button group container
$('.button-group').css({'display':'block'});
$('.grid-dl').css({'height':'auto'});
// isotope-masonry grid: rdf data
var $grid = $('.grid');
$('ul.nav-tabs.a').each(function () {
    // init Isotope
    var $this = $(this);
    $this.on('shown.bs.tab', function () {
        $container.imagesLoaded(function () {
            $grid.isotope({
                itemSelector: '.grid-item',
                percentPosition: true,
                masonry: {
                    // use element for option
                    columnWidth: '.grid-sizer'
                }
            });
        });
    });
});
// filter functions
// bind filter button click
$('.filter-button-group').on('click', 'button', function () {
    var filterValue = $(this).attr('data-filter');
    $grid.isotope({
        filter: filterValue
    });
    $grid.isotope('layout');
});
// change is-checked class on buttons
$('.button-group').each(function (i, buttonGroup) {
    var $buttonGroup = $(buttonGroup);
    $buttonGroup.on('click', 'button', function () {
        $buttonGroup.find('.is-checked').removeClass('is-checked');
        $(this).addClass('is-checked');
    });
});