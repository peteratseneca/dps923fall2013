//
//  Client907.m
//  Graded Work
//
//  Created by Peter McIntyre on 2013-11-17.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import "Client907.h"
#import "AFJSONRequestOperation.h"

#define BaseURL @"http://dps907fall2013.azurewebsites.net/api/"

@implementation Client907

// Initialize
// The dispatch_once function will ensure that the singleton pattern is followed
+ (id)sharedClient
{
    static Client907 *__sharedInstance = nil;
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
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    return self;
}

@end
