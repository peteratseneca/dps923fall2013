//
//  Model.m
//  Array To Do
//
//  Created by Peter McIntyre on 2012/06/07.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"

@implementation Model

- (id)init
{
    self = [super init];
    if (self) {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
