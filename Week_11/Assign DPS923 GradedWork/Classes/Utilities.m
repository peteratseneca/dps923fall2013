//
//  Utilities.m
//  Classes
//
//  Created by Peter McIntyre on 2012/10/25.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+ (NSDate *) DateFromYear:(int)year month:(int)month day:(int)day {
    NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dc = [[NSDateComponents alloc] init];
    [dc setYear:year];
    [dc setMonth:month];
    [dc setDay:day];
    [dc setHour:0];
    [dc setMinute:0];
    return [c dateFromComponents:dc];
}

+ (NSDate *)DateFromISO8601String:(NSString *)dateString
{
    if ([dateString hasSuffix:@"Z"])
    {
        dateString = [[dateString substringToIndex:(dateString.length-1)] stringByAppendingString:@"-0000"];
    }
    dateString = [dateString stringByReplacingOccurrencesOfString:@":" withString:@""];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HHmmssZ";
    return [dateFormatter dateFromString:dateString];
}

@end
