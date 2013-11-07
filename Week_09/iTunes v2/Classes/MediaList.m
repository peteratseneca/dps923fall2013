//
//  MediaList.m
//  iTunes v2
//
//  Created by Peter McIntyre on 2012/10/26.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import "MediaList.h"

@interface MediaList ()

@end

@implementation MediaList

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Row height
    self.tableView.rowHeight = 55.0;
    
    // Register for a notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI:) name:@"ResultsSearchSuccessful" object:nil];
}

#pragma mark - Notification handlers

- (void)updateUI:(NSNotification *)notification
{
    // This method is called when there's new/updated data from the network
    [self.tableView reloadData];
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary *d = [self.model.results objectAtIndex:indexPath.row];
    
    // Customize the appearance
    
    NSString *wrapperType = [d valueForKey:@"wrapperType"];
    
    if ([wrapperType isEqualToString:@"artist"])
    {
        cell.textLabel.text = [d valueForKey:@"artistName"];
        cell.detailTextLabel.text = nil;
    }
    
    if ([wrapperType isEqualToString:@"collection"])
    {
        cell.textLabel.text = [d valueForKey:@"collectionName"];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@ - %@", [d valueForKey:@"artistName"], [d valueForKey:@"primaryGenreName"], [(NSString *)[d valueForKey:@"releaseDate"] substringToIndex:10]];
    }
    
    if ([wrapperType isEqualToString:@"track"])
    {
        cell.textLabel.text = [d valueForKey:@"trackName"];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@ - %@", [d valueForKey:@"artistName"], [d valueForKey:@"collectionName"], [(NSString *)[d valueForKey:@"releaseDate"] substringToIndex:10]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
