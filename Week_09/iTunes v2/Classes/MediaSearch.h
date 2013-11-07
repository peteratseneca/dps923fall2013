//
//  MediaSearch.h
//  iTunes v2
//
//  Created by Peter McIntyre on 2012/10/26.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaSearch : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) Model *model;

// User interface
@property (weak, nonatomic) IBOutlet UITextField *tfArtist;
@property (weak, nonatomic) IBOutlet UITextField *tfAlbum;
@property (weak, nonatomic) IBOutlet UITextField *tfSong;
@property (weak, nonatomic) IBOutlet UILabel *lblError;
@property (weak, nonatomic) IBOutlet UIButton *btnSearch;

@end
