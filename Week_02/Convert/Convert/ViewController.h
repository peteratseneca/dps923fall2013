//
//  ViewController.h
//  Convert
//
//  Created by Peter McIntyre on 2012/06/04.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Text fields in the user interface
@property (weak, nonatomic) IBOutlet UITextField *tfInteger;
@property (weak, nonatomic) IBOutlet UITextField *tfFloat;
@property (weak, nonatomic) IBOutlet UITextField *tfDouble;

// Labels in the user interface
@property (weak, nonatomic) IBOutlet UILabel *lblInteger;
@property (weak, nonatomic) IBOutlet UILabel *lblFloat;
@property (weak, nonatomic) IBOutlet UILabel *lblDouble;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;

// Segmented control
@property (weak, nonatomic) IBOutlet UISegmentedControl *segOperation;

// Action methods
- (IBAction)doOperation:(id)sender;
- (IBAction)startAgain:(id)sender;

@end
