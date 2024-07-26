$(document).ready(function() {
    $('form[data-confirm]').on('submit', function(event) {
        var message = $(this).data('confirm');
        if (!confirm(message)) {
            event.preventDefault(); 
        }
    });
});
