//
//  EventList.m
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "EventList.h"
#import "EventDetail.h"

@interface EventList ()

@end

@implementation EventList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the fetched results controller
    self.model.frc_event.delegate = self;
    self.model.frc_event.fetchRequest.predicate = nil;

    // Perform the fetch 
    NSError *error = nil;
    [self.model.frc_event performFetch:&error];
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.model.frc_event sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.model.frc_event sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    NSManagedObject *o = [self.model.frc_event objectAtIndexPath:indexPath];
    cell.textLabel.text = [[o valueForKey:@"timeStamp"] description];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toEventDetail"]) 
    {
        // Get a reference to the next-level view controller, and configure it 
        EventDetail *vc = (EventDetail *)segue.destinationViewController;
        vc.ro = [self.model.frc_event objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
    }
}

#pragma mark - User operations

- (IBAction)addEvent:(id)sender 
{
    NSManagedObject *newObject = [self.model addNew:@"Event"];
    
    [newObject setValue:[NSDate date] forKey:@"timeStamp"];
    
    [self.model saveChanges];
}

#pragma mark - Content change handling methods (for programmatic store changes) 

// Choose either the top single method, or the bottom three methods
// Uncomment each to see the differences

/*

// This single method instantly updates the table, with no animations

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}

*/

///*

// These three methods will add the new row with a smooth animation

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

//*/

@end
