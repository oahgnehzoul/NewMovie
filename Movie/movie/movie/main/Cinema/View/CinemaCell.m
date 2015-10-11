//
//  CinemaCell.m
//  movie
//
//  Created by oahgnehzoul on 15/7/22.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "CinemaCell.h"

@implementation CinemaCell

- (void)awakeFromNib {
    // Initialization code

}
- (void)setModal:(CinemaModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    _name.text = _modal.name;
    _address.text = _modal.address;
    _address.numberOfLines = 0;
    if ([_modal.isSeatSupport isEqualToString:@"1"]) {
        _isSeatSupport.image = [UIImage imageNamed:@"cinemaSeatMark"];
       // _isSeatSupport.backgroundColor = [UIColor whiteColor];
    }
    if ([_modal.isCouponSupport isEqualToString:@"1"]) {
        _isCouponSupport.image = [UIImage imageNamed:@"cinemaCouponMark"];
        
    }
    if ([_modal.isGroupBuySupport isEqualToString:@"1"]) {
        _isGroupBuySupport.image = [UIImage imageNamed:@"cinemaGrouponMark"];
    }
    if (_modal.grade == 0) {
        _grade.text = @"";
    }else {
        _grade.text = [NSString stringWithFormat:@"%.1f",_modal.grade];
    }
 //   _distance.text = [NSString stringWithFormat:@"%ldkm",_modal.distance];
    if (_modal.lowPrice == nil) {
        _lowPrice.text = @"";
    }
    else {
        _lowPrice.text = [NSString stringWithFormat:@"￥%@",_modal.lowPrice];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
