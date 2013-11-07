//
//  MediaList.m
//  iTunes v1
//
//  Created by Peter McIntyre on 2012/10/25.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import "MediaList.h"
#import "MediaView.h"

@interface MediaList ()

- (void)updateUI:(NSNotification *)notification;

@end

@implementation MediaList

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Configure the row height
	self.tableView.rowHeight = 55.0f;
	
    // Register for a notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI:) name:@"MediaLoadedSuccessfully" object:nil];
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
    return self.model.tvshows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    // Fetch the dictionary
    NSDictionary *d = [self.model.tvshows objectAtIndex:indexPath.row];

    // Configure the text label
    cell.textLabel.text = [d valueForKey:@"trackName"];
    
    // Convert the ISO 8601 date to an NSDate
    NSDate *releaseDate = [Utilities DateFromISO8601String:[d valueForKey:@"releaseDate"]];
    // Configure the detail text label
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", [d valueForKey:@"artistName"], [NSDateFormatter localizedStringFromDate:releaseDate dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle]];

    /*
    // Alternative detail text label...
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - $%1.2f, %1.2f minutes", [d valueForKey:@"artistName"], [[d valueForKey:@"trackPrice"] floatValue], [[d valueForKey:@"trackTimeMillis"] floatValue] / 60000.0];
    */
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toMediaView"])
    {
        MediaView *vc = (MediaView *)segue.destinationViewController;
        NSDictionary *item = [self.model.tvshows objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        vc.model = self.model;
        vc.item = item;
    }
}

@end
