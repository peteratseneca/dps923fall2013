//
//  BuildingList.m
//  Locations
//
//  Created by Peter McIntyre on 2013-11-18.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import "BuildingList.h"
#import "BuildingView.h"

@interface BuildingList ()

@end

@implementation BuildingList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Register for a notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI:) name:@"SuccessGetBuildings" object:nil];
}

#pragma mark - Notification handlers

- (void)updateUI:(NSNotification *)notification
{
    // This method is called when there's new/updated data from the network
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (self.model.buildings.count == 0) ? 1 : self.model.buildings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (self.model.buildings.count == 0)
    {
        // Show a message, and disable selection/tapping
        cell.textLabel.text = @"Loading...";
        cell.detailTextLabel.text = @"Waiting for the Building list";
        cell.accessoryType = UITableViewCellAccessoryNone;
        tableView.allowsSelection = NO;
    }
    else
    {
        // Un-do the settings above
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        tableView.allowsSelection = YES;
        // Show the data
        NSDictionary *d = [self.model.buildings objectAtIndex:indexPath.row];
        cell.textLabel.text = [d valueForKey:@"ShortName"];
        cell.detailTextLabel.text = [d valueForKey:@"Name"];
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toBuildingView"]) {
        BuildingView *vc = (BuildingView *)segue.destinationViewController;
        NSDictionary *building = [self.model.buildings objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        vc.building = building;
        vc.title = [building valueForKey:@"ShortName"];
    }
}

@end
