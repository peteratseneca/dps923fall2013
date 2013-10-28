//
//  TopicList.m
//  CD 3 M-M
//
//  Created by Peter McIntyre on 2012/08/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "TopicList.h"
#import "TopicView.h"

@interface TopicList ()

@end

@implementation TopicList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure and load the fetched results controller
    self.model.frc_topic.delegate = self;
    self.model.frc_topic.fetchRequest.predicate = nil;
    
    NSError *error = nil;
    [self.model.frc_topic performFetch:&error];
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.model.frc_topic sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.model.frc_topic sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    // Fetch the object that backs the current index path (row)
    Topic *o = [self.model.frc_topic objectAtIndexPath:indexPath];
    
    cell.textLabel.text = o.topicName;
    cell.detailTextLabel.text = o.topicDescription;

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toTopicView"]) {
        // Get the object backing the selected row
        // Pass it on to the next controller
        // Configure the view
        
        // Fetch the selected object
        Topic *o = [self.model.frc_topic objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        
        //Configure the next VC
        TopicView *nextVC = (TopicView *)segue.destinationViewController;
        nextVC.title = o.topicName;
        nextVC.model = self.model;
        nextVC.o = o;
    }
}

@end
