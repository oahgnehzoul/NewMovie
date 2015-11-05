//
//  PosterDetailView.h
//  movie
//
//  Created by oahgnehzoul on 15/7/25.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModal.h"
#import "StarView.h"
@interface PosterDetailView : UIView

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *originalTitle;

@property (strong, nonatomic) IBOutlet UILabel *average;
@property (nonatomic,retain) MovieModal *modal;
@property (strong, nonatomic) IBOutlet UILabel *year;
@property (strong, nonatomic) IBOutlet StarView *starView;

@end
