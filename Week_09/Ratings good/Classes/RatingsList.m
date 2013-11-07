//
//  RatingsList.m
//  TV Ratings
//
//  Created by Peter McIntyre on 2012/10/25.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import "RatingsList.h"
#import "RatingsView.h"
#import "AFNetworking.h"
#import "Rating.h"

@implementation RatingsList

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Make the row height bigger
    self.tableView.rowHeight = 55.0;
    
    // Register for a notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI:) name:@"GetRatingsSuccessful" object:nil];
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
    return (self.model.tvRatings.count == 0) ? 1 : self.model.tvRatings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    if (self.model.tvRatings.count == 0)
    {
        // Show a message, and disable selection/tapping
        cell.textLabel.text = @"Loading...";
        cell.accessoryType = UITableViewCellAccessoryNone;
        tableView.allowsSelection = NO;
    }
    else
    {
        // Un-do the settings above
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        tableView.allowsSelection = YES;
        // Show the data
        Rating *rating = [self.model.tvRatings objectAtIndex:indexPath.row];
        cell.textLabel.text = rating.programName;
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",rating.network]];
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toRatingsView"])
    {
        RatingsView *vc = (RatingsView *)segue.destinationViewController;
        Rating *rating = [self.model.tvRatings objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        vc.rating = rating;
        vc.title = rating.programName;
    }
}

@end
