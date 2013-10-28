//
//  AppMenu.h
//  CD Fetches
//
//  Created by Peter McIntyre on 2012/08/30.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppMenu : UITableViewController

@property (nonatomic, strong) Model *model;

@property (weak, nonatomic) IBOutlet UILabel *lblCounts;
@property (weak, nonatomic) IBOutlet UILabel *lblMinDate;

@end
