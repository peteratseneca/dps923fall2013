//
//  ViewController.m
//  Array To Do
//
//  Created by Peter McIntyre on 2012/06/07.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)updateTheTextView;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Update the text view
    [self updateTheTextView];
}

- (void)viewDidUnload
{
    [self setTfItem:nil];
    [self setTvResult:nil];
    [super viewDidUnload];
}

#pragma mark - User operations

- (void)updateTheTextView
{
    // Create a mutable string to hold text
    NSMutableString *s = [[NSMutableString alloc] init];
    
    // Go through the array, and read the elements
    
    for (int i = 0; i < [self.model.items count]; i++) {
        // Append to the string
        [s appendFormat:@"Element %d - %@\n", i, [[self.model.items objectAtIndex:i] description]];
    }
    
    // Show the results in the user interface
    self.tvResult.text = [s description];
}

- (IBAction)addItem:(id)sender 
{
    // Dismiss the keyboard
    [self.tfItem resignFirstResponder];
    
    // If the text field has content...
    if ([self.tfItem.text length] > 0) 
    {
        // Add the new item to the to do list array
        [self.model.items addObject:self.tfItem.text];
        self.tfItem.text = @"";
    }
    
    // Update the text view
    [self updateTheTextView];
}

@end
