//
//  SubjectList.m
//  Nav ICT
//
//  Created by Peter McIntyre on 2012/06/20.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "SubjectList.h"
#import "SubjectDetail.h"

@interface SubjectList ()

@end

@implementation SubjectList {}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.subjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.textLabel.text = [[self.subjects objectAtIndex:indexPath.row] description];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toSubjectDetail"]) {
        
        // Fetch the data that backs the tapped row
        NSString *subject = [[self.subjects objectAtIndex:[[self.tableView indexPathForSelectedRow] row]] description];
        
        // Configure and pass on data to the next level view controller
        SubjectDetail *nextVC = (SubjectDetail *)segue.destinationViewController;
        nextVC.title = [NSString stringWithFormat:@"%@ detail", subject];
        nextVC.model = self.model;
        nextVC.subject = [self.model subject:subject];
    }
}

@end
