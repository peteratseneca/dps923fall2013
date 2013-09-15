//
//  Model.h
//  Picker Date
//
//  Created by Peter McIntyre on 2012/06/13.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

// Class (static) methods
// A user of this class does not have to create an instance of this class

// Typical date classes: NSDate, NSCalendar, NSDateComponents

// Use an NSCalendar to decompose an NSDate into an NSDateComponents
// Use an NSCalendar to create an NSDate from an NSDateComponents

// We'll assume the usage of the Gregorian calendar (which is standard in North America)

+ (NSDate *) OneDayFromNow;
+ (NSDate *) OneDayAgo;

+ (NSInteger) ThisDayNum;
+ (NSInteger) DayNum:(NSDate *)date;

// To do - convert the rest of "This..." methods to accept a date argument
+ (NSInteger) ThisWeekdayNum;
+ (NSString *) ThisWeekdayName;

// To do - function to return the weekday name (e.g. Monday, Tuesday, ...)
+ (NSInteger) ThisMonthNum;
+ (NSInteger) ThisYearNum;

+ (NSDate *) NewDateFromYear:(int)year month:(int)month day:(int)day;

@end
