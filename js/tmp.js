/* Go-top button */
/* HTML
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


/* Check all checkboxes on click */
/* HTML
<label id="showall">Show:</label>
<input type="checkbox" name="showfoo" value="checked" />
<input type="checkbox" name="showbar" value="checked" />
<input type="checkbox" name="showbaz" value="checked" />
*/

$("#showall").click(function() {
    var chk = $("input[name^='show']");
    if ( chk.filter(":checked").length != chk.length ) {
        // Check all if any unchecked
        chk.prop('checked', true);
    } else {
        // Uncheck all if all checked
        chk.prop('checked', false);
    }
});