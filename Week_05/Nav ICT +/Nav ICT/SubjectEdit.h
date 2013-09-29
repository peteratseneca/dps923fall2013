//
//  SubjectEdit.h
//  Nav ICT +
//
//  Created by Peter McIntyre on 2012/08/13.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditSubjectDelegate;

@interface SubjectEdit : UIViewController <UITextFieldDelegate, UITextViewDelegate>

// Data for the controller
@property (nonatomic, strong) Model *model;
@property (strong, nonatomic) id detailItem;

// Delegate property
@property (nonatomic, weak) id <EditSubjectDelegate> delegate;

// User interface
@property (weak, nonatomic) IBOutlet UITextField *tfSubjectCode;
@property (weak, nonatomic) IBOutlet UITextField *tfSubjectName;
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
@property (weak, nonatomic) IBOutlet UITextView *tvErrors;

// User operations
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end



@protocol EditSubjectDelegate <NSObject>

// By default, methods are "required"; you can change this by prefacing methods with "@optional"
- (void) EditSubjectController:(id)controller didEditItem:(id)item;

@end
