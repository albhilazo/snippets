/* Usage **************************************************************************************** */

// Controller protocol
<HTTPResponseDelegate>

// Interface variable
HTTPResponse *connection;

// viewDidLoad
connection = [[HTTPResponse alloc] init];
connection.delegate = self;

// Perform HTTP request
NSString *request = [NSString stringWithFormat:@"url?param=%@", paramVar, nil];
[connection performHTTPRequest:request];


/**
 * Called when the request is answered
 */
- (void)didGetResponseWithData:(NSDictionary *)dictonary
{
    // dictionary contains the parsed response
    NSArray *results = [dictonary objectForKey:@"list"];
    for (NSDictionary *result in results) {
        // [array addObject:];
    }
}




/* HTTPResponse.h ******************************************************************************* */

#import <Foundation/Foundation.h>

@class HTTPResponse;
@protocol HTTPResponseDelegate <NSObject>
- (void)didGetResponseWithData:(NSDictionary *) dictonary;
@end


@interface HTTPResponse : NSObject <NSURLConnectionDelegate>
@property (nonatomic, weak) id<HTTPResponseDelegate> delegate;
- (void)performHTTPRequest:(NSString *)url;
@end




/* HTTPResponse.m ******************************************************************************* */

#import "HTTPResponse.h"

@interface HTTPResponse() {
    NSMutableData *incoming;
    NSURLConnection *connection;
    NSDictionary *ressult;
}
@end

@implementation HTTPResponse

- (void)performHTTPRequest:(NSString *)url {
    incoming = [[NSMutableData alloc] init];
    NSLog(@"performHTTPRequest with = %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response {
    [incoming setLength:0];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"fail: %@", error);
}

- (void)connection:(NSURLConnection *) connection didReceiveData:(NSData *)data {
    [incoming appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSError *myError = nil;
    ressult = [NSJSONSerialization JSONObjectWithData:incoming options:NSJSONReadingMutableLeaves error:&myError];
    [self.delegate didGetResponseWithData:ressult];
}

@end