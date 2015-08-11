var http = require('http');
var bl   = require('bl');
var net  = require('net');
var fs   = require('fs');
var map  = require('through2-map');
var url  = require('url');

/* Client *************************************************************************************** */

/**
 * Events
 */
http.get(url, function(response) {
    // the response object is a Node Stream object
    // you can treat Node Streams as objects that emit events
    // the three events that are of most interest are: "data", "error" and "end"
    response.on('data', function(data) {
        console.log(data.toString());
    });
    // if: response.setEncoding('utf8'); "data" buffers are converted to string
    // response.on('data', console.log);
    // response.on('error', console.error);
});




/**
 * Collect Stream
 */
http.get(url, function(response) {
    // to collect all data, not just the first data event
    // bl third-party package to collect from streams
    // another alternative is concat-stream
    response.pipe(
        bl(function(err, data) {
            if (err) { return console.error(err); }

            // data is a Buffer object, convert
            console.log(data.toString());
        })
    );
});








/* Server *************************************************************************************** */

/**
 * Check Method
 */
var server = http.createServer(function(request, response) {
    if (request.method != 'POST') {
        return response.end('Required POST\n');
    }

    // server logic
});




/**
 * TCP Server
 */
// net module for TCP server
var server = net.createServer(function(socket) {
    // socket contains meta-data regarding the connection
    // is also a Node duplex Stream (can be read and written)
    // socket handling logic
    socket.write(data + '\n');
    socket.end();
    // or "socket.end(data)" writes and ends
});
// start listening
server.listen(Number(port));




/**
 * HTTP File Server
 */
var server = http.createServer(function(request, response) {
    // request contains properties such as the header and query string
    // response is for sending data to the client, both headers and body
    // both request and response are Node streams

    // good practice
    response.writeHead(200, { 'content-type': 'text/plain' });

    // fs module to stream files
    fileStream = fs.createReadStream(file);
    fileStream.pipe(response);
    // OR
    fs.createReadStream(file).pipe(response);
});
// start listening
server.listen(Number(port));




/**
 * HTTP Transform Stream Server
 */
// through2-map third-party package to transform stream data
var server = http.createServer(function(request, response) {
    // Example transform content to uppercase
    request.pipe(
        map(function(chunk) {
            return chunk.toString().toUpperCase();
        })
    ).pipe(response);
});
// start listening
server.listen(Number(port));




/**
 * HTTP Json Api Server
 */
var server = http.createServer(function(request, response) {
    // url module to parse request property
    // check on terminal: $ node -pe "require('url').parse('/test?q=1', true)"
    var parsedUrl = url.parse(request.url, true);
    var result;

    // two valid paths: /api/foo and /api/bar
    if (/^\/api\/foo/.test(request.url)) {
        result = { /* */ };
    } else if (/^\/api\/bar/.test(request.url)) {
        result = { /* */ };
    }

    if (result) {
        // OK
        // good practice
        response.writeHead(200, { 'content-type': 'application/json' });
        response.end(JSON.stringify(result));
    } else {
        // KO
        response.writeHead(404);
        response.end();
    }
});
// start listening
server.listen(port);