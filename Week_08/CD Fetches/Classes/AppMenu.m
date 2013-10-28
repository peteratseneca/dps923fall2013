//
//  AppMenu.m
//  CD Fetches
//
//  Created by Peter McIntyre on 2012/08/30.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AppMenu.h"
#import "SongList.h"
#import "MickJaggerSongList.h"
#import "LadyGagaSongList.h"

@interface AppMenu ()

@end

@implementation AppMenu {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Counts
    int artists = [[self.model fetchDataForEntityNamed:@"Artist" withPredicateFormat:nil predicateObject:nil sortDescriptors:nil] count];
    int albums = [[self.model fetchDataForEntityNamed:@"Album" withPredicateFormat:nil predicateObject:nil sortDescriptors:nil] count];
    int songs = [[self.model fetchDataForEntityNamed:@"Song" withPredicateFormat:nil predicateObject:nil sortDescriptors:nil] count];
    self.lblCounts.text = [NSString stringWithFormat:@"Artists %d, Albums %d, Songs %d", artists, albums, songs];

    // Earliest release date
    Album *album = [[self.model fetchDataForEntityNamed:@"Album" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"releaseDate,NO"] lastObject];
    self.lblMinDate.text = [NSString stringWithFormat:@"Oldest release is %@", [NSDateFormatter localizedStringFromDate:album.releaseDate dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterNoStyle]];
    
}

- (void)viewDidUnload
{
    [self setLblCounts:nil];
    [self setLblMinDate:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - Table view methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toSongList"]) {
        
        // Get a reference to the song list view controller
        SongList *nextVC = (SongList *)segue.destinationViewController;

        // Get the data
        nextVC.songs = [self.model fetchDataForEntityNamed:@"Song" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"songName,YES"];
    }
    
    if ([segue.identifier isEqualToString:@"toMickJaggerSongList"]) {
        // Get a reference to the song list view controller
        MickJaggerSongList *nextVC = (MickJaggerSongList *)segue.destinationViewController;
        
        // Get the data
        nextVC.songs = [self.model fetchDataForEntityNamed:@"Song" withPredicateFormat:@"composer contains[cd] %@" predicateObject:@"jagger" sortDescriptors:@"songName,YES"];
    }
    
    if ([segue.identifier isEqualToString:@"toLadyGagaSongList"]) {
        // Get a reference to the song list view controller
        LadyGagaSongList *nextVC = (LadyGagaSongList *)segue.destinationViewController;
        
        // Get the data
        nextVC.songs = [self.model fetchDataForEntityNamed:@"Song" withPredicateFormat:@"album.artist.artistName == %@" predicateObject:@"Lady Gaga" sortDescriptors:@"album.albumName,YES,songName,YES"];

        // There's another way to do this...
        
        // Configure a fetch request to get the Artist object for Lady Gaga
        // Then, use that object as the predicateObject
        // See the following code, which is functionally equivalent to the code above
        
        /*
        Artist *artist = [[self.model fetchDataForEntityNamed:@"Artist" withPredicateFormat:@"artistName == %@" predicateObject:@"Lady Gaga" sortDescriptors:nil] lastObject];
        
        // Get the data
        nextVC.songs = [self.model fetchDataForEntityNamed:@"Song" withPredicateFormat:@"album.artist == %@" predicateObject:artist sortDescriptors:@"album.albumName,YES,songName,YES"];
        */
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
