//
//  Model.m
//  Picker Multi
//
//  Created by Peter McIntyre on 2012/06/13.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"

@implementation Model

- (id)init
{
    self = [super init];
    if (self) {
        
        // Size choices
        _pizzasize = @[@"Small", @"Medium", @"Large"];
        
        // Kind choices
        _kind = @[@"Cheese", @"Veggie", @"Meat", @"BBQ", @"Deluxe", @"Hawaiian", @"Mushroom"];
        
        // Service choices
        _where = @[@"Eat in", @"Take out", @"Delivery"];
        
        // Assemble them into an enclosing array
        _allItems = @[_pizzasize, _kind, _where];
    }
    return self;
}

@end
