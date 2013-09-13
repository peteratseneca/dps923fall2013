//
//  Model.m
//  Dictionary
//
//  Created by Peter McIntyre on 2012/06/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"

@implementation Model

// Create one or more "initializers"
// Note the coding pattern - it is a best practice

- (id)init
{
    self = [super init];
    if (self) {
        
        // Create the model's initial data 
        // Note that you must use the declared property's instance variable name in initializers
        _me = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Firstname", @"firstName", @"Lastname", @"lastName", [NSNumber numberWithInt:20], @"age", @"CPA", @"program", nil];
    }
    return self;
}

@end
