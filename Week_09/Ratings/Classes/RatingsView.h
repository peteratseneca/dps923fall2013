//
//  RatingsView.h
//  TV Ratings
//
//  Created by Peter McIntyre on 2012/10/25.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingsView : UIViewController

@property (nonatomic, strong) NSDictionary *dataItem;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *lblProgramName;
@property (weak, nonatomic) IBOutlet UILabel *lblRank;
@property (weak, nonatomic) IBOutlet UILabel *lblNetwork;
@property (weak, nonatomic) IBOutlet UILabel *lblViewers;

@end
