//
//  SongList.m
//  CD Fetches
//
//  Created by Peter McIntyre on 2012/09/04.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "SongList.h"

@interface SongList ()

@end

@implementation SongList {}

#pragma mark - View lifecycle

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.songs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...

    Song *song = [self.songs objectAtIndex:indexPath.row];
    cell.textLabel.text = song.songName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ / %@", song.album.artist.artistName, song.album.albumName];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
