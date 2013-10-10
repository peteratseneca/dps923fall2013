//
//  SongEdit.h
//  CD 2 1-M +
//
//  Created by Peter McIntyre on 2012/07/24.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditSongDelegate;

@interface SongEdit : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) id detailItem;

// This class needs a delegate property
@property (nonatomic, assign) id <EditSongDelegate> delegate;

// User interface
@property (weak, nonatomic) IBOutlet UITextField *tfSongName;
@property (weak, nonatomic) IBOutlet UITextField *tfComposer;
@property (weak, nonatomic) IBOutlet UITextView *tvErrors;
@property (weak, nonatomic) IBOutlet UIPickerView *pvYear;

// User operations
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end



@protocol EditSongDelegate <NSObject>

- (void) EditSongController:(id)controller didEditItem:(id)item;

@end
