//
//  ViewController.h
//  Array To Do
//
//  Created by Peter McIntyre on 2012/06/07.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Data model
@property (nonatomic, strong) Model *model;

// User interface outlets
@property (weak, nonatomic) IBOutlet UITextField *tfItem;
@property (weak, nonatomic) IBOutlet UITextView *tvResult;

// User interface action
- (IBAction)addItem:(id)sender;

@end
