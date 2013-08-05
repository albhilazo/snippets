/* Go-top button */
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