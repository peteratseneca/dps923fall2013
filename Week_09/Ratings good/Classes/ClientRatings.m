//
//  ClientRatings.m
//  Ratings good
//
//  Created by Peter McIntyre on 2013-11-07.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import "ClientRatings.h"
#import "AFJSONRequestOperation.h"

#define BaseURL @"http://matrix.senecac.on.ca/~peter.mcintyre/"

@implementation ClientRatings

// Initialize
// The dispatch_once function will ensure that the singleton pattern is followed
+ (ClientRatings *)sharedClient
{
    static ClientRatings *__sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:BaseURL]];
    });
    
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self)
    {
        // Configuration
        // e.g. can also set token header, and other settings
        
        // Sigh - unable to make this work the way I expect
        //[self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    return self;
}

@end
