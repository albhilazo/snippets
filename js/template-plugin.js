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
 *
 * Methods:
 *     $objChained.albhilazo_plugin('publicMethod');
 *   or
 *     $.fn.albhilazo.plugin($objChained).publicMethod();
 */


;(function($) {
    "use strict";

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

        // Public
        self.NAME = 'albhilazo.plugin';
        self.settings = {};

        // Private
        var data = $(objChained).data(self.NAME);


        /** Default settings */
        var _defaults = {
            optionFoo: 'default value',
            debug: false
        };




        /* Private methods ************************************************************ */

        /**
         * Outputs a console message only if settings.debug is enabled.
         * @param {String} msj - Message to output.
         * @param {Boolean} isError - Optional, defaults to FALSE. If TRUE outputs as error.
         */
        var _debug = function(msj, isError) {
            if (self.settings.debug) {
                if (typeof isError !== 'boolean') { isError = false; }

                if (isError) { console.error(msj); }
                else         { console.log(msj); }
            }
        };




        /**
         * Description
         * @param {Type} name - Description
         */
        var _privateMethod = function() {
            console.log('Private method');
        };




        /* Public methods ************************************************************* */

        /**
         * Description
         * @param {Type} name - Description
         */
        self.publicMethod = function() {
            console.log('Public method');
        };




        /**
         * Initializer.
         */
        self.init = function() {
            // Set settings
            self.settings = $.extend({}, _defaults, options);

            console.log('Init plugin');
            _privateMethod();
        };


        if (data == undefined) {
            self.init();    // Initialize
        } else {
            return data;    // Instance data
        }

    };




    /**
     * Redirects to {@link $.fn.albhilazo.plugin} adding the chained object as a parameter.
     * @param {Object} options - Specified options that will overwrite the default settings.
     */
    $.fn.albhilazo_plugin = function(options) {
        return this.each(function() {
            var data = $(this).data('albhilazo.plugin');
            if (data == undefined) {
                // Set instance data
                $(this).data('albhilazo.plugin', (new $.fn.albhilazo.plugin(this, options)));
            }
            if (typeof options == 'string') {
                // Manage methods
                if (data[options]) {
                    data[options]();
                } else {
                    console.error('ERROR (albhilazo.plugin): "'+options+'" is not a supported method.');
                }
            }
        });
    };

}(jQuery));
