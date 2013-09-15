//
//  ViewController.m
//  Picker
//
//  Created by Peter McIntyre on 2012/06/13.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [self setPvItems:nil];
    [self setLblResult:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark - Data source and delegate methods

// How many spinning wheels ("components")?
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// How many rows in a specific component?
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.model.cities count];
}

// What text string appears in the specific row?
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[self.model.cities objectAtIndex:row] description];
}

// What happens when a row selection changes? 
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.lblResult.text = [NSString stringWithFormat:@"Selected: %@", [[self.model.cities objectAtIndex:row] description]];
}

@end
