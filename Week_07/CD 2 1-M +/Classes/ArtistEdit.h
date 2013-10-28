//
//  ArtistEdit.h
//  CD 2 1-M +
//
//  Created by Peter McIntyre on 2012/07/17.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

// See the protocol definition below
@protocol EditArtistDelegate;

@interface ArtistEdit : UIViewController <UITextFieldDelegate>

// This class needs a delegate property
@property (nonatomic, assign) id <EditArtistDelegate> delegate;

@property (nonatomic, strong) Model *model;
@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextField *tfArtistName;
@property (weak, nonatomic) IBOutlet UITextView *tvErrors;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end



// We use the delegate pattern here
// The intention is that this "add" view controller will be presented modally
// It will enable the user to enter data, and then "cancel" or "save" 
// Both methods will call a delegate method to process the entered data 
// Note that this view controller could also be used to "edit" an existing category

// The protocol's name format should be: Edit____Delegate, where the blank
// is the name of the entity / object that is being edited

@protocol EditArtistDelegate <NSObject>

// By default, methods are "required"; you can change this by prefacing methods with "@optional"
- (void) EditArtistController:(id)controller didEditItem:(id)item;

@end
