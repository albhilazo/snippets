/********************************************************************
 *  @author     Albert Hilazo                                       *
 *  @version    1.0.0                                               *
 *                                                                  *
 *  Required files:                                                 *
 *      jquery-1.10.2.min.js                                        *
 *                                                                  *
 *  Procedures:                                                     *
 *      privateFunction()                                           *
 *      init()                                                      *
 ********************************************************************/


var albhilazo = {};

albhilazo.foo = (function(){

    // Collection of injected HTML
    var html = {
        'div-question': "<div> \
                             What is the answer to life, the universe and everything? \
                         </div>"
    }

    // Collection of strings
    var strings = {
        'life-answer': "The answer is 42"
    }

    // Other variables
    var privateVar;








    /*
     * Function: privateFunction
     * Purpose:  -
     * Requires: -
     * Inputs:   -
     * Returns:  -
     */
    function privateFunction() {

    }








    /* ****************************************************************************************** *
     * Initializations                                                                            *
     * ****************************************************************************************** */

    /*
     * Function: init
     * Purpose:  Sets the initial state
     * Requires: -
     * Inputs:   -
     * Returns:  -
     */
    function init() {
        
    }




    return {
        'bar': init
    };

}());


/* If using jQuery with noconflict:
 *   var foo = (function($){
 *   }(jQuery));
 */


albhilazo.foo.bar();