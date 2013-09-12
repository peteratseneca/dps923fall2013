//
//  ViewController.h
//  Text View
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate>

// User interface
@property (weak, nonatomic) IBOutlet UITextView *tvNotes;
@property (weak, nonatomic) IBOutlet UIButton *btnDone;

// User operations
- (IBAction)doneEditing:(id)sender;

@end
