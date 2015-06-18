//
//  MGConnection.m
//  ArtConsultant
//
//  Created by Matthew Gardner on 7/29/14.
//  Copyright (c) 2014 mgkb. All rights reserved.
//

#import "MGConnection.h"

static NSMutableArray *sharedConnectionList = nil;

@implementation MGConnection
@synthesize request, completionBlock;

- (id)initWithRequest:(NSURLRequest *)req
{
    self = [super init];
    if(self) {
        [self setRequest:req];
    }
    return self;
}


- (void)start
{
    NSLog(@"MGConnection::start(), request: %@ %@", request.HTTPMethod, request.URL.absoluteString);
    NSLog(@"MGConnection::start(), requestData: \n%@", [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);
	
    responseDATA = [[NSMutableData alloc] init];
    
    internalConnection = [[NSURLConnection alloc] initWithRequest:[self request]
                                                         delegate:self
                                                 startImmediately:YES];
    
    if(!sharedConnectionList)
        sharedConnectionList = [[NSMutableArray alloc] init];
    [sharedConnectionList addObject:self];
}

- (void)startSync {
	NSLog(@"MGConnection::startSynchronously(), request: %@ %@", request.HTTPMethod, request.URL.absoluteString);
	NSLog(@"MGConnection::startSynchronously(), requestData: \n%@", [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);
	
	NSError *error = nil;
	syncResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
	id d = nil;
	
	if (syncResponseData) {
		if (self.notJson) {
			d = syncResponseData;
		} else {
			d = [NSJSONSerialization JSONObjectWithData:syncResponseData
												options:0
												  error:nil];
		}
	}
	
	NSLog(@"RiverConnection::startSynchronously() - Response \n%@", d);
	
	if([self completionBlock])
	{
		[self completionBlock](d, error);
	}
}

#pragma mark - Connection delegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseDATA appendData:data];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	id jsonObject = nil;
	
	if (responseDATA) {
		if (self.notJson) {
			jsonObject = responseDATA;
		} else {
			jsonObject = [NSJSONSerialization JSONObjectWithData:responseDATA
														 options:0
														   error:nil];
		}
	}
	NSLog(@"MGConnection::finishedLoading() - Response:\n%@", jsonObject);
	
    if([self completionBlock])
	{
		[self completionBlock](jsonObject, nil);
	}
	
    [sharedConnectionList removeObject:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	NSLog(@"MGConnection - Received authentication challenge. You should include Auth in the request.");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if([self completionBlock])
        [self completionBlock](nil, error);
    
    [sharedConnectionList removeObject:self];
}


@end
