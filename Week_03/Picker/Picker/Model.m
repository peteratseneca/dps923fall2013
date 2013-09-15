//
//  Model.m
//  Picker Multi
//
//  Created by Peter McIntyre on 2012/06/13.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"

@implementation Model

// Initialize the model object
- (id)init
{
    self = [super init];
    if (self) {
        // Add simple strings to the array declared property
        _cities = @[@"Alliston", @"Barrie", @"Cambridge", @"Dundas", @"Elliot Lake", @"Fenelon Falls", @"Grimsby", @"Hamilton", @"Innisfil", @"Jackson's Point", @"Kingston", @"London", @"Markham"];
        
        // Older syntax
//        _cities = [NSArray arrayWithObjects:@"Alliston", @"Barrie", @"Cambridge", @"Dundas", @"Elliot Lake", @"Fenelon Falls", @"Grimsby", @"Hamilton", @"Innisfil", @"Jackson's Point", @"Kingston", @"London", @"Markham", nil];

    }
    return self;
}

@end
