// Disable by default, then enable where needed
Turbo.session.drive = false;

jQuery(function() {
    jQuery(document).on('turbo:frame-render', function(e) {
        // Refresh any dropdowns after they are loaded by turbo
        jQuery('.selectpicker').selectpicker('refresh');
    });
});
