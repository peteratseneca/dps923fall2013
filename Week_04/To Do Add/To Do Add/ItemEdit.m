//
//  ItemEdit.m
//  To Do Add
//
//  Created by Peter McIntyre on 2012/06/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ItemEdit.h"

@interface ItemEdit ()

@end

@implementation ItemEdit

@synthesize delegate = _delegate;
@synthesize tfItem = _tfItem;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setTfItem:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark - User operations

- (IBAction)save:(id)sender 
{
    // Make sure that there's something in the text field
    NSString *newItem = (self.tfItem.text.length > 0) ? self.tfItem.text : nil;
    
    // Call back to the delegate with the new item (or nil)
    [self.delegate EditItemController:self didEditItem:newItem];
}

- (IBAction)cancel:(id)sender 
{
    // Call back to the delegate with nil
    [self.delegate EditItemController:self didEditItem:nil];
}

@end








