$(document).ready(function () {
    const $searchInput = $('#searchName');
    const $clearButton = $('#clearButton'); 
    const $plantItems = $('.plant-item');

    function filterPlants() {
        const nameFilter = $searchInput.val().toLowerCase();

        $plantItems.each(function() {
            const name = $(this).data('name').toLowerCase();

            if (name.includes(nameFilter)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }

    $searchInput.on('input', filterPlants);

    $clearButton.on('click', function () {
        $searchInput.val(''); 
        filterPlants(); 
    });
});
