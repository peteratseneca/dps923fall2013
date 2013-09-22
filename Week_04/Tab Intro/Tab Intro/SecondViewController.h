//
//  SecondViewController.h
//  Tab Intro
//
//  Created by Peter McIntyre on 2012/06/18.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (nonatomic, strong) Model *model;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@end
