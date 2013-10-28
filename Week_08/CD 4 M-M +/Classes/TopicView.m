//
//  TopicView.m
//  CD 4 M-M +
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

#pragma mark - User operations

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Two possible tasks:
    // toTopicAppsEdit - edit the topic's "apps" collection
    // toTopicEdit - edit the topic's details (name, description, etc.)
    
    if ([segue.identifier isEqualToString:@"toTopicAppsEdit"]) {
        // Configure the next VC (it's embedded in a nav controller)
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        TopicAppsEdit *nextVC = (TopicAppsEdit *)nav.topViewController;
        nextVC.model = self.model;
        nextVC.topic = self.o;
        nextVC.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"toTopicEdit"]) {
        // Configure the next VC (it's embedded in a nav controller)
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        TopicEdit *nextVC = (TopicEdit *)nav.topViewController;
        nextVC.model = self.model;
        nextVC.detailItem = self.o;
        nextVC.delegate = self;
    }
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

- (void)EditTopicController:(id)controller didEditItem:(id)item
{
    // Item will be nil if the user tapped "Cancel" on the TopicEdit controller
    // Otherwise, it will have an item that may have been edited
    
    if (item) {
        // Determine whether the item has been edited...
        NSDictionary *d = (NSDictionary *)item;
        BOOL isUpdated = NO;
        if (![[[d valueForKey:@"topicName"] description] isEqualToString:self.o.topicName]) isUpdated = YES;
        if (![[[d valueForKey:@"topicDescription"] description] isEqualToString:self.o.topicDescription]) isUpdated = YES;
        if ([[d valueForKey:@"topicNumber"] intValue] != [self.o.topicNumber intValue]) isUpdated = YES;
        
        if (isUpdated) {
            // Save the changes
            self.o.topicName = [d valueForKey:@"topicName"];
            self.title = self.o.topicName;
            self.o.topicDescription = [d valueForKey:@"topicDescription"];
            self.o.topicNumber = [d valueForKey:@"topicNumber"];
            [self.model saveChanges];
        }
    }
    // Dismiss the modal view controller
    [self dismissModalViewControllerAnimated:YES];
}

- (void)EditTopicAppsController:(id)controller didEditItem:(id)item
{
    // Re-create the picker view's data source array
    NSSortDescriptor *sd1 = [NSSortDescriptor sortDescriptorWithKey:@"week" ascending:YES];
    NSSortDescriptor *sd2 = [NSSortDescriptor sortDescriptorWithKey:@"sequence" ascending:YES];
    // Create the picker view's data source array
    _topics = [[self.o.apps allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sd1, sd2, nil]];
    
    // Update the picker view
    [self.pvApps reloadAllComponents];
    
    // Dismiss the modal view controller
    [self dismissModalViewControllerAnimated:YES];
}

@end
