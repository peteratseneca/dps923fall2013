//
//  RatingsView.m
//  TV Ratings
//
//  Created by Peter McIntyre on 2012/10/25.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import "RatingsView.h"
#import "Rating.h"

@implementation RatingsView

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.rating)
    {
        // Configure the user interface
        self.lblProgramName.text = self.rating.programName;
        self.lblNetwork.text = [NSString stringWithFormat:@"Network: %@", self.rating.network];
        self.lblRank.text = [NSString stringWithFormat:@"Rank: %d", self.rating.rank];
        self.lblViewers.text = [NSString stringWithFormat:@"Viewers: %d", self.rating.viewers];
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
