/* Read $_GET variable from JS
 * @see http://www.onlineaspect.com/2009/06/10/reading-get-variables-with-javascript
 */

function $_GET(q,s) {
    s = s ? s : window.location.search;
    var re = new RegExp('&'+q+'(?:=([^&]*))?(?=&|$)','i');
    return (s=s.replace(/^?/,'&').match(re)) ? (typeof s[1] == 'undefined' ? '' : decodeURIComponent(s[1])) : undefined;
}

// Simple usage
var var1 = $_GET('var1');

/* Get the src parameter and split it down to the search query string
 * Makes it easy to parse GET variables from arbitrary search strings (ex “?var1=hello&var2=world”)
 * This is handy if you need to access GET variables from an HTML src parameter such as an image or script tag */
var src = document.getElementById('example').src;
params = src.split('?');
var var1 = $_GET('var1','?'+params[1]);