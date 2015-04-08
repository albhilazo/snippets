/* Prototypal inheritance *********************************************************************** */

var parentObject = {
    settings: {
        option: 'foo'
    },
    _build: function() {
        // DOM initial structure
        // this.$elem.html('<h1>'+this.settings.option+'</h1>');
    },
    publicMethod: function( msg ) {
        // console.log('publicMethod');
        // this.$elem.append('<p>'+msg+'</p>');
    },
    init: function( options, elem ) {
        // Overwrite defaults
        this.settings = $.extend({}, this.settings, options);

        // Element references
        this.elem  = elem;
        this.$elem = $(elem);

        // Build DOM
        this._build();

        // Allow chaining
        return this;
    }
};

// Object.create support test, and fallback for browsers without it
if ( typeof Object.create !== "function" ) {
    Object.create = function (o) {
        function F() {}
        F.prototype = o;
        return new F();
    };
}

// Create a plugin based on a defined parent object
$.pluginMaker = function( name, parent ) {
    $.fn[name] = function( options ) {
        return this.each(function() {
            if ( ! $.data( this, name ) ) {
                $.data( this, name, Object.create(parent)
                                          .init(options, this) );
            }
        });
    };
};

//$.pluginMaker('myobj', parentObject);

// $('#elem').myobj({option: 'value'});
// var instance = $('#elem').data('myobj');
// instance.publicMethod('publicMethod parameter');