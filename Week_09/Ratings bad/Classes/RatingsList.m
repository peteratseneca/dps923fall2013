//
//  RatingsList.m
//  TV Ratings
//
//  Created by Peter McIntyre on 2012/10/25.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import "RatingsList.h"
#import "RatingsView.h"

@interface RatingsList ()
{
    // Data stream to hold the incoming data from the network
    NSMutableData *_ratingsData;
    
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
    // In this method, we'll do all we need to get some data from the network, including:
	// 1. Create an NSURLConnection (and all that it needs)
	// 2. Call the web service, and receive the results
	// 3. In the delegate methods, process the results
    
    // This method is called by the custom property getters (for the collection properties)
    // The idea is that the custom property getter will return the collection,
    // if available, otherwise, it returns an empty collection, and calls this method
    // The delegate method will transform the data, and set the collection property value,
    // and then post a notification, so that the user interface can update itself
    // (typically by simply requesting the property's value again)
	
	// Prepare the NSMutableData receiver
    _ratingsData = [[NSMutableData alloc] init];
    
	// Create and configure a request object
    NSURL *url = [NSURL URLWithString:@"http://matrix.senecac.on.ca/~peter.mcintyre/tvratings.json"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
	// Create a connection
    // Notice the cast to void to suppress a compiler warning
	(void)[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
	// Reference the app's network activity indicator in the status bar
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
	// Reference the app's network activity indicator in the status bar
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	
	NSLog(@"%@", [error description]);
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // Optional implementation
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	// Append the incoming data to the data stream object
	[_ratingsData appendData:data];
    NSLog(@"%@", [data description]);
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    
	// Reference the app's network activity indicator in the status bar
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    // Convert the network data into a situation-specific data structure
    _ratings = (NSArray *)[NSJSONSerialization JSONObjectWithData:_ratingsData options:NSJSONReadingAllowFragments error:nil];

    // Finally, reload the table view
    [self.tableView reloadData];
}

@end
