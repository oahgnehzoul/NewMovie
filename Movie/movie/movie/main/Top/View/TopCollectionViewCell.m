//
//  TopCollectionViewCell.m
//  movie
//
//  Created by oahgnehzoul on 15/7/21.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "TopCollectionViewCell.h"
#import "StarView.h"
#import "UIImageView+WebCache.h"
#import "common.h"
@implementation TopCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.frame = CGRectMake(0, 0, (KWidth-40)/3, 200);
}
- (void)setModal:(TopModal *)modal {
    _modal = modal;
    _starView.average = modal.average;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    NSString *str = [_modal.images objectForKey:@"medium"];
    [_image sd_setImageWithURL:[NSURL URLWithString:str]];
    _average.text = [NSString stringWithFormat:@"%.1f",_modal.average];
    _average.font = [UIFont systemFontOfSize:13];
    _average.textColor = [UIColor whiteColor];
    _title.text = _modal.title;
    _title.textAlignment = NSTextAlignmentCenter;
    _title.font = [UIFont boldSystemFontOfSize:13];
    _title.textColor = [UIColor whiteColor];
}
@end
