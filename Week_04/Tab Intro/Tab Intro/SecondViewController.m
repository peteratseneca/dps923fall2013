//
//  SecondViewController.m
//  Tab Intro
//
//  Created by Peter McIntyre on 2012/06/18.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.lblTitle.text = self.model.data2;
}

- (void)viewDidUnload
{
    [self setLblTitle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
