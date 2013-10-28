//
//  AlbumEdit.h
//  CD 2 1-M +
//
//  Created by Peter McIntyre on 2012/07/23.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditAlbumDelegate;

@interface AlbumEdit : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) id detailItem;

// This class needs a delegate property
@property (nonatomic, assign) id <EditAlbumDelegate> delegate;

// User interface
@property (weak, nonatomic) IBOutlet UITextField *tfAlbumName;
@property (weak, nonatomic) IBOutlet UITextField *tfGenre;
@property (weak, nonatomic) IBOutlet UIDatePicker *pvReleaseDate;
@property (weak, nonatomic) IBOutlet UITextView *tvErrors;

// User operations
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end



@protocol EditAlbumDelegate <NSObject>

- (void) EditAlbumController:(id)controller didEditItem:(id)item;

@end
