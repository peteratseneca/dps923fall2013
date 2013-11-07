//
//  ProfessorList.m
//  CD One
//
//  Created by Peter McIntyre on 2012/06/28.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ProfessorList.h"
#import "ProfessorView.h"

@interface ProfessorList ()

@end

@implementation ProfessorList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure and load the fetched results controller
    self.model.frc_professor.delegate = self;
    self.model.frc_professor.fetchRequest.predicate = nil;
    
    NSError *error = nil;
    [self.model.frc_professor performFetch:&error];
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.model.frc_professor sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.model.frc_professor sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    // Fetch the object that backs the current index path (row)
    NSManagedObject *o = [self.model.frc_professor objectAtIndexPath:indexPath];
    cell.textLabel.text = [o valueForKey:@"fullName"];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toProfessorView"]) {
        
        // Fetch the selected object
        NSManagedObject *o = [self.model.frc_professor objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        //Configure the next VC
        ProfessorView *nextVC = (ProfessorView *)segue.destinationViewController;
        nextVC.title = [o valueForKey:@"fullName"];
        nextVC.model = self.model;
        nextVC.o = o;
    }
}

@end
