//
//  ViewController.h
//  Array
//
//  Created by Peter McIntyre on 2012/06/06.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) Model *model;
@property (weak, nonatomic) IBOutlet UITextView *tvContent;

@end
