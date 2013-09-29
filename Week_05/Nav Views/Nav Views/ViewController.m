//
//  ViewController.m
//  Nav Views
//
//  Created by Peter McIntyre on 2012/06/19.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"
#import "NewVC.h"

@interface ViewController ()

@end

@implementation ViewController {}

#pragma mark - User operations

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure you check the segue identifier
    if ([segue.identifier isEqualToString:@"toNewVC"])
    {
        // Get a reference to the next-level view controller
        NewVC *nextVC = segue.destinationViewController;
        // Pass on the data
        nextVC.model = self.model;
    }
}

@end
