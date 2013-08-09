/* Check all checkboxes on click */

/** HTML **
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