//
//  ViewController.h
//  Alert Action
//
//  Created by Peter McIntyre on 2012/06/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

// Add the alert view and action sheet delegate protocols

@interface ViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>

// User interface
@property (weak, nonatomic) IBOutlet UILabel *lblAlert;
@property (weak, nonatomic) IBOutlet UILabel *lblAction;

// User interactions
- (IBAction)showAlert:(id)sender;
- (IBAction)showAction:(id)sender;

@end
