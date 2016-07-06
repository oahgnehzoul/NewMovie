//
//  MovieTableViewCell.h
//  movie
//
//  Created by oahgnehzoul on 15/7/20.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModal.h"
#import "StarView.h"
@interface MovieTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
//@property (strong, nonatomic) IBOutlet UIView *average;
@property (strong, nonatomic) IBOutlet UILabel *year;
@property (strong, nonatomic) IBOutlet UILabel *average;
@property (strong, nonatomic) IBOutlet StarView *starView;

//@property (strong, nonatomic) IBOutlet UIView *averageView;
@property (strong,nonatomic) MovieModal *modal;
@end
