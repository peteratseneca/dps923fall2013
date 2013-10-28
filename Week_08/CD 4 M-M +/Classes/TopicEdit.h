//
//  TopicEdit.h
//  CD 4 M-M +
//
//  Created by Peter McIntyre on 2012/08/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

// See the protocol definition below
@protocol EditTopicDelegate;

@interface TopicEdit : UIViewController <UITextFieldDelegate>

// This class needs a delegate property
@property (nonatomic, assign) id <EditTopicDelegate> delegate;

@property (nonatomic, strong) Model *model;
@property (strong, nonatomic) Topic *detailItem;

// User interface
@property (weak, nonatomic) IBOutlet UITextField *tfTopicName;
@property (weak, nonatomic) IBOutlet UITextField *tfTopicDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblTopicNumber;
@property (weak, nonatomic) IBOutlet UISlider *slTopicNumber;
@property (weak, nonatomic) IBOutlet UITextView *tvErrors;

// User actions
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)sequenceChanged:(id)sender;

@end



@protocol EditTopicDelegate <NSObject>

// By default, methods are "required"; you can change this by prefacing methods with "@optional"
- (void) EditTopicController:(id)controller didEditItem:(id)item;

@end
