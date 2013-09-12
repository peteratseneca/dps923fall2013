//
//  ViewController.m
//  Convert
//
//  Created by Peter McIntyre on 2012/06/04.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"

// Private methods
@interface ViewController ()

// Round-trip (text > number > text) when the keyboard is dismissed
- (void)roundTripConversion:(UITextField *)textField;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Initialize the random number
	[self startAgain:nil];
}

- (void)viewDidUnload
{
    [self setTfInteger:nil];
    [self setTfFloat:nil];
    [self setTfDouble:nil];
    [self setLblResult:nil];
    [self setLblInteger:nil];
    [self setLblFloat:nil];
    [self setLblDouble:nil];
    [self setSegOperation:nil];
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
	[self roundTripConversion:textField];
}

#pragma mark - User operations

- (void)roundTripConversion:(UITextField *)textField
{
	// There are two ways to code this app; the first way is to create 
	// a method that will handle EACH text field, but we won't do it this way
	// The other way, shown below, uses one method to handle all the text fields;
	// in IB, each text field was given a "tag" number to uniquely identify it
    
	// NOTE - this method does NOT do input validation - 
	// it could blow up if it gets non-numeric data!
	
	// Local variables
	int myInteger;
	float myFloat;
	double myDouble;
    
	// Pull the text out of the textField, convert it to a number,
	// and then convert it back to a string, placing it in the label
	switch (textField.tag) {
		case 0:
			// Top field, integer			
			// Coding pattern... set the C scalar int to the converted value of the text...
			myInteger = [self.tfInteger.text intValue];
			// ...then, set the label back to a string representation of the value
			self.lblInteger.text = [NSString stringWithFormat:@"%d", myInteger];
			break;
		case 1:
			// Middle field, float
			myFloat = [self.tfFloat.text floatValue];
			self.lblFloat.text = [NSString stringWithFormat:@"%1.4f", myFloat];
			break;
		case 2:
			// Bottom field, double
			myDouble = [self.tfDouble.text doubleValue];
			// We're going to do one extra step here, to prepare for future learning
			// The double will be placed in an NSNumber wrapper, and then extracted
            NSNumber *numDouble = [NSNumber numberWithDouble:myDouble];
			self.lblDouble.text = [NSString stringWithFormat:@"%1.4f", [numDouble doubleValue]];
			break;
	}

}

- (IBAction)doOperation:(id)sender 
{
	// Local variable
	double myNumber;
    
	// Get the segment that was tapped/clicked
	switch (self.segOperation.selectedSegmentIndex) {
		case 0:
			// Add 17
			myNumber = [self.lblResult.text doubleValue] + 17;
			self.lblResult.text = [NSString stringWithFormat:@"%1.4f", myNumber];
			break;
		case 1:
			// Divide by 3.708
			myNumber = [self.lblResult.text doubleValue] / 3.708;
			self.lblResult.text = [NSString stringWithFormat:@"%1.4f", myNumber];
			break;
		case 2:
			// Multiply by 12.45
			myNumber = [self.lblResult.text doubleValue] * 12.45;
			self.lblResult.text = [NSString stringWithFormat:@"%1.4f", myNumber];
			break;
		case 3:
			// Subtract 303
			myNumber = [self.lblResult.text doubleValue] - 303;
			self.lblResult.text = [NSString stringWithFormat:@"%1.4f", myNumber];
			break;
	}

}

- (IBAction)startAgain:(id)sender 
{
	// Set the random number starter to a value between 0 and 100
	float f = arc4random() % 100;
	self.lblResult.text = [NSString stringWithFormat:@"%1.4f", f];
}

@end
