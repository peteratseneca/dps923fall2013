//
//  Utilities.h
//  Classes
//
//  Created by Peter McIntyre on 2012/10/25.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject

+ (NSDate *)DateFromYear:(int)year month:(int)month day:(int)day;

+ (NSDate *)DateFromISO8601String:(NSString *)dateString;

@end
