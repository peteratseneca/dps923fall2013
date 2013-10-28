//
//  TopicView.h
//  CD 3 M-M
//
//  Created by Peter McIntyre on 2012/08/16.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicView : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) NSManagedObject *o;

// User interface
@property (weak, nonatomic) IBOutlet UITextView *tvTopicDescription;
@property (weak, nonatomic) IBOutlet UIPickerView *pvApps;

@end
