//
//  MediaView.h
//  iTunes v1
//
//  Created by Peter McIntyre on 2012/10/25.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaView : UIViewController

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) NSDictionary *item;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *lblTrackName;
@property (weak, nonatomic) IBOutlet UILabel *lblCollectionName;
@property (weak, nonatomic) IBOutlet UILabel *lblReleaseDate;
@property (weak, nonatomic) IBOutlet UILabel *lblTrackPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblTrackTime;
@property (weak, nonatomic) IBOutlet UIImageView *ivArtwork;
@property (weak, nonatomic) IBOutlet UITextView *tvLongDescription;

@end
