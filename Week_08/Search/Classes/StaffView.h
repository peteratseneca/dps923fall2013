//
//  StaffView.h
//  Search
//
//  Created by Peter McIntyre on 2012/08/24.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffView : UIViewController

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) Person *o;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *lblFullName;
@property (weak, nonatomic) IBOutlet UILabel *lblTelephone;
@property (weak, nonatomic) IBOutlet UILabel *lblOffice;

@end
