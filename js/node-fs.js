var fs   = require('fs');
var path = require('path');

/* Read File ************************************************************************************ */

/**
 * Sync
 */
var fileBuffer  = fs.readFileSync(filePath);
var fileContent = fileBuffer.toString();
// OR
var fileContent = fs.readFileSync(filePath, 'utf8');




/**
 * Async
 */
var fileContent;
fs.readFile(filePath, function(err, buffer) {
    fileContent = buffer.toString();
    // it's sync if the output is outside the callback
    console.log(fileContent);
});
// OR
fs.readFile(filePath, 'utf8', function(err, string) {});








/* Read Directory ******************************************************************************* */

fs.readdir(dirPath, function(err, list) {
    list.forEach(function(file, i) {
    	// file == string
    });
});








/* Path Module ********************************************************************************** */

var fileExtension = path.extname(fileNameOrPath)