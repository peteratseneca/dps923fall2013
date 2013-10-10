//
//  ArtistList.m
//  CD One
//
//  Created by Peter McIntyre on 2012/06/28.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ArtistList.h"
#import "AlbumList.h"

@interface ArtistList ()

@end

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
}

@end
