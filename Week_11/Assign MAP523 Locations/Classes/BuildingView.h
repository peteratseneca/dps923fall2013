//
//  BuildingView.h
//  Locations
//
//  Created by Peter McIntyre on 2013-11-18.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuildingView : UIViewController

@property (nonatomic, strong) NSDictionary *building;

@property (weak, nonatomic) IBOutlet UILabel *lblShortName;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblLevels;
@property (weak, nonatomic) IBOutlet UILabel *lblYearCompleted;
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;

@end
