//
//  AppEdit.m
//  CD 4 M-M +
//
//  Created by Peter McIntyre on 2012/08/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AppEdit.h"

@interface AppEdit ()

@end

@implementation AppEdit {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // If there is a detail item, then we're in "edit" mode, so configure the user interface
    if (self.detailItem) {
        self.tfAppName.text = self.detailItem.appName;
        self.tfTheme.text = self.detailItem.theme;
        self.slWeek.value = [self.detailItem.week floatValue];
        self.slSequence.value = [self.detailItem.sequence floatValue];
    }
    
    [self sequenceChanged:nil];
    [self weekChanged:nil];
}

- (void)viewDidUnload
{
    [self setTfAppName:nil];
    [self setTfTheme:nil];
    [self setSlWeek:nil];
    [self setLblWeek:nil];
    [self setLblSequence:nil];
    [self setSlSequence:nil];
    [self setTvErrors:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark - User operations

- (IBAction)weekChanged:(id)sender
{
    // Update the label
    int week = roundf(self.slWeek.value);
    self.lblWeek.text = [NSString stringWithFormat:@"Week number (%d)", week];
    
    // "Snap" the slider to the integer value
    self.slWeek.value = week;
}

- (IBAction)sequenceChanged:(id)sender
{
    // Update the label
    int seq = roundf(self.slSequence.value);
    self.lblSequence.text = [NSString stringWithFormat:@"Sequence number (%d)", seq];
    
    // "Snap" the slider to the integer value
    self.slSequence.value = seq;
}

- (IBAction)save:(id)sender
{
    // Do data validation
    self.tvErrors.text = @"";
    
    if ([self.tfAppName.text length] == 0)
    {
        self.tvErrors.text = @"App name is required\n";
        [self.tfAppName resignFirstResponder];
    }

    if ([self.tfTheme.text length] == 0) {
        self.tvErrors.text = [NSString stringWithFormat:@"%@Theme is required", self.tvErrors.text];
        [self.tfTheme resignFirstResponder];
    }

    // Call back to the delegate, only if there are no errors; pass the values from the user interface
    if ([self.tvErrors.text length] == 0)
    {
        // Make a dictionary, and pass it back to the delegate
        NSDictionary *d = [NSDictionary dictionaryWithObjectsAndKeys:self.tfAppName.text, @"appName", self.tfTheme.text, @"theme", [NSNumber numberWithInt:self.slWeek.value], @"week", [NSNumber numberWithInt:self.slSequence.value], @"sequence", nil];
        
        [self.delegate EditAppController:self didEditItem:d];
    }
}

- (IBAction)cancel:(id)sender
{
    // Call the delegate, pass in nil
    [self.delegate EditAppController:self didEditItem:nil];
}

#pragma mark - Text field delegate methods

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
