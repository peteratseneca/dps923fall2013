//
//  MediaView.m
//  iTunes v1
//
//  Created by Peter McIntyre on 2012/10/25.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import "MediaView.h"

@interface MediaView ()

@end

@implementation MediaView

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Build the user interface...
    
    self.lblTrackName.text = [self.item valueForKey:@"trackName"];
    self.lblCollectionName.text = [self.item valueForKey:@"collectionName"];
    self.tvLongDescription.text = [self.item valueForKey:@"longDescription"];

    // Release date, nicely formatted
    self.lblReleaseDate.text = [NSDateFormatter localizedStringFromDate:[Utilities DateFromISO8601String:[self.item valueForKey:@"releaseDate"]] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];

    // Numbers, nicely formatted
    self.lblTrackPrice.text = [NSString stringWithFormat:@"Price: $%1.2f", [[self.item valueForKey:@"trackPrice"] floatValue]];
    self.lblTrackTime.text = [NSString stringWithFormat:@"Minutes: %1.2f", [[self.item valueForKey:@"trackTimeMillis"] floatValue] / 60000];

    // Artwork (uses a category on UIImageView)
    NSURL *url = [[NSURL alloc] initWithString:[self.item objectForKey:@"artworkUrl100"]];
    [self.ivArtwork setImageWithURL:url];
}

- (void)viewDidUnload {
    [self setLblTrackName:nil];
    [self setLblCollectionName:nil];
    [self setLblReleaseDate:nil];
    [self setLblTrackPrice:nil];
    [self setLblTrackTime:nil];
    [self setIvArtwork:nil];
    [self setTvLongDescription:nil];
    [super viewDidUnload];
}

@end
