//
//  AlbumList.m
//  CD Two 1-M
//
//  Created by Peter McIntyre on 2012/07/17.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AlbumList.h"
#import "SongList.h"

@interface AlbumList ()

@end

@implementation AlbumList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure and load the fetched results controller
    self.model.frc_album.delegate = self;
    [self.model.frc_album.fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"artist == %@", self.ro]];
    [NSFetchedResultsController deleteCacheWithName:@"Album"];

    NSError *error = nil;
    [self.model.frc_album performFetch:&error];
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
    return [[self.model.frc_album sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.model.frc_album sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    // Fetch the object that backs the current index path (row)
    NSManagedObject *so = [self.model.frc_album objectAtIndexPath:indexPath];
    cell.textLabel.text = [so valueForKey:@"albumName"];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toSongList"]) {
        
        // Fetch the selected object
        NSManagedObject *so = [self.model.frc_album objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        //Configure the next VC
        SongList *nextVC = (SongList *)segue.destinationViewController;
        nextVC.title = [so valueForKey:@"albumName"];
        nextVC.model = self.model;
        nextVC.ro = so;
    }
}

@end
