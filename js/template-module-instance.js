/**
 * JavaScript instance module template
 * @author    Albert Hilazo
 * @version   1.0.0
 *
 * @requires  jquery-1.6+
 *
 * @link      https://github.com/albhilazo
 *
 *
 * Usage:
 *     var module1 = new Module();
 *     module1.init({ optionFoo: 'bar' });
 *     var module2 = new Module();
 *     module2.init({ optionFoo: 'baz' });
 *
 * Methods:
 *     publicMethod()
 */


var Module = function() {

    // Avoid scope issues
    var self = this;

    /** Default settings */
    var _settings = {
        optionFoo: 'default value'
    };




    /**
     * Description
     * @param {Type} name - Description
     */
    var _privateMethod = function() {
        console.log('privateMethod');
    };




    /**
     * Description
     * @param {Type} name - Description
     */
    self.publicMethod = function() {
        console.log('publicMethod');
    };




    /**
     * Initializer
     * @param {Object} options - Specified options that will overwrite the default settings.
     */
    self.init = function(options) {
        // Overwrite defaults
        _settings = $.extend(_settings, options);

        // Call private method
        _privateMethod();
        // Call public method
        self.publicMethod();
    };


    // Optional auto-init (only declaration is needed)
    // self.init();

};
