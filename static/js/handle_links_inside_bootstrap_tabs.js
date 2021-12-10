$(document).ready(function () {
    function onHashChange() {
        var hash = window.location.hash;
        
        if (hash) {
            // using ES6 template string syntax
            $(`[data - toggle = "tab"][href = "${hash}"] `).trigger('click');
        }
    }
    
    window.addEventListener('hashchange', onHashChange, false);
    onHashChange();
});