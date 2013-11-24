//
//  SongView.m
//  CD Two 1-M
//
//  Created by Peter McIntyre on 2012/07/17.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "SongView.h"

@interface SongView ()

@end

@implementation SongView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Load the user interface
    
    self.lblSongName.text = [self.ro valueForKey:@"songName"];
    self.lblComposer.text = [self.ro valueForKey:@"composer"];
    self.lblYear.text = [[self.ro valueForKey:@"year"] description];
    
    self.lblAlbumName.text = [self.ro valueForKeyPath:@"album.albumName"];
    self.lblGenre.text = [self.ro valueForKeyPath:@"album.genre"];
    self.lblReleaseDate.text = [NSDateFormatter localizedStringFromDate:[self.ro valueForKeyPath:@"album.releaseDate"]dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterNoStyle];
    
    self.lblArtistName.text = [self.ro valueForKeyPath:@"album.artist.artistName"];
}

- (void)viewDidUnload
{
    [self setLblSongName:nil];
    [self setLblComposer:nil];
    [self setLblYear:nil];
    [self setLblAlbumName:nil];
    [self setLblGenre:nil];
    [self setLblReleaseDate:nil];
    [self setLblArtistName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
