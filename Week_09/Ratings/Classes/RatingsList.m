//
//  RatingsList.m
//  TV Ratings
//
//  Created by Peter McIntyre on 2012/10/25.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import "RatingsList.h"
#import "RatingsView.h"
#import "AFNetworking.h"

@interface RatingsList ()
{
    // Array of television show audience numbers and ratings
    NSArray *_ratings;
}

- (void)callWebService;

@end

@implementation RatingsList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Make the row height bigger
    self.tableView.rowHeight = 55.0;
    
    // Initialize the _ratings array so that the tableView:cellForRowAtIndexPath: works
    _ratings = [[NSArray alloc] init];

    // Fetch the data
    [self callWebService];
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (_ratings.count == 0) ? 1 : _ratings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    if (_ratings.count == 0)
    {
        // Show a message, and disable selection/tapping
        cell.textLabel.text = @"Loading...";
        cell.accessoryType = UITableViewCellAccessoryNone;
        tableView.allowsSelection = NO;
    }
    else
    {
        // Un-do the settings above
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        tableView.allowsSelection = YES;
        // Show the data
        NSDictionary *d = [_ratings objectAtIndex:indexPath.row];
        cell.textLabel.text = [d valueForKey:@"Program Name"];
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[d valueForKey:@"Network"]]];
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toRatingsView"])
    {
        RatingsView *vc = (RatingsView *)segue.destinationViewController;
        NSDictionary *dataItem = [_ratings objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        vc.dataItem = dataItem;
        vc.title = [dataItem valueForKey:@"Program Name"];
    }
}

#pragma mark - Fetch data over the network

- (void)callWebService
{
    // Create and configure a request object
    NSURL *url = [NSURL URLWithString:@"http://matrix.senecac.on.ca/~peter.mcintyre/tvratings.json"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    // Create and configure an AFNetworking JSON request operation
    // Notice that the initializer uses "blocks" for the success and failure arguments
    
    AFJSONRequestOperation *operation =
        [AFJSONRequestOperation JSONRequestOperationWithRequest:request
            success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
            {
                _ratings = (NSArray *)JSON;
                //_ratings = [JSON objectForKey:@"results"];
                [self.tableView reloadData];
            }
            failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
            {
                NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
            }
         ];
    
    // Start the operation
    [operation start];
}

@end
