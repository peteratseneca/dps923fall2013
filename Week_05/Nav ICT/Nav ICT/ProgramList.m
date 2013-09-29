//
//  ProgramList.m
//  Nav ICT
//
//  Created by Peter McIntyre on 2012/06/20.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ProgramList.h"
#import "SubjectList.h"

@interface ProgramList ()

@end

@implementation ProgramList {}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.model.programs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.textLabel.text = [[self.model.programs objectAtIndex:indexPath.row] description];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toSubjectList"]) {

        // Fetch the program name (code)
        NSString *program = [[self.model.programs objectAtIndex:[[self.tableView indexPathForSelectedRow] row]] description];
        
        // Configure and pass the data to the destination view controller
        SubjectList *nextVC = (SubjectList *)segue.destinationViewController;
        nextVC.title = [NSString stringWithFormat:@"Subjects in %@", program];
        nextVC.model = self.model;
        nextVC.subjects = [self.model subjectsInProgram:program];
    }
}

@end
