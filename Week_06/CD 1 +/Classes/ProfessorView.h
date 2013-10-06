//
//  ProfessorView.h
//  CD One
//
//  Created by Peter McIntyre on 2012/06/28.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfessorView : UIViewController

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) NSManagedObject *o;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *lblFullName;
@property (weak, nonatomic) IBOutlet UILabel *lblOffice;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UILabel *lblWebSite;

@end
