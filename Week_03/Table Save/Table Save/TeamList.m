//
//  TeamList.m
//  Table Save
//
//  Created by Peter McIntyre on 2012/06/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "TeamList.h"

@interface TeamList ()

@end

@implementation TeamList

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.model.nflTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    // 1) Text label
    // 2) Image
    // 3) Accessory

    // Get the (NSDictionary) object in the array that backs the tapped row
    NSDictionary *d = [self.model.nflTeams objectAtIndex:indexPath.row];
    // Set the text label to the team name
    cell.textLabel.text = [[d valueForKey:@"team"] description];
    
    // Add a team logo (the logo file name matches the team name)...
    // First, get a string for the path+filename to the team logo

	// TODO Change this to use an NSURL !!! 
    
    NSString *teamLogo = [[NSBundle mainBundle] pathForResource:cell.textLabel.text ofType:@"png"];
	// Then, set the cell's image to the team logo's PNG image
	cell.imageView.image = [UIImage imageWithContentsOfFile:teamLogo];

    // Finally, set the accessory (check mark) state
    cell.accessoryType = ([[d valueForKey:@"checked"] intValue] == 1) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This table view permits check marks on more than one single row
    
    // Get the tapped cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    // Get the (NSDictionary) object in the array that backs the tapped row
    NSDictionary *d = [self.model.nflTeams objectAtIndex:indexPath.row];
    
    // Set the check mark state
    if (cell.accessoryType == UITableViewCellAccessoryNone) 
    {
        // If un-checked (clear), then check it, and save state
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [d setValue:[NSNumber numberWithInt:1] forKey:@"checked"];
    } 
    else 
    {
        // If already checked, then clear it, and save state
        cell.accessoryType = UITableViewCellAccessoryNone;
        [d setValue:[NSNumber numberWithInt:0] forKey:@"checked"];
    }
    
    // Fade out the cell selection background
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
