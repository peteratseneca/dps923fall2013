//
//  NewVC.m
//  Nav Views
//
//  Created by Peter McIntyre on 2012/06/20.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "NewVC.h"

@interface NewVC ()

@end

@implementation NewVC {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.lblHello.text = self.model.data;
}

- (void)viewDidUnload
{
    [self setLblHello:nil];
    [super viewDidUnload];
}

@end
