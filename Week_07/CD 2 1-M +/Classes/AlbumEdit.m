//
//  AlbumEdit.m
//  CD 2 1-M +
//
//  Created by Peter McIntyre on 2012/07/23.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AlbumEdit.h"

@interface AlbumEdit ()

@end

@implementation AlbumEdit {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // If there is a detail item, then we're in "edit" mode, so configure the user interface
    if (self.detailItem) 
    {
        // Cast to a dictionary
        NSDictionary *d = (NSDictionary *)self.detailItem;
        self.tfAlbumName.text = [d valueForKey:@"albumName"];
        self.tfGenre.text = [d valueForKey:@"genre"];
        [self.pvReleaseDate setDate:[d valueForKey:@"releaseDate"]];
    }
    else 
    {
        [self.pvReleaseDate setDate:[NSDate date]];
    }
}

- (void)viewDidUnload
{
    [self setTfAlbumName:nil];
    [self setTfGenre:nil];
    [self setPvReleaseDate:nil];
    [self setTvErrors:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark - User operations

- (IBAction)save:(id)sender 
{
    // Do data validation
    self.tvErrors.text = @"";
    
    if ([self.tfAlbumName.text length] == 0) 
    {
        self.tvErrors.text = @"Album name is required\n";
        [self.tfAlbumName resignFirstResponder];
    }

    if ([self.tfGenre.text length] == 0) {
        self.tvErrors.text = [NSString stringWithFormat:@"%@Genre is required", self.tvErrors.text];
        [self.tfGenre resignFirstResponder];
    }
    
    // Call back to the delegate, only if there are no errors; pass the values from the user interface
    if ([self.tvErrors.text length] == 0) 
    {
        // Make a dictionary, and pass it back to the delegate
        NSDictionary *d = [NSDictionary dictionaryWithObjectsAndKeys:self.tfAlbumName.text, @"albumName", self.tfGenre.text, @"genre", [self.pvReleaseDate date], @"releaseDate", nil];
        
        [self.delegate EditAlbumController:self didEditItem:d];
    }
}

- (IBAction)cancel:(id)sender 
{
    // Call the delegate, pass in nil
    [self.delegate EditAlbumController:self didEditItem:nil];
}

#pragma mark - Text field delegate methods

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
