//
//  TopicEdit.m
//  CD 4 M-M +
//
//  Created by Peter McIntyre on 2012/08/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "TopicEdit.h"

@interface TopicEdit ()

@end

@implementation TopicEdit {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // If there is a detail item, then we're in "edit" mode, so configure the user interface
    if (self.detailItem) {
        self.tfTopicName.text = self.detailItem.topicName;
        self.tfTopicDescription.text = self.detailItem.topicDescription;
        self.slTopicNumber.value = [self.detailItem.topicNumber floatValue];
    }

    [self sequenceChanged:nil];
}

- (void)viewDidUnload
{
    [self setTfTopicName:nil];
    [self setTfTopicDescription:nil];
    [self setLblTopicNumber:nil];
    [self setSlTopicNumber:nil];
    [self setTvErrors:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark - User operations

- (IBAction)save:(id)sender
{
    // Do data validation
    self.tvErrors.text = @"";
    
    if ([self.tfTopicName.text length] == 0)
    {
        self.tvErrors.text = @"Topic name is required\n";
        [self.tfTopicName resignFirstResponder];
    }
    
    if ([self.tfTopicDescription.text length] == 0) {
        self.tvErrors.text = [NSString stringWithFormat:@"%@Description is required", self.tvErrors.text];
        [self.tfTopicDescription resignFirstResponder];
    }
    
    // Call back to the delegate, only if there are no errors; pass the values from the user interface
    if ([self.tvErrors.text length] == 0)
    {
        // Make a dictionary, and pass it back to the delegate
        NSDictionary *d = [NSDictionary dictionaryWithObjectsAndKeys:self.tfTopicName.text, @"topicName", self.tfTopicDescription.text, @"topicDescription", [NSNumber numberWithInt:self.slTopicNumber.value], @"topicNumber", nil];
        
        [self.delegate EditTopicController:self didEditItem:d];
    }
}

- (IBAction)cancel:(id)sender
{
    // Call the delegate, pass in nil
    [self.delegate EditTopicController:self didEditItem:nil];
}

- (IBAction)sequenceChanged:(id)sender
{
    // Update the label
    int seq = roundf(self.slTopicNumber.value);
    self.lblTopicNumber.text = [NSString stringWithFormat:@"Order / sequence number (%d)", seq];
    
    // "Snap" the slider to the integer value
    self.slTopicNumber.value = seq;
}

#pragma mark - Text field delegate methods

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
