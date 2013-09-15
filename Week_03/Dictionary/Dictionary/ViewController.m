//
//  ViewController.m
//  Dictionary
//
//  Created by Peter McIntyre on 2012/06/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void) updateTheTextView;

@end

@implementation ViewController

@synthesize model = _model;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Load the user interface
    self.tfFirstName.text = [self.model.me valueForKey:@"firstName"];
    self.tfLastName.text = [self.model.me valueForKey:@"lastName"];
    
    int age = [[self.model.me valueForKey:@"age"] intValue];
    self.lblAge.text = [NSString stringWithFormat:@"Age (%d)", age];
    // Yes, we can do this narrowing implicit conversion
    self.slAge.value = age;
    
    self.segProgram.selectedSegmentIndex = 0;
    
    // Update the text view
    [self updateTheTextView];
}

- (void)viewDidUnload
{
    [self setTfFirstName:nil];
    [self setTfLastName:nil];
    [self setLblAge:nil];
    [self setSlAge:nil];
    [self setSegProgram:nil];
    [self setTvContent:nil];
    [super viewDidUnload];
}

#pragma mark - Delegate methods

// This gets called first, when the user taps the keyboard's "return" key
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
	// Dismiss the keyboard 
	[textField resignFirstResponder];
	return YES;
}

// Then, this gets called
- (void) textFieldDidEndEditing:(UITextField *)textField {
	// Call the conversion method, and pass along the text field that called it
	[self updateTheTextView];
}

#pragma mark - User operations

- (void)updateTheTextView
{
    [self.model.me setValue:self.tfFirstName.text forKey:@"firstName"];
    [self.model.me setValue:self.tfLastName.text forKey:@"lastName"];
    
    // Yes, this conversion will just work
    [self.model.me setValue:[NSNumber numberWithInt
                             :self.slAge.value] forKey:@"age"];
    NSString *program = (self.segProgram.selectedSegmentIndex == 0) ? @"CPA" : @"BSD";
    [self.model.me setValue:program forKey:@"program"];
    
    self.tvContent.text = [self.model.me description];
}

- (IBAction)updatedSlider:(id)sender 
{
    // Update the label
    int age = roundf(self.slAge.value);
    self.lblAge.text = [NSString stringWithFormat:@"Age (%d)", age];
    
    // "Snap" the slider to the integer value
    self.slAge.value = age;
    
    // Update the text view
    [self updateTheTextView];
}

- (IBAction)updatedSegment:(id)sender 
{
    // Update the text view
    [self updateTheTextView];
}

@end
