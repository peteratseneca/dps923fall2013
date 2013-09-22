//
//  ViewController.m
//  Alert Action
//
//  Created by Peter McIntyre on 2012/06/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [self setLblAlert:nil];
    [self setLblAction:nil];
    [super viewDidUnload];
}

#pragma mark - User operations

- (IBAction)showAlert:(id)sender 
{
	// Create and show an alert
	UIAlertView *myAlert = [[UIAlertView alloc] 
							initWithTitle:@"Do something now?" 
							message:@"You can decide to do this action now or later, or cancel the request." 
							delegate:self 
							cancelButtonTitle:@"Cancel" 
							otherButtonTitles:@"Do it now", @"Remind me later", nil];
	// Cancel is buttonIndex 0, and the button indexes of the other buttons begin at 1
    
	// Show in view
	[myAlert show];
}

- (IBAction)showAction:(id)sender 
{
	// Create and show an action sheet
	UIActionSheet *myAction = [[UIActionSheet alloc] initWithTitle:@"Optional title - The button titles alone should enable the user to make an informed decision" 
                                                          delegate:self 
                                                 cancelButtonTitle:@"Cancel" 
                                            destructiveButtonTitle:@"Remove this item" 
                                                 otherButtonTitles:@"Send item as email", @"Move item to work queue", nil];
	// Cancel button is the last index number
	// The "destructive" button is the first, and the button colour is red
	// If you don't want a destructive button, set the destructiveButtonTitle to nil
	
	// Show in view
	[myAction showInView:self.view];
}

#pragma mark - Delegate methods

// DELEGATE METHOD - alert view
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex 
{
	// In this method, implement app logic to do what you want done
	// Use the switch-case statement to find out which button was tapped
    
	// Which button was tapped?
	switch (buttonIndex) {
		case 0:
			// Cancel
			self.lblAlert.text = @"Alert: This request was cancelled";
			break;
		case 1:
			// Do it now
			self.lblAlert.text = @"Alert: Something will be done now";
			break;
		case 2:
			// Remind me later
			self.lblAlert.text = @"Alert: A reminder will happen later";
			break;
	}
}

// DELEGATE METHOD - action sheet
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex 
{
	// In this method, implement app logic to do what you want done
	// Use the switch-case statement to find out which button was tapped
	
	// Which button was tapped?
	switch (buttonIndex) {
		case 0:
			// Red destructive button
			self.lblAction.text = @"Action: Destructive button";
			break;
		case 1:
			// Email
			self.lblAction.text = @"Action: Item will be emailed";
			break;
		case 2:
			// Work queue
			self.lblAction.text = @"Action: Item moved to work queue";
			break;
		case 3:
			// Cancel
			self.lblAction.text = @"Action: This request was cancelled";
			break;
	}
}

@end
