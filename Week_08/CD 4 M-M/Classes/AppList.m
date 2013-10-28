//
//  AppList.m
//  CD 3 M-M
//
//  Created by Peter McIntyre on 2012/08/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AppList.h"
#import "AppView.h"

@interface AppList ()

@end

@implementation AppList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure and load the fetched results controller
    self.model.frc_app.delegate = self;
    self.model.frc_app.fetchRequest.predicate = nil;
    
    NSError *error = nil;
    [self.model.frc_app performFetch:&error];
    
    // While we're here, create the table view section titles array (sorted)
    // The section titles typically come from an array other than the fetched objects array that holds the row objects
    // The section titles array is derived from the fetched objects obviously
    self.sectionTitles = [[[self.model.frc_app fetchedObjects] valueForKeyPath:@"@distinctUnionOfObjects.week"] sortedArrayUsingSelector:@selector(compare:)];
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.model.frc_app sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.model.frc_app sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

// Section title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Week %@", [self.sectionTitles objectAtIndex:section]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    // Fetch the object that backs the current index path (row)
    App *o = [self.model.frc_app objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"#%@ - %@", o.sequence, o.appName];
    cell.detailTextLabel.text = o.theme;

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toAppView"]) {
        // Get the object backing the selected row
        // Pass it on to the next controller
        // Configure the view
        
        // Fetch the selected object
        App *o = [self.model.frc_app objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        
        //Configure the next VC
        AppView *nextVC = (AppView *)segue.destinationViewController;
        nextVC.title = o.appName;
        nextVC.model = self.model;
        nextVC.o = o;
    }
}

@end
