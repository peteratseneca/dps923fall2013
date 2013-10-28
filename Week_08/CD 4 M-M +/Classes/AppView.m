//
//  AppView.m
//  CD 4 M-M +
//
//  Created by Peter McIntyre on 2012/08/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AppView.h"

@interface AppView ()
{
    // The picker view's data source array
    NSArray *_topics;
}

@end

@implementation AppView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Load the topics array from the passed-in object
    // Its "topics" property is an NSSet

    // Here's something to think about...
    // NSSet is unordered
    // Do we want the results in order? By what attribute? topicNumber? topicName?

    // The following statement gets us an unordered array of Topic objects
    //_topics = [[self.o valueForKey:@"topics"] allObjects];

    // The following statement gets us an ordered array of topicName strings from the Topic objects
    //_topics = [[[self.o valueForKeyPath:@"topics.topicName"] allObjects] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    // To get an ordered array (by topicNumber), do the following...
    // Note that you must declare a "sort descriptor" object for this to work
    
    NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"topicNumber" ascending:YES];
    // Create the picker view's data source array
    _topics = [[self.o.topics allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sd]];
    
    self.lblTheme.text = self.o.theme;
}

- (void)viewDidUnload
{
    [self setPvTopics:nil];
    [self setLblTheme:nil];
    [super viewDidUnload];
}

#pragma mark - User operations

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Two possible tasks:
    // toAppTopicsEdit - edits the app's "topics" collection
    // toAppEdit - edits the app's details (name, theme, etc.)
    
    if ([segue.identifier isEqualToString:@"toAppTopicsEdit"]) {
        // Configure the next VC (it's embedded in a nav controller)
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        AppTopicsEdit *nextVC = (AppTopicsEdit *)nav.topViewController;
        nextVC.model = self.model;
        nextVC.app = self.o;
        nextVC.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"toAppEdit"]) {
        // Configure the next VC (it's embedded in a nav controller)
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        AppEdit *nextVC = (AppEdit *)nav.topViewController;
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
    Topic *t = [_topics objectAtIndex:row];
    // Configure the row
    return (component == 0) ? t.topicName : @"";
}

- (void)EditAppController:(id)controller didEditItem:(id)item
{
    // Item will be nil if the user tapped "Cancel" on the AppEdit controller
    // Otherwise, it will have an item that may have been edited
    
    if (item) {
        // Determine whether the item has been edited...
        NSDictionary *d = (NSDictionary *)item;
        BOOL isUpdated = NO;
        if (![[[d valueForKey:@"appName"] description] isEqualToString:self.o.appName]) isUpdated = YES;
        if (![[[d valueForKey:@"theme"] description] isEqualToString:self.o.theme]) isUpdated = YES;
        if ([[d valueForKey:@"week"] intValue] != [self.o.week intValue]) isUpdated = YES;
        if ([[d valueForKey:@"sequence"] intValue] != [self.o.sequence intValue]) isUpdated = YES;
        
        if (isUpdated) {
            // Save the changes
            self.o.appName = [d valueForKey:@"appName"];
            self.title = self.o.appName;
            self.o.theme = [d valueForKey:@"theme"];
            self.o.week = [d valueForKey:@"week"];
            self.o.sequence = [d valueForKey:@"sequence"];
            [self.model saveChanges];
        }
    }
    // Dismiss the modal view controller
    [self dismissModalViewControllerAnimated:YES];
}

- (void)EditAppTopicsController:(id)controller didEditItem:(id)item
{
    // Re-create the picker view's data source array
    NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"topicNumber" ascending:YES];
    _topics = [[self.o.topics allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sd]];
    
    // Update the picker view
    [self.pvTopics reloadAllComponents];
    
    // Dismiss the modal view controller
    [self dismissModalViewControllerAnimated:YES];
}

@end
