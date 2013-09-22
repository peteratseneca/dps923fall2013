//
//  ItemEdit.h
//  To Do Add
//
//  Created by Peter McIntyre on 2012/06/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditItemDelegate;

@interface ItemEdit : UIViewController

// Delegate property
@property (nonatomic, weak) id <EditItemDelegate> delegate;

// User interface
@property (weak, nonatomic) IBOutlet UITextField *tfItem;

// User operations
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end

@protocol EditItemDelegate <NSObject>

// By default, methods are "required"; you can change this by prefacing methods with "@optional"
- (void) EditItemController:(id)controller didEditItem:(id)item;

@end










