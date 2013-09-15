//
//  ViewController.h
//  Picker
//
//  Created by Peter McIntyre on 2012/06/13.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

// Model
@property (nonatomic, strong) Model *model;

// User interface
@property (weak, nonatomic) IBOutlet UIPickerView *pvItems;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;

@end
