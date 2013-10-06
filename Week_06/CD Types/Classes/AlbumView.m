//
//  AlbumView.m
//  CD Types
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AlbumView.h"

@interface AlbumView ()

@end

@implementation AlbumView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Load the user interface
    // Notice the formatted strings

    self.lblAlbumName.text = [self.o valueForKey:@"albumName"];
    self.lblArtistName.text = [self.o valueForKey:@"artistName"];

    self.lblReleaseDate.text = [NSString stringWithFormat:@"Released: %@", [NSDateFormatter localizedStringFromDate:[self.o valueForKey:@"releaseDate"] dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterNoStyle]];

    self.lblMinutes.text = [NSString stringWithFormat:@"Length: %@ minutes", [[self.o valueForKey:@"minutes"] description]];
    
    self.lblMinutes.text = [NSString stringWithFormat:@"Length: %d minutes", [[self.o valueForKey:@"minutes"] intValue]];

    self.lblSellPrice.text = [NSString stringWithFormat:@"MSRP $ %@", [[self.o valueForKey:@"sellPrice"] description]];

    self.ivAlbumImage.image = [self.o valueForKey:@"albumImage"];
}

- (void)viewDidUnload {
    [self setLblAlbumName:nil];
    [self setLblArtistName:nil];
    [self setLblReleaseDate:nil];
    [self setLblMinutes:nil];
    [self setLblSellPrice:nil];
    [self setIvAlbumImage:nil];
    [super viewDidUnload];
}
@end
