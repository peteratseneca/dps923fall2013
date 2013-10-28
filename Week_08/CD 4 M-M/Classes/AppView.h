//
//  AppView.h
//  CD 3 M-M
//
//  Created by Peter McIntyre on 2012/08/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppView : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) App *o;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *lblTheme;
@property (weak, nonatomic) IBOutlet UIPickerView *pvTopics;

@end
