//
//  ArtistEdit.m
//  CD 2 1-M +
//
//  Created by Peter McIntyre on 2012/07/17.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ArtistEdit.h"

@interface ArtistEdit ()

@end

@implementation ArtistEdit {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // If there is a detail item, then we're in "edit" mode, so configure the user interface
    if (self.detailItem) {
        // Cast to a dictionary
        NSDictionary *d = (NSDictionary *)self.detailItem;
        self.tfArtistName.text = [d valueForKey:@"artistName"];
    }
}

- (void)viewDidUnload
{
    [self setTfArtistName:nil];
    [self setTvErrors:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark - User operations

- (IBAction)save:(id)sender 
{
    // Do data validation
    self.tvErrors.text = @"";
    
    if ([self.tfArtistName.text length] == 0) 
    {
        self.tvErrors.text = @"Artist name is required\n";
        [self.tfArtistName resignFirstResponder];
    }
    
    // Call back to the delegate, only if there are no errors; pass the values from the user interface
    if ([self.tvErrors.text length] == 0) 
    {
        // Make a dictionary, and pass it back to the delegate
        NSDictionary *d = [NSDictionary dictionaryWithObjectsAndKeys:self.tfArtistName.text, @"artistName", nil];
        
        [self.delegate EditArtistController:self didEditItem:d];
    }
}

- (IBAction)cancel:(id)sender 
{
    // Call the delegate, pass in nil
    [self.delegate EditArtistController:self didEditItem:nil];
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
