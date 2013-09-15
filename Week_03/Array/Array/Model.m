//
//  Model.m
//  Array
//
//  Created by Peter McIntyre on 2012/06/06.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"

@implementation Model

- (id)init
{
    self = [super init];
    if (self) {
        // Create a static (non-changing) array...
        
        // Inside an initializer, use the property's auto-generated
        // instance variable as the target
        // In other words, do NOT use 'self.courses'

        // We will use the "new" (in 2012) way to literally initialize an array
        _courses = @[@"BTP100", @"BTB110", @"BTO120", @"BTO130", @"BTC140"];
        
        // Documentation is here; open the page then search/find "literal"
        // https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/FoundationTypesandCollections/FoundationTypesandCollections.html
        
        // The "original" way to initialize an array was to use NSArray-alloc-init
        // Here's how that looks...
        //_courses = [[NSArray alloc] initWithObjects:@"BTP100", @"BTB110", @"BTO120", @"BTO130", @"BTC140", nil];
        
    }
    return self;
}

@end
