//
//  Model.m
//  Table Multi
//
//  Created by Peter McIntyre on 2012/06/14.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"

@implementation Model

- (id)init
{
    self = [super init];
    if (self) {
        _colorNames = [NSArray arrayWithObjects:@"Red", @"Green", @"Blue", @"Yellow", @"Orange", @"Brown", @"Purple", @"Gray", nil];
    }
    return self;
}

@end
