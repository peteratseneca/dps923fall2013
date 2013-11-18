//
//  BuildingView.m
//  Locations
//
//  Created by Peter McIntyre on 2013-11-18.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import "BuildingView.h"

@interface BuildingView ()

@end

@implementation BuildingView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.lblShortName.text = [self.building valueForKey:@"ShortName"];
    self.lblName.text = [self.building valueForKey:@"Name"];
    self.lblLevels.text = [NSString stringWithFormat:@"Height in levels: %d", [[self.building valueForKey:@"Levels"] intValue]];
    self.lblYearCompleted.text = [NSString stringWithFormat:@"Year completed: %d", [[self.building valueForKey:@"YearCompleted"] intValue]];
    self.tvDescription.text = [self.building valueForKey:@"Description"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
