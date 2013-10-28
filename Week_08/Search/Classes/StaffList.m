//
//  StaffList.m
//  Search
//
//  Created by Peter McIntyre on 2012/08/24.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "StaffList.h"
#import "StaffView.h"

@interface StaffList ()
{
    // ivars to support the search operation
    NSArray *_searchResults;
    UISearchDisplayController *_sdc;
}

@end

@implementation StaffList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure and load the fetched results controller
    self.model.frc_person.delegate = self;
    self.model.frc_person.fetchRequest.predicate = nil;
    [NSFetchedResultsController deleteCacheWithName:@"Person"];
    
    NSError *error = nil;
    [self.model.frc_person performFetch:&error];
    
    // Position the table view so that the search bar is initially scrolled above
    // Default height of a search bar is 44.0 points
    [self.tableView setContentOffset:CGPointMake(0, 44)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Determine which table view is asking the question
    if (tableView == self.tableView) {
        return [[self.model.frc_person sections] count];
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Determine which table view is asking the question
    if (tableView == self.tableView) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.model.frc_person sections] objectAtIndex:section];
        return [sectionInfo numberOfObjects];
    } else {
        return [_searchResults count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    // NOTE!!!
    // The "self." prefix was added to the "tableView" symbol below
    // We must do this when we use a search display controller
    // self.tableView - reference to the table view that's managed by the controller
    // tableView - reference to the table view that's passed in when this method is called
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell...

    Person *o;

    // Determine which table view is asking for the cell
    if (tableView == self.tableView) {
        o = [self.model.frc_person objectAtIndexPath:indexPath];
    } else {
        o = [_searchResults objectAtIndex:indexPath.row];
    }

    cell.textLabel.text = o.fullName;

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toStaffView"])
    {
        Person *o = nil;
        
        // Determine whether a search is active, so we can pick the right data object
        if (_sdc.active)
        {
            // Search IS active - fetch the object from the _searchResults
            o = [_searchResults objectAtIndex:[[_sdc.searchResultsTableView indexPathForSelectedRow] row]];
        }
        else
        {
            // Search is NOT active - fetch the object from the frc
            o = [self.model.frc_person objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        }
        
        StaffView *nextVC = (StaffView *)segue.destinationViewController;
        nextVC.model = self.model;
        nextVC.o = o;
    }
}

#pragma mark - Search delegate methods

- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{
    // Set the reference to the search display controller
    _sdc = controller;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    // Clear out existing _searchResults
    _searchResults = nil;
    
    // Create a predicate - fetchedObjects is an array of Person objects
    NSPredicate *p = [NSPredicate predicateWithFormat:@"fullName contains[cd] %@", searchText];
    _searchResults = [self.model.frc_person.fetchedObjects filteredArrayUsingPredicate:p];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    return YES;
}

@end
