//
//  AppEdit.h
//  CD 4 M-M +
//
//  Created by Peter McIntyre on 2012/08/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

// See the protocol definition below
@protocol EditAppDelegate;

@interface AppEdit : UIViewController <UITextFieldDelegate>

// This class needs a delegate property
@property (nonatomic, assign) id <EditAppDelegate> delegate;

@property (nonatomic, strong) Model *model;
@property (strong, nonatomic) App *detailItem;

// User interface
@property (weak, nonatomic) IBOutlet UITextView *tvErrors;
@property (weak, nonatomic) IBOutlet UITextField *tfAppName;
@property (weak, nonatomic) IBOutlet UITextField *tfTheme;
@property (weak, nonatomic) IBOutlet UILabel *lblWeek;
@property (weak, nonatomic) IBOutlet UISlider *slWeek;
@property (weak, nonatomic) IBOutlet UILabel *lblSequence;
@property (weak, nonatomic) IBOutlet UISlider *slSequence;

// User actions
- (IBAction)weekChanged:(id)sender;
- (IBAction)sequenceChanged:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end



@protocol EditAppDelegate <NSObject>

// By default, methods are "required"; you can change this by prefacing methods with "@optional"
- (void) EditAppController:(id)controller didEditItem:(id)item;

@end
