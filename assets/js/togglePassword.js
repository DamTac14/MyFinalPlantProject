$(document).ready(function() {
    console.log("togglePassword.js loaded");

    function toggleVisibility(input, icon) {
        if ($(input).attr('type') === 'password') {
            $(input).attr('type', 'text');
            $(icon).removeClass('fa-eye').addClass('fa-eye-slash');
        } else {
            $(input).attr('type', 'password');
            $(icon).removeClass('fa-eye-slash').addClass('fa-eye');
        }
    }

    // Gestion pour le formulaire d'inscription
    $('#togglePasswordRegister').on('click', function() {
        toggleVisibility('#registration_form_plainPassword_first', '#togglePasswordRegister i');
    });

    $('#togglePasswordConfirmationRegister').on('click', function() {
        toggleVisibility('#registration_form_plainPassword_second', '#togglePasswordConfirmationRegister i');
    });

    // Gestion pour le formulaire de connexion
    $('#togglePasswordLogin').on('click', function() {
        toggleVisibility('#passwordLogin', '#togglePasswordLogin i');
    });
});
