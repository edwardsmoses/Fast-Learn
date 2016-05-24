
$(function () {
    var childboxs = $('.childbox');
    childboxs.on('click', function () {
        childboxs.removeClass('childboxselected');
        $(this).addClass('childboxselected');
    });
});