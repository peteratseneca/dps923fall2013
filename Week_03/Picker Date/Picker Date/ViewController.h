//
//  ViewController.h
//  Picker Date
//
//  Created by Peter McIntyre on 2012/06/13.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// User interface
@property (weak, nonatomic) IBOutlet UIDatePicker *pvDate;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;

// User interaction
- (IBAction)dateWasSelected:(id)sender;

@end
