//
//  ViewController.m
//  Table Single
//
//  Created by Peter McIntyre on 2012/06/14.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    // Table view row that is showing a check mark
    NSIndexPath *_checkedRow;
}

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize the checked row
    _checkedRow = nil;
}

#pragma mark - Table view delegate

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
    
    // While this if-else isn't necessary for this code example, 
    // because the table view is less than one screen in size, 
    // and we do not permit scrolling, it has been included for completeness

    if ([_checkedRow isEqual:indexPath])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } 
    else 
    {
        // This is the default outcome
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This table view allows a single cell to have a check mark
    
    // Algorithm:
    // Use a private instance variable (ivar) to keep track of the check marked cell
    // If there is an existing check mark, then remove it 
    // Get the cell that was tapped
    // Compare the old check marked cell with the cell that was tapped
    // If they're equal, then remove the check mark (because it was already checked) (and save the state)
    // Otherwise, add a check mark (and save the state)

    // If there is an existing check mark, then remove it
    if (_checkedRow)
    {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:_checkedRow];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Get the cell that was tapped
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];

    // Compare the old check marked cell with the cell that was tapped
    if ([_checkedRow isEqual:indexPath])
    {
        // Was check marked, so remove the check mark
        cell.accessoryType = UITableViewCellAccessoryNone;
        // Save the check mark state
        _checkedRow = nil;
    } 
    else 
    {
        // Add the check mark
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        // Save the check mark state
        _checkedRow = indexPath;
    }

    // Fade out the cell selection background
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}















@end
