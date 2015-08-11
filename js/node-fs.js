var fs   = require('fs');
var path = require('path');

/* Read File ************************************************************************************ */

/**
 * Sync
 */
// Buffer objects are arbitrary arrays of data,
//   whether it be ascii, binary or other format
// Buffer objects can be converted to strings
var fileBuffer  = fs.readFileSync(filePath);
var fileContent = fileBuffer.toString();
// OR
var fileContent = fs.readFileSync(filePath, 'utf8');




/**
 * Async
 */
var fileContent;
fs.readFile(filePath, function(err, buffer) {
	if (err) { return console.error(err); }

    fileContent = buffer.toString();
    // it's sync if the output is outside the callback
    console.log(fileContent);
});
// OR
fs.readFile(filePath, 'utf8', function(err, string) {});








/* Read Directory ******************************************************************************* */

fs.readdir(dirPath, function(err, list) {
	if (err) { return console.error(err); }
	
    list.forEach(function(file, i) {
    	// file === string
    });
});








/* Path Module ********************************************************************************** */

var fileExtension = path.extname(fileNameOrPath)