//
//  TopCollectionViewCell.h
//  movie
//
//  Created by oahgnehzoul on 15/7/21.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopModal.h"
#import "StarView.h"
@interface TopCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *average;
@property (strong, nonatomic) IBOutlet StarView *starView;

@property (strong,nonatomic) TopModal *modal;
@end
