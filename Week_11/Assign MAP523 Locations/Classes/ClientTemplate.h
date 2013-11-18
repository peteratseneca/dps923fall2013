//
//  ClientTemplate.h
//  Classes
//
//  Created by Peter McIntyre on 2013-11-07.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import "AFHTTPClient.h"

@interface ClientTemplate : AFHTTPClient

+ (id)sharedClient;

@end
