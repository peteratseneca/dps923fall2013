//
//  ProfessorView.m
//  CD One
//
//  Created by Peter McIntyre on 2012/06/28.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ProfessorView.h"

@interface ProfessorView ()

@end

@implementation ProfessorView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the user interface
    self.lblFullName.text = [self.o valueForKey:@"fullName"];
    self.lblOffice.text = [NSString stringWithFormat:@"Office: %@", [self.o valueForKey:@"office"]];
    self.lblEmail.text = [self.o valueForKey:@"email"];
    self.lblWebSite.text = [self.o valueForKey:@"webSite"];
}

- (void)viewDidUnload
{
    [self setLblFullName:nil];
    [self setLblOffice:nil];
    [self setLblEmail:nil];
    [self setLblWebSite:nil];
    [super viewDidUnload];
}

@end
