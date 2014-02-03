/* Animate to a specific point in the DOM */

/** HTML **
<ul class="nav nav-pills nav-stacked">
    <li class="active"><a href="#sitname">Sitname</a></li>
    <li><a href="#sitname2">Sitname2</a></li>
</ul>
*/

/* Nav click handler */
$('ul.nav>li>a').click(function(e) {
    e.preventDefault();

    $('body,html').animate({
        scrollTop: $($(e.target).attr('href')).offset().top
    }, 400);
});