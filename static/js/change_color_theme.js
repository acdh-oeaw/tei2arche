// Bootstrap CDN links retrieved from: https://www.bootstrapcdn.com/bootswatch/

var themes = {
    "default": "",
    "simplex": "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/simplex/bootstrap.min.css",
    "slate": "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/slate/bootstrap.min.css",
    "lux": "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css",
    "solar": "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/solar/bootstrap.min.css",
    "yeti": "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/yeti/bootstrap.min.css",
    "pulse": "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/pulse/bootstrap.min.css",
    "minty": "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css",
    "flaty": "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/flatly/bootstrap.min.css",
    "journal": "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/journal/bootstrap.min.css"
}

var themesheet = $('<link href="'+themes['simplex']+'" rel="stylesheet"/>');
//themesheet.appendTo('head');

$(function () {
    $('.theme-link').click(function () {
        var themeurl = themes[$(this).attr('data-theme')];
        themesheet.attr('href', themeurl);
        themesheet.appendTo('head');
    });
});