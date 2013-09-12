//
//  ViewController.m
//  Text View
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [self setTvNotes:nil];
    [self setBtnDone:nil];
    [super viewDidUnload];
}

#pragma mark - User operations

- (IBAction)doneEditing:(id)sender
{
    // Call the delegate method
    [self textViewDidEndEditing:self.tvNotes];
}

#pragma mark - Delegate methods

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    // Make the text view smaller, so that the keyboard does not cover it
    // We want an 8-point gap between the bottom of the text view and the top of the keyboard
    // So, the height of the text view will be... 480 - 20 - 20 - 37 - 8 - 8 - 216 = 171
    // 480 - height of the screen
    //  20 - status bar
    //  20 - top margin/gap
    //  37 - button height
    //   8 - gap
    //   ? - text view height
    //   8 - gap
    // 216 - keyboard height

    // Get the frame that describes the text view's shape
    CGRect frame = textView.frame;
    // Change its new height
    frame.size.height = 171.0;
    // Set the text view new frame
    textView.frame = frame;
    
    // FYI - a frame is a CGRect, which is a struct
    // You can get and set a text view "frame" property
    // However, you cannot use dot syntax to dereference the fields of the struct (e.g. textView.frame.size.height)
    
    // Check it out...
    // Open the documentation for UITextView, and try to find the "frame" property
    // It's not there
    // So, look at its superclass (UIScrollView), and try to find it again; it's not there
    // Look at its superclass (UIView), and try to find it - aha, it's there
    
    // Enable the button (we un-checked the "Enabled" checkbox in the storyboard)
    [self.btnDone setEnabled:YES];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    // Restore the text view to its original size
    CGRect frame = textView.frame;
    frame.size.height = 375.0;
    textView.frame = frame;

    // Disable the button
    [self.btnDone setEnabled:NO];
    
    // Dismiss the keyboard
    [textView resignFirstResponder];
}

@end
