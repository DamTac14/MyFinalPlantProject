$(document).ready(function() {
    function fetchData() {
        $.ajax({
            url: '/api/data?' + new Date().getTime(), 
            method: 'GET',
            dataType: 'json',
            success: function(data) {

                const $container = $('#data-container');

                $container.empty();

                $.each(data, function(index, item) {
                    const $section = $('<section>').addClass('data-section');
                    $section.html(`
                        <h2 class="data-region">Région: ${item.région}</h2>
                        <p class="data-types"><strong>Types de Plantes:</strong> ${item.types_plantes.join(', ')}</p>
                        <p class="data-temperature"><strong>Température:</strong> ${item.température}</p>
                    `);
                    $container.append($section);
                });
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error fetching data:', textStatus, errorThrown);
            }
        });
    }

    fetchData();

});
