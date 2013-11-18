//
//  Client907.h
//  Graded Work
//
//  Created by Peter McIntyre on 2013-11-17.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import "AFHTTPClient.h"

// AFHTTPClient that works with this web service:
// dps907fall2013.azurewebsites.net

@interface Client907 : AFHTTPClient

+ (id)sharedClient;

@end
