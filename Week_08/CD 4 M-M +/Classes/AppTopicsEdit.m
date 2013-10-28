//
//  AppTopicsEdit.m
//  CD 4 M-M +
//
//  Created by Peter McIntyre on 2012/08/23.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AppTopicsEdit.h"

@interface AppTopicsEdit ()

@end

@implementation AppTopicsEdit {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Configure and load the fetched results controller
    self.model.frc_topic.delegate = self;
    self.model.frc_topic.fetchRequest.predicate = nil;
    [NSFetchedResultsController deleteCacheWithName:@"Topic"];
    
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

// Section title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return (section == 0) ? [NSString stringWithFormat:@"Topics in \"%@\"", self.app.appName] : nil;
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

    // Determine the checked / un-checked state of the cell
    if ([self.app.topics containsObject:o]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Check / un-check behaviour

    // Get the cell that was tapped, and its current accessory status (which is an enumeration)
    // See the UITableViewCellAccessory enum documentation
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    int checkedStatus = cell.accessoryType;
    
    // Fetch the object that backs the current index path (row)
    Topic *o = [self.model.frc_topic objectAtIndexPath:indexPath];

    switch (checkedStatus) {
        case 0: // 0 is "...None"
        {
            // Add to collection
            [self.app addTopicsObject:o];
            // Update the check mark state
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            break;
        }
        case 3: // 3 is "...Checked"
        {
            // Remove from collection
            [self.app removeTopicsObject:o];
            // Update the check mark state
            cell.accessoryType = UITableViewCellAccessoryNone;
            break;
        }
    }
    
    // Save the changes
    [self.model saveChanges];
    
    // Fade out the cell selection background
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - User operations

- (IBAction)done:(id)sender
{
    // Call the delegate, pass in nil
    [self.delegate EditAppTopicsController:self didEditItem:nil];
}

@end
