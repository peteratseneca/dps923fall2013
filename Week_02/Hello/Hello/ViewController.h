//
//  ViewController.h
//  Hello
//
//  Created by Peter McIntyre on 2012/06/01.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// These are outlets
// They enable us to get access to the user interface objects
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;

// This is an action method
- (IBAction)DoSomething:(id)sender;

@end
