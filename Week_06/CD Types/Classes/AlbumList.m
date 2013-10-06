//
//  AlbumList.m
//  CD Types
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AlbumList.h"
#import "AlbumView.h"

@interface AlbumList ()

@end

@implementation AlbumList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure and load the fetched results controller
    self.model.frc_album.delegate = self;
    self.model.frc_album.fetchRequest.predicate = nil;
    
    NSError *error = nil;
    [self.model.frc_album performFetch:&error];
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
    NSManagedObject *o = [self.model.frc_album objectAtIndexPath:indexPath];
    cell.textLabel.text = [o valueForKey:@"albumName"];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toAlbumView"])
    {
        // Fetch the selected object
        NSManagedObject *o = [self.model.frc_album objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        //Configure the next VC
        AlbumView *nextVC = (AlbumView *)segue.destinationViewController;
        nextVC.title = [o valueForKey:@"albumName"];
        nextVC.model = self.model;
        nextVC.o = o;
    }
}

@end
