//
//  EntityList.m
//  Graded Work
//
//  Created by Peter McIntyre on 2013-11-17.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import "EntityList.h"
#import "ProgramList.h"
#import "SubjectList.h"

@interface EntityList ()

@property (nonatomic, strong) NSArray *entities;

@end

@implementation EntityList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create the array of strings that will appear as items on the table view
    _entities = @[@"Programs", @"Subjects", @"Semesters", @"Employees", @"Students", @"Courses", @"GradedWorks"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.entities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...

    cell.textLabel.text = [self.entities objectAtIndex:indexPath.row];
    
    return cell;
}

// We will use this method to launch other table views
// The table views MUST be on the storyboard
// And they MUST have the "Storyboard ID" property set/configured

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get the string that was tapped/selected
    NSString *s = [self.entities objectAtIndex:indexPath.row];

    if ([s isEqualToString:@"Programs"])
    {
        // Programmatically create and configure the new table view
        ProgramList *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProgramList"];
        vc.model = self.model;
        vc.title = s;
        // Push it on to the navigation stack
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }

    if ([s isEqualToString:@"Subjects"]) {
        SubjectList *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SubjectList"];
        vc.model = self.model;
        vc.title = s;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }

    // If none of the above are true, deselect the row
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
