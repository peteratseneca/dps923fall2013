//
//  FirstViewController.m
//  Tab Intro
//
//  Created by Peter McIntyre on 2012/06/18.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.lblTitle.text = self.model.data1;
}

- (void)viewDidUnload
{
    [self setLblTitle:nil];
    [super viewDidUnload];
}

@end
