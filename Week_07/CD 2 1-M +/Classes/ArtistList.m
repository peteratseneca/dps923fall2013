//
//  ArtistList.m
//  CD One
//
//  Created by Peter McIntyre on 2012/06/28.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ArtistList.h"
#import "AlbumList.h"
#import "ArtistEdit.h"

@implementation ArtistList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure and load the fetched results controller
    self.model.frc_artist.delegate = self;
    self.model.frc_artist.fetchRequest.predicate = nil;
    
    NSError *error = nil;
    [self.model.frc_artist performFetch:&error];
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.model.frc_artist sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.model.frc_artist sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    // Fetch the object that backs the current index path (row)
    NSManagedObject *o = [self.model.frc_artist objectAtIndexPath:indexPath];
    cell.textLabel.text = [o valueForKey:@"artistName"];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toAlbumList"]) {
        
        // Fetch the selected object
        NSManagedObject *so = [self.model.frc_artist objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        //Configure the next VC
        AlbumList *nextVC = (AlbumList *)segue.destinationViewController;
        nextVC.title = [so valueForKey:@"artistName"];
        nextVC.model = self.model;
        nextVC.ro = so;
    }
    
    if ([segue.identifier isEqualToString:@"toArtistEdit"]) {
        // Configure the next VC (it's embedded in a nav controller)
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        ArtistEdit *nextVC = (ArtistEdit *)nav.topViewController;
        nextVC.model = self.model;
        nextVC.delegate = self;
    }
}

#pragma mark - Delegate methods

- (void)EditArtistController:(id)controller didEditItem:(id)item
{
    // Add a new object to the store, only if an object was passed in
    if (item) {
        NSDictionary *d = (NSDictionary *)item;
        [self.model addNewArtist:[d valueForKey:@"artistName"]];
        [self.model saveChanges];
    }
    // Dismiss the modal view controller
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}

@end
