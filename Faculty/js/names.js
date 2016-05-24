$(function () {

    var links = $('.names');

    links.on('click', function () {

        links.removeClass('selected');
        $(this).addClass('selected');

    })

});