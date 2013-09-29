//
//  Model.m
//  Nav Colors
//
//  Created by Peter McIntyre on 2012/01/31.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"

@implementation Model

- (id)init
{
    if (self = [super init]) {
        
        // Fetch from the app bundle... load the NSDictionary
        _colorDict = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"ColorsDict" withExtension:@"plist"]];

        // For convenience, create an array with just the color names
        _colorNames = [self.colorDict allKeys];
    }
    return self;
}

@end
