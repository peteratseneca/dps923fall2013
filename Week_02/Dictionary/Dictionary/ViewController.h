//
//  ViewController.h
//  Dictionary
//
//  Created by Peter McIntyre on 2012/06/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) Model *model;

// User interface outlets
@property (weak, nonatomic) IBOutlet UITextField *tfFirstName;
@property (weak, nonatomic) IBOutlet UITextField *tfLastName;
@property (weak, nonatomic) IBOutlet UILabel *lblAge;
@property (weak, nonatomic) IBOutlet UISlider *slAge;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segProgram;
@property (weak, nonatomic) IBOutlet UITextView *tvContent;

// User interface actions
- (IBAction)updatedSlider:(id)sender;
- (IBAction)updatedSegment:(id)sender;

@end
