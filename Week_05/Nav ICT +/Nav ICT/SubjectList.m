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
    // Navigation push
    if ([segue.identifier isEqualToString:@"toSubjectDetail"]) {
        
        // Fetch the data that backs the tapped row
        NSString *subject = [[self.subjects objectAtIndex:[[self.tableView indexPathForSelectedRow] row]] description];
        
        // Configure and pass on data to the next level view controller
        SubjectDetail *nextVC = (SubjectDetail *)segue.destinationViewController;
        nextVC.title = [NSString stringWithFormat:@"%@ detail", subject];
        nextVC.model = self.model;
        nextVC.subject = [self.model subject:subject];
    }
    
    // Modal add/edit
    if ([segue.identifier isEqualToString:@"toSubjectEdit"]) {
        // Configure the next VC (it's embedded in a nav controller)
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        SubjectEdit *nextVC = (SubjectEdit *)nav.topViewController;
        nextVC.model = self.model;
        nextVC.delegate = self;
    }
}

#pragma mark - Delegate methods

- (void)EditSubjectController:(id)controller didEditItem:(id)item
{
    // Dismiss the modal view controller
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:NULL];

    // Add a new object to the store, only if an object was passed in
    if (item) {
        NSDictionary *d = (NSDictionary *)item;

        // Call into the model
        [self.model addNewSubject:[d valueForKey:@"subjectCode"] named:[d valueForKey:@"subjectName"] inProgram:self.program withDescription:[d valueForKey:@"description"] andURL:[d valueForKey:@"subjectOutlineURL"]];
        
        // Reload the table view - must refresh from the data source
        self.subjects = [self.model subjectsInProgram:self.program];
        [self.tableView reloadData];
    }
}

@end
