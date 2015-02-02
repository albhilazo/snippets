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

    // Private
    var _privateVar = 'foo';

    // Public
    self.publicVar = 'bar';


    /** Default settings */
    var _settings = {
        optionFoo: 'default value'
    };




    /* Private methods **************************************************************** */

    /**
     * Description
     * @param {Type} name - Description
     */
    var _privateMethod = function() {
        console.log('privateMethod: '+_privateVar+self.publicVar);
    };




    /* Public methods ***************************************************************** */

    /**
     * Description
     * @param {Type} name - Description
     */
    self.publicMethod = function() {
        console.log('publicMethod: '+_privateVar+self.publicVar);
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
