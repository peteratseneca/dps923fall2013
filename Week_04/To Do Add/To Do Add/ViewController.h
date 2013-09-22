//
//  ViewController.h
//  To Do Add
//
//  Created by Peter McIntyre on 2012/06/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemEdit.h"

@interface ViewController : UIViewController <EditItemDelegate>

@property (nonatomic, strong) Model *model;

@property (weak, nonatomic) IBOutlet UITextView *tvItems;

@end
