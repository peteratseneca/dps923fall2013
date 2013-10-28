//
//  AppView.m
//  CD 3 M-M
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

    // The passed-in object has a "topics" property, which is an NSSet
    // We'll create an array data source for the picker view from this NSSet

    // Here's something to think about...
    // NSSet is unordered
    // Do we want the results in order? Yes. By what attribute? topicNumber? topicName?

    // The following statement gets us an unordered array of Topic objects
    //_topics = [[self.o valueForKey:@"topics"] allObjects];

    // The following statement gets us an ordered array of topicName strings from the Topic objects
    //_topics = [[[self.o valueForKeyPath:@"topics.topicName"] allObjects] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    // To get an ordered array (by topicNumber), do the following...
    // Note that you must declare a "sort descriptor" object for this to work
    
    NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"topicNumber" ascending:YES];
    // Create the picker view's data source array
    _topics = [[[self.o valueForKey:@"topics"] allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sd]];
    
    self.lblTheme.text = [self.o valueForKey:@"theme"];
}

- (void)viewDidUnload
{
    [self setPvTopics:nil];
    [self setLblTheme:nil];
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
    NSManagedObject *t = [_topics objectAtIndex:row];
    // Configure the row
    return (component == 0) ? [t valueForKey:@"topicName"] : @"";
}

@end













