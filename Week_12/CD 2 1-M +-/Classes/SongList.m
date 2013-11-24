//
//  SongList.m
//  CD Two 1-M
//
//  Created by Peter McIntyre on 2012/07/17.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

// New...
// This table view controller supports row-delete editing

#import "SongList.h"
#import "SongView.h"

@implementation SongList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure and load the fetched results controller
    self.model.frc_song.delegate = self;
    [self.model.frc_song.fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"album == %@", self.ro]];
    [NSFetchedResultsController deleteCacheWithName:@"Song"];
    
    NSError *error = nil;
    [self.model.frc_song performFetch:&error];
    
    // Add an edit button
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    if (editing)
    {
        // The "Edit button was tapped, so we create an "Add" (+) button on the left side
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem:)];
        // Add it to the left side of the nav bar
        [self.navigationItem setLeftBarButtonItem:addButton animated:YES];
    }
    else
    {
		// The "Done" button was tapped, so we remove the add button from the left side
		[self.navigationItem setLeftBarButtonItem:nil animated:YES];
    }
}

- (void)addItem:(id)sender
{
    // Get a reference to the "add" controller
    UINavigationController *nav = [self.storyboard instantiateViewControllerWithIdentifier:@"AddSongTask"];
    SongEdit *vc = (SongEdit *)nav.topViewController;
    // Configure it
    vc.model = self.model;
    vc.delegate = self;
    
    // Present it, modally
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.model.frc_song sections] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Songs on this album";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.model.frc_song sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    // Fetch the object that backs the current index path (row)
    NSManagedObject *so = [self.model.frc_song objectAtIndexPath:indexPath];
    cell.textLabel.text = [so valueForKey:@"songName"];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toSongView"]) {
        
        // Fetch the selected object
        NSManagedObject *so = [self.model.frc_song objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        //Configure the next VC
        SongView *nextVC = (SongView *)segue.destinationViewController;
        nextVC.title = [so valueForKey:@"songName"];
        nextVC.model = self.model;
        nextVC.ro = so;
    }
}

// UITableViewDelegate method
// Purpose - disable "swipe-to-delete" feature
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (self.editing) ? UITableViewCellEditingStyleDelete : UITableViewCellEditingStyleNone;
}

// UITableViewDataSource method
// Purpose - delete an object from the (Core Data) store
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the object from the Core Data store
        (void)[self.model songDelete:[self.model.frc_song objectAtIndexPath:indexPath]];
    }
}

#pragma mark - Delegate methods

- (void)EditSongController:(id)controller didEditItem:(id)item
{
    // Add a new object to the store, only if an object was passed in
    if (item) {
        NSDictionary *d = (NSDictionary *)item;
        [self.model addNewSong:[d valueForKey:@"songName"] forAlbum:self.ro composedBy:[d valueForKey:@"composer"] inYear:[[d valueForKey:@"year"] intValue]];
        [self.model saveChanges];
    }
    // Dismiss the modal view controller
    [controller dismissViewControllerAnimated:YES completion:nil];
}

// NSFetchedResultsControllerDelegate method
// Purpose - start "bracket" for table view changes
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

// NSFetchedResultsControllerDelegate method
// Purpose - smoothly (i.e. with animation) handles individual row changes in a table view
// Nicely handles one-row-at-a-time changes
- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    // Perform the insert or delete, with animation
    switch (type)
    {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

// NSFetchedResultsControllerDelegate method
// Purpose - end "bracket" for table view changes
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

@end
