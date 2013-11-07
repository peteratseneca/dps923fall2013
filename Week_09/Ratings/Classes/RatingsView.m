//
//  RatingsView.m
//  TV Ratings
//
//  Created by Peter McIntyre on 2012/10/25.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import "RatingsView.h"

@implementation RatingsView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.dataItem)
    {
        // Configure the user interface
        
        self.lblProgramName.text = [self.dataItem valueForKey:@"Program Name"];
        
        self.lblNetwork.text = [NSString stringWithFormat:@"Network: %@", [self.dataItem valueForKey:@"Network"]];
        
        self.lblRank.text = [NSString stringWithFormat:@"Rank: %@", [[self.dataItem valueForKey:@"Rank"] description]];
        
        self.lblViewers.text = [NSString stringWithFormat:@"Viewers: %@", [[self.dataItem valueForKey:@"Viewers"] description]];
    }
}

- (void)viewDidUnload
{
    [self setLblProgramName:nil];
    [self setLblRank:nil];
    [self setLblNetwork:nil];
    [self setLblViewers:nil];
    [super viewDidUnload];
}

@end
