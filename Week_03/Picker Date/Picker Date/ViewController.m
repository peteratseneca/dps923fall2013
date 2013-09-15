//
//  ViewController.m
//  Picker Date
//
//  Created by Peter McIntyre on 2012/06/13.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Set the date picker to the current date and time
    self.pvDate.date = [NSDate date];
    
    // Update the user interface
    [self dateWasSelected:nil];
}

- (void)viewDidUnload
{
    [self setPvDate:nil];
    [self setLblResult:nil];
    [super viewDidUnload];
}

#pragma mark - User operations

- (IBAction)dateWasSelected:(id)sender 
{
    // Display a formatted version of the selected date in the user interface
    self.lblResult.text = [NSDateFormatter localizedStringFromDate:self.pvDate.date dateStyle:NSDateFormatterFullStyle timeStyle:NSDateFormatterShortStyle];

    self.lblResult.text = [self.pvDate.date description];
    
    // Output other date and time info to the console log
    
    NSLog(@"\n\n---New date was selected---\n\n");
    
	NSLog(@"Yesterday      %@", [Model OneDayAgo]);
    
    NSLog(@"Yesterday      %@", [NSDateFormatter localizedStringFromDate:[Model OneDayAgo] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterShortStyle]);
    
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	[df setDateStyle:NSDateFormatterLongStyle];
	[df setTimeStyle:NSDateFormatterShortStyle];
	NSLog(@"Yesterday ET   %@", [df stringFromDate:[Model OneDayAgo]]);
    
    [df setDateStyle:NSDateFormatterShortStyle];
	[df setTimeStyle:NSDateFormatterShortStyle];
	NSLog(@"Yesterday ET   %@", [df stringFromDate:[Model OneDayAgo]]);
    
	[df setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"America/Los_Angeles"]];
	NSLog(@"Yesterday PT   %@", [df stringFromDate:[Model OneDayAgo]]);
	
	NSLog(@"Today          %@", [NSDate date]);
	NSLog(@"Tomorrow       %@", [Model OneDayFromNow]);
	
	NSLog(@"This weekday   %@", [Model ThisWeekdayName]);
	NSLog(@"This weekday   %d", [Model ThisWeekdayNum]);
	NSLog(@"This day       %d", [Model ThisDayNum]);
	NSLog(@"This month     %d", [Model ThisMonthNum]);
	NSLog(@"This year      %d", [Model ThisYearNum]);
	
	NSLog(@"This day (new) %d", [Model DayNum:nil]);
	NSLog(@"This day (new) %d", [Model DayNum:[Model NewDateFromYear:2012 month:10 day:22]]);
	
	NSLog(@"New date       %@", [[Model NewDateFromYear:2012 month:6 day:6] description]);
	
	NSTimeZone *dtz = [NSTimeZone defaultTimeZone];
	NSTimeZone *ltz = [NSTimeZone localTimeZone];
	NSLog(@"Time zones     %@ / %@", [dtz description], [ltz description]);
    
    NSArray *n = [NSTimeZone knownTimeZoneNames];
	for (int i = 0; i < [n count]; i++) {
		//NSLog(@"%@", [n objectAtIndex:i]);
	}

}

@end
