/**
 * JavaScript jQuery plugin template
 * @author    Albert Hilazo
 * @version   1.0.0
 *
 * @requires  jquery-1.6+
 *
 * @link      https://github.com/albhilazo
 *
 *
 * Usage:
 *     $objChained.albhilazo_plugin({ optionFoo: 'bar' });
 *   or
 *     $.fn.albhilazo.plugin($objChained, { optionFoo: 'bar' });
 */


;(function($){

    // Check namespace
    if (!$.fn.albhilazo) {
        $.fn.albhilazo = {};
    }




    /**
     * @param {Object} objChained - Original jQuery object chained to the plugin.
     * @param {Object} options - Specified options that will overwrite the default settings.
     */
    $.fn.albhilazo.plugin = function(objChained, options) {

        // Avoid scope issues
        var self = this;

        /** Default settings */
        self.settings = $.extend({
            optionFoo: 'default value'
        }, options);




        /**
         * Description
         * @param {Type} name - Description
         */
        self.internalMethod = function() {
            console.log('Internal method');
        };




        /**
         * Initializer.
         */
        self.init = function() {
            console.log('Init plugin');
            self.internalMethod();
        };


        // Initialize
        self.init();

    };




    /**
     * Redirects to {@link $.fn.albhilazo.plugin} adding the chained object as a parameter.
     * @param {Object} options - Specified options that will overwrite the default settings.
     */
    $.fn.albhilazo_plugin = function(options) {
        return this.each(function() {
            (new $.fn.albhilazo.plugin(this, options));
        });
    };

}(jQuery));
