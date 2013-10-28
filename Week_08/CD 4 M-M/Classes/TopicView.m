//
//  TopicView.m
//  CD 3 M-M
//
//  Created by Peter McIntyre on 2012/08/16.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "TopicView.h"

@interface TopicView ()
{
    // The picker view's data source array
    NSArray *_topics;
}

@end

@implementation TopicView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Load the topics array from the passed-in object
    // Its "topics" property is an NSSet
    
    // The discussion in the AppView comments about ordered/unordered applies here too...

    // Create two sort descriptors - we want to sort first by week, then by sequence
    NSSortDescriptor *sd1 = [NSSortDescriptor sortDescriptorWithKey:@"week" ascending:YES];
    NSSortDescriptor *sd2 = [NSSortDescriptor sortDescriptorWithKey:@"sequence" ascending:YES];
    // Create the picker view's data source array
    _topics = [[self.o.apps allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sd1, sd2, nil]];

    self.tvTopicDescription.text = self.o.topicDescription;
}

- (void)viewDidUnload
{
    [self setTvTopicDescription:nil];
    [self setPvApps:nil];
    [super viewDidUnload];
}

#pragma mark - Delegate methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return (component == 0) ? [_topics count] : 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // Get the object that backs the current row
    App *a = [_topics objectAtIndex:row];
    // Configure the current row
    return (component == 0) ? [NSString stringWithFormat:@"Wk %@ - #%@ - %@", a.week, a.sequence, a.appName] : @"";
}

@end
