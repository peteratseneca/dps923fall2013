//
//  ColorList.m
//  Nav Colors
//
//  Created by Peter McIntyre on 2012/06/01.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ColorList.h"
#import "ColorDetail.h"

@interface ColorList ()

@end

@implementation ColorList {}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.model.colorDict count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    cell.textLabel.text = [self.model.colorNames objectAtIndex:indexPath.row];

    // Set the cell image; the Images group has <colorname>.png files
	// First, get a string for the path+filename to the color dot
	NSString *colorDot = [[NSBundle mainBundle] pathForResource:cell.textLabel.text ofType:@"png"];

	// Now, set the cell's image to the matching png image
	cell.imageView.image = [UIImage imageWithContentsOfFile:colorDot];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toColorDetail"])
    {
        // Get the color name that has been tapped/selected
        NSString *colorName = [self.model.colorNames objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        
        // Un-comment the following code to use the dictionary's color information
        // to set the background color of the ColorDetail view
        
        /*
         // Get the dictionary for the color
         NSDictionary *color = [self.model.colorDict objectForKey:colorName];
         
         // Make a UIColor object from the color data that's stored in the dictionary
         UIColor *backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:[color objectForKey:@"color"]];
         
         // Set the destination view controller (i.e. ColorDetail) view to the desired color
         [[[segue destinationViewController] view] setBackgroundColor:backgroundColor];
         */
        
        ColorDetail *nextVC = [segue destinationViewController];
        nextVC.title = colorName;
        
        // Notice this coding pattern...
        
        // When you wish to assign values to objects on the view (e.g. label, image view),
        // you must make sure that the view exists in memory before you assign
        
        // To do this, use the following "if (nextVC.view)" syntax
        // If you access this property and its value is currently nil,
        // the view controller automatically calls the loadView method,
        // and returns the resulting view
        if (nextVC.view)
        {
            nextVC.lblColor.text = colorName;
            NSString *colorDot = [[NSBundle mainBundle] pathForResource:colorName ofType:@"png"];
            nextVC.imgColor.image = [UIImage imageWithContentsOfFile:colorDot];
        }
        
        // The alternative to using this coding pattern is to create
        // a property (or two) on the destination view controller,
        // and then pass the data; then, in the destination's viewDidLoad:
        // method, it can assign the data to the objects on the view
    }
}

@end
