//
//  Client500.h
//  Locations
//
//  Created by Peter McIntyre on 2013-11-18.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import "AFHTTPClient.h"

// AFHTTPClient that works with this web service:
// wsa500fall2013.azurewebsites.net

@interface Client500 : AFHTTPClient

+ (id)sharedClient;

@end
