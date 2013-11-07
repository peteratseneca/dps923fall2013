//
//  Rating.m
//  Ratings good
//
//  Created by Peter McIntyre on 2012/11/20.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import "Rating.h"

@implementation Rating

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        // Set the property values
        _rank = [[dictionary valueForKey:@"Rank"] intValue];
        _programName = [dictionary objectForKey:@"Program Name"];
        _network = [dictionary objectForKey:@"Network"];
        _viewers = [[dictionary valueForKey:@"Viewers"] intValue];
    }
    return self;
}

@end
