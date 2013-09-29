//
//  NewVC.h
//  Nav Views
//
//  Created by Peter McIntyre on 2012/06/20.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewVC : UIViewController

@property (nonatomic, strong) Model *model;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *lblHello;

@end
