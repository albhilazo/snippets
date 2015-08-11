/* Custom Modules ******************************************************************************* */

/**
 * my_module.js
 */
module.exports = function(params, callback) {

	// example callback for the cascading errors
	foo(function(err, data) {
		// check for errors and do early-returns within callback
		if (err) { return callback(err); }

		// all went well, call callback with 'null' for the error argument
		callback(null, data);
	});

};




/**
 * Caller
 */
var MyModule = require('./my_module');
MyModule(params, function(err, data) {
	if (err) { return console.error('There was an error:', err); }
	// do something with data
});