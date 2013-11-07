//
//  MediaSearch.m
//  iTunes v2
//
//  Created by Peter McIntyre on 2012/10/26.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import "MediaSearch.h"
#import "MediaList.h"

@interface MediaSearch ()

- (BOOL)isEmptySearch;

@end

@implementation MediaSearch

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.btnSearch.enabled = ([self isEmptySearch]) ? NO : YES;
}

- (void)viewDidUnload {
    [self setTfArtist:nil];
    [self setTfAlbum:nil];
    [self setTfSong:nil];
    [self setLblError:nil];
    [self setBtnSearch:nil];
    [super viewDidUnload];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toMediaList"])
    {
        // Send the search string to the model
        [self.model searchMediaByArtist:self.tfArtist.text album:self.tfAlbum.text song:self.tfSong.text];

        // Pass on the model
        MediaList *vc = (MediaList *)segue.destinationViewController;
        vc.model = self.model;
    }
}

#pragma mark - Delegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.btnSearch.enabled = ([self isEmptySearch]) ? NO : YES;
}

#pragma mark - Utility methods

- (BOOL)isEmptySearch
{
    return (self.tfArtist.text.length + self.tfAlbum.text.length + self.tfSong.text.length == 0) ? YES : NO;
}

@end
