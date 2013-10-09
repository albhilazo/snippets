/* Go-top button */

/** HTML **
<a id="goTop" class="img-circle">
    <i class="top-icon icon-chevron-up icon-white"></i>
</a>
*/

$(window).scroll(function() {
    // Set offset inside scroll function in case it changes
    // due to other dynamic elements
    var offset = $("#table-events").offset().top;

    if ($(window).scrollTop() >= offset) {
        $("#goTop").fadeIn();
    } else {
        $("#goTop").fadeOut();
    }
});




$("#goTop").click(function() {
    $('body,html').animate({
        scrollTop: 0
    }, 400);
});