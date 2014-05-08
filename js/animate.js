/* Animate to a specific point in the DOM *********************************************************/

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








/* Go-top button **********************************************************************************/
/** HTML **
<a id="goTop">
    <i class="top-icon icon-chevron-up icon-white"></i>
</a>
*/

/** CSS **
#goTop {
    display: none;
    background: #addfee;
    position: fixed;
    right: 20px;
    bottom: 20px;
    z-index: 99;

    -webkit-border-radius: 500px;
       -moz-border-radius: 500px;
            border-radius: 500px;
    }
#goTop:hover { background: #2f96b4; }

// For bootstrap glyphicons
.top-icon {
    width: 21px;
    height: 21px;
    margin: 6px;
    background-size: 703.5px 238.5px;
    background-position: -432px -181px;
    }
*/

$(window).scroll(function() {
    if($('.goTop-point').length) {
        var offset = $('.goTop-point').offset().top;

        if ($(window).scrollTop() >= offset) {
            $('#goTop').fadeIn();
        } else {
            $('#goTop').fadeOut();
        }
    }
});

$("#goTop").click(function() {
    $('body,html').animate({
        scrollTop: 0
    }, 400);
});