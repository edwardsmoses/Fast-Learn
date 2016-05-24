$(function () {

    var links = $('.sidebar-links > a');

    links.on('click', function () {

        links.removeClass('selected');
        $(this).addClass('selected');

    })

    $("#menu-toogle").click(function () {
        $("#lsidebar").toggleClass("toggled1");
        $("#maincontent").toggleClass("toggled2");
        $("#menu-toogle").toggleClass("toggled4");
    });

    window.setTimeout(function () {
        $(".alertdiv").fadeTo(500, 0).slideUp(500, function () {
            $(this).remove();
        });
    }, 3000);
});

