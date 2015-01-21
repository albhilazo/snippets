/* Identify mouse button ************************************************************************ */

/**
 * Detect right mouse button
 */
$(document).on('contextmenu', '#specific-element', function(e){
    alert('Right click detected')
    return false;
});




/**
 * Detect any mouse button
 * @see {@link http://api.jquery.com/event.which/}
 */
$('#element').mousedown(function(e){
    switch (e.which) {
        case 1:
            alert('Left click detected');
            break;
        case 2:
            alert('Middle click detected');
            break;
        case 3:
            alert('Right click detected');
            break;
        default:
            alert('Moar buttons!');
    }
});








/* Detect click outside an element ************************************************************** */

/**
 * One click event
 * @see {@link http://stackoverflow.com/a/7385673/2629765}
 */
$(document).mouseup(function(e) {
    var container = $('#element-container');

    if (!container.is(e.target)                    // if the target of the click isn't the container
        && container.has(e.target).length === 0) { // ... nor a descendant of the container
        // container.hide(); or whatever
    }
});




/**
 * Two click events
 * @see {@link http://stackoverflow.com/a/153047/2629765}
 */
$('html').click(function() {
    // Hide the element or whatever
});

$('#element-container').click(function(e) {
    // May break buttons and links, see source
    e.stopPropagation();
});




/**
 * Specific for Bootstrap Popover (see source link for other variants)
 * @see {@link http://stackoverflow.com/a/14857326/2629765}
 */
$('html').on('click', function(e) {
    $('[data-toggle="popover"]').each(function () {
        // the 'is' for buttons that trigger popups
        // the 'has' for icons within a button that triggers a popup
        if (!$(this).is(e.target)
            && $(this).has(e.target).length === 0
            && $('.popover').has(e.target).length === 0) {
            $(this).popover('hide');
        }
    });
});