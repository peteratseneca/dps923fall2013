//
//  ViewController.m
//  Picker Multi
//
//  Created by Peter McIntyre on 2012/06/13.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)updateTheView;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Update the user interface with the intial values
    [self updateTheView];
}

- (void)viewDidUnload
{
    [self setLblResult:nil];
    [self setPvItems:nil];
    [super viewDidUnload];
}

#pragma mark - Data source and delegate methods

// How many spinning wheels ("components")?
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [self.model.allItems count];
}

// How many rows in a specific component?
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[self.model.allItems objectAtIndex:component] count];
}

// What text string appears in the specific row?
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // Get the array that has the values for the specific component
    NSArray *componentArray = [self.model.allItems objectAtIndex:component];
    
    // Get the string value in that array
    return [[componentArray objectAtIndex:row] description];
}

// What happens when a row selection changes? 
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // In this app, we will not do anything special, but we will simply update the view
    [self updateTheView];
}

#pragma mark - User operations

- (void)updateTheView
{
    // Get the strings in each specific component for the current row
    NSString *pizzaSize = [[[self.model.allItems objectAtIndex:0] objectAtIndex:[self.pvItems selectedRowInComponent:0]] description];
    NSString *kind = [[[self.model.allItems objectAtIndex:1] objectAtIndex:[self.pvItems selectedRowInComponent:1]] description];
    NSString *where = [[[self.model.allItems objectAtIndex:2] objectAtIndex:[self.pvItems selectedRowInComponent:2]] description];
    
    // Display the results in the user interface
    self.lblResult.text = [NSString stringWithFormat:@"%@, %@, %@", pizzaSize, kind, where];
}

@end
