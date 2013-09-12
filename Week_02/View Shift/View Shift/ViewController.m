//
//  ViewController.m
//  View Shift
//
//  Created by Peter McIntyre on 2012/06/12.
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
    
    // Initial value for the view shift
    shiftForKeyboard = 0.0f;
}

- (void)viewDidUnload
{
    [self setTf1:nil];
    [self setTf2:nil];
    [self setTf3:nil];
    [self setTf4:nil];
    [super viewDidUnload];
}

#pragma mark - Delegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	NSLog(@"pressed return in text field number... %d", [textField tag]);
	[textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
	NSLog(@"text field number... %d", [textField tag]);
    
	// General approach...
	// Get the position of the UITextField rectangle
	// If its bottom edge is 250 or greater, then move it up
	// FYI - the portrait keyboard is 216 points in height
    
	// Make a CGRect so we can get the textField dimensions and position
	// The following statement gets the rectangle
	CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
	// Find out what the bottom edge value is
	CGFloat bottomEdge = textFieldRect.origin.y + textFieldRect.size.height;
	
	// If the bottom edge is 250 or more, we want to shift the view up
	// We chose 250 here instead of 264, so that we would have some visual buffer space
	if (bottomEdge >= 250) {
		
		// Make a CGRect for the view (which should be positioned at 0,0 and be 320 wide and 480 tall)
		CGRect viewFrame = self.view.frame;
		
		// Determine the amount of the shift
		shiftForKeyboard = bottomEdge - 250.0f;
		NSLog(@"shifted the view up %1.0f points", shiftForKeyboard);
        
		// Adjust the origin for the viewFrame CGRect
		viewFrame.origin.y -= shiftForKeyboard;
		
		// The following animation setup just makes it look nice when shifting
		// We don't really need the animation code, but we'll leave it in here
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationBeginsFromCurrentState:YES];
		[UIView setAnimationDuration:0.3];
        
		// Apply the new shifted vewFrame to the view
		[self.view setFrame:viewFrame];
		
		// More animation code
		[UIView commitAnimations];
		
	} else {
		// No view shifting required; set the value accordingly
		shiftForKeyboard = 0.0f;
	}
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
	// Make a CGRect for the view (which should be positioned at 0,0 and be 320 wide and 480 tall)
	CGRect viewFrame = self.view.frame;
    
	// Adjust the origin back for the viewFrame CGRect
	viewFrame.origin.y += shiftForKeyboard;
	NSLog(@"shifted the view down %1.0f points", shiftForKeyboard);
    
	// Set the shift value back to zero
	shiftForKeyboard = 0.0f;
	
	// As above, the following animation setup just makes it look nice when shifting
	// Again, we don't really need the animation code, but we'll leave it in here
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationDuration:0.3];
	
	// Apply the new shifted vewFrame to the view
	[self.view setFrame:viewFrame];
    
	// More animation code
	[UIView commitAnimations];
}

@end
