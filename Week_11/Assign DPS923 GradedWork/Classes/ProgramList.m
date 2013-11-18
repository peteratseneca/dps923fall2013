//
//  ProgramList.m
//  Graded Work
//
//  Created by Peter McIntyre on 2013-11-17.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import "ProgramList.h"
#import "ProgramView.h"

@interface ProgramList ()

@end

@implementation ProgramList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Register for a notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI:) name:@"SuccessGetPrograms" object:nil];
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
    return (self.model.programs.count == 0) ? 1 : self.model.programs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (self.model.programs.count == 0)
    {
        // Show a message, and disable selection/tapping
        cell.textLabel.text = @"Loading...";
        cell.detailTextLabel.text = @"Waiting for the Program list";
        cell.accessoryType = UITableViewCellAccessoryNone;
        tableView.allowsSelection = NO;
    }
    else
    {
        // Un-do the settings above
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        tableView.allowsSelection = YES;
        // Show the data
        NSDictionary *d = [self.model.programs objectAtIndex:indexPath.row];
        cell.textLabel.text = [d valueForKey:@"Code"];
        cell.detailTextLabel.text = [d valueForKey:@"Name"];
    }

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toProgramView"]) {
        ProgramView *vc = (ProgramView *)segue.destinationViewController;
        NSDictionary *program = [self.model.programs objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        vc.program = program;
        vc.title = [program valueForKey:@"Code"];
    }
}

@end
