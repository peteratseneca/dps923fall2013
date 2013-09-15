//
//  Model.m
//  Picker Date
//
//  Created by Peter McIntyre on 2012/06/13.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (NSDate *) OneDayFromNow {
	NSDate *d = [NSDate dateWithTimeIntervalSinceNow:(60 * 60 * 24)];
	return d;
}

+ (NSDate *) OneDayAgo {
	NSTimeZone *tz = [NSTimeZone defaultTimeZone];
	NSDate *d = [NSDate dateWithTimeIntervalSinceNow:-(60 * 60 * 24)];
	NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	[c setTimeZone:tz];
	return d;
}

+ (NSInteger) ThisDayNum {
	NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dc = [c components:NSDayCalendarUnit fromDate:[NSDate date]];
	return [dc day];
}

+ (NSInteger) DayNum:(NSDate *)date {
	if (!date) {
		date = [NSDate date];
	}
	NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dc = [c components:NSDayCalendarUnit fromDate:date];
	return [dc day];
}

+ (NSInteger) ThisWeekdayNum {
	NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dc = [c components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
	return [dc weekday];
}

+ (NSString *) ThisWeekdayName {
	NSDateFormatter *f = [[NSDateFormatter alloc] init];
	[f setDateFormat:@"EEEE"];
	return [f stringFromDate:[NSDate date]];
}

+ (NSInteger) ThisMonthNum {
	NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dc = [c components:NSMonthCalendarUnit fromDate:[NSDate date]];
	return [dc month];
}

+ (NSInteger) ThisYearNum {
	NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dc = [c components:NSYearCalendarUnit fromDate:[NSDate date]];
	return [dc year];
}

+ (NSDate *) NowDay {
	return nil;
}

+ (NSDate *) NowDayOfWeek {
	return nil;
}

+ (NSDate *) NowMonth {
	return nil;
}

+ (NSDate *) NowYear {
	return nil;
}

+ (NSDate *) NewDateFromYear:(int)year month:(int)month day:(int)day {
	//OK... how do we validate the date components?
	// Want to check their range, and throw (and then handle) an exception
	// Research how to do this the right way
	NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dc = [[NSDateComponents alloc] init];
	[dc setYear:year];
	[dc setMonth:month];
	[dc setDay:day];
	[dc setHour:0];
	[dc setMinute:0];
	return [c dateFromComponents:dc];
}

@end
