//
//  ProfessorView.m
//  CD One
//
//  Created by Peter McIntyre on 2012/06/28.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ProfessorView.h"

@implementation ProfessorView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the user interface
    self.lblFullName.text = [self.o valueForKey:@"fullName"];
    self.lblOffice.text = [NSString stringWithFormat:@"Office: %@", [self.o valueForKey:@"office"]];
    self.lblEmail.text = [self.o valueForKey:@"email"];
    self.lblWebSite.text = [self.o valueForKey:@"webSite"];
    
    // Now... get the photo from the School of ICT web site...
    // This is a synchronous / blocking operation...
    // The view will not appear until the photo has been fetched
    
    // Get the professor's name, and replace the space with an underscore
	NSString *profName = [self.lblFullName.text stringByReplacingOccurrencesOfString:@" " withString:@""];

    // Construct the URL to the photo
	NSString *urlToPhotoString = [NSString stringWithFormat:@"https://scs.senecac.on.ca/system/files/staff-picture/%@.jpg", profName];

    // Declare a UIImage to hold the photo
	UIImage *theImage;
    
    // Go get the image as data
	NSURL *urlToPhoto = [NSURL URLWithString:urlToPhotoString];
	NSData *imageData = [NSData dataWithContentsOfURL:urlToPhoto];

	if (imageData)
    {
		theImage = [UIImage imageWithData:imageData];
	}
    else
    {
		// Replace with generic image, because the photo doesn't exist
		theImage = [UIImage imageNamed:@"photounavailable.jpg"];
	}

    // Update the user interface
    self.ivPhoto.image = theImage;
}

- (void)viewDidUnload
{
    [self setLblFullName:nil];
    [self setLblOffice:nil];
    [self setLblEmail:nil];
    [self setLblWebSite:nil];
    [self setIvPhoto:nil];
    [super viewDidUnload];
}

@end
