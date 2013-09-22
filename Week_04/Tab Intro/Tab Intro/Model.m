//
//  Model.m
//  Tab Intro
//
//  Created by Peter McIntyre on 2012/06/18.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"

@implementation Model

- (id)init
{
    self = [super init];
    if (self) {
        _data1 = @"First";
        _data2 = @"Second";
    }
    return self;
}

@end
