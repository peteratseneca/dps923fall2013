//
//  ColourList.m
//  Table Multi
//
//  Created by Peter McIntyre on 2012/06/14.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ColourList.h"

@interface ColourList ()

@end

@implementation ColourList

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // There's only one section in our table view
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Number of rows? The model object's array count
    return [self.model.colorNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...

    // Add a visible label
    cell.textLabel.text = [[self.model.colorNames objectAtIndex:indexPath.row] description];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This table view allows more than one cell to have a check mark
    // It's way easier than the "Table Single" algorithm

    // Get the cell that was tapped
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];

    // Set its checked state
    cell.accessoryType = (cell.accessoryType == UITableViewCellAccessoryNone) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    // Fade out the cell selection background
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
