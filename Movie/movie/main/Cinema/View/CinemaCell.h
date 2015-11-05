//
//  CinemaCell.h
//  movie
//
//  Created by oahgnehzoul on 15/7/22.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModal.h"
@interface CinemaCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UIImageView *isSeatSupport;
@property (strong, nonatomic) IBOutlet UIImageView *isCouponSupport;
@property (strong, nonatomic) IBOutlet UILabel *grade;
@property (weak, nonatomic) IBOutlet UIImageView *isGroupBuySupport;
@property (strong, nonatomic) IBOutlet UILabel *lowPrice;
@property (strong, nonatomic) IBOutlet UILabel *distance;

@property (nonatomic,retain) CinemaModal *modal;
@end
