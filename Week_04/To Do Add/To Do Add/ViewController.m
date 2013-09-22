//
//  ViewController.m
//  To Do Add
//
//  Created by Peter McIntyre on 2012/06/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"
#import "ItemEdit.h"

@interface ViewController ()

- (void)updateTheTextView;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self updateTheTextView];
}

- (void)viewDidUnload
{
    [self setTvItems:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark - User operations

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toItemEdit"]) {
        
        // Get a reference to the destination view controller
        UINavigationController *nav = segue.destinationViewController;
        ItemEdit *vc = [nav.viewControllers objectAtIndex:0];
        // vc = nav.topViewController;
        // Configure the delegate
        vc.delegate = self;
    }
}

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
    self.tvItems.text = [s description];
}

#pragma mark - Delegate methods

- (void)EditItemController:(id)controller didEditItem:(id)item
{
    if (item) 
    {
        // Add the new item to the model
        [self.model.items addObject:(NSString *)item];
        
        // Update the text view
        [self updateTheTextView];

    }
    [controller dismissModalViewControllerAnimated:YES];
}

@end
