//
//  StaffView.m
//  Search
//
//  Created by Peter McIntyre on 2012/08/24.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "StaffView.h"

@interface StaffView ()

@end

@implementation StaffView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.lblFullName.text = self.o.fullName;
    self.lblTelephone.text = [NSString stringWithFormat:@"Telephone: %@", self.o.telephone];
    self.lblOffice.text = [NSString stringWithFormat:@"Office: %@", self.o.office];
}

- (void)viewDidUnload
{
    [self setLblFullName:nil];
    [self setLblTelephone:nil];
    [self setLblOffice:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
