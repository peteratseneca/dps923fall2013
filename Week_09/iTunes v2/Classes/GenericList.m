//
//  ...List.m
//
//  Created by Peter McIntyre on 2012/10/25.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import "GenericList.h"
//#import "NextViewController.h"

@interface GenericList ()

- (void)updateUI:(NSNotification *)notification;

@end

@implementation GenericList

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Register for a notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI:) name:@"NotificationName" object:nil];
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
    // Reference the collection in the model object
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toNextViewController"])
    {
//        NextViewController *vc = (NextViewController *)segue.destinationViewController;
//        NSDictionary *item = [self.model.collection objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
//        vc.model = self.model;
//        vc.item = item;
    }
}

@end
