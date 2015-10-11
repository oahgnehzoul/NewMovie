//
//  PosterDetailView.m
//  movie
//
//  Created by oahgnehzoul on 15/7/25.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "PosterDetailView.h"
#import "UIImageView+WebCache.h"
@implementation PosterDetailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setModal:(MovieModal *)modal {
    _modal = modal;
   // _starView.average = modal.average;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    _title.text = [NSString stringWithFormat:@"中文名:%@",_modal.title];
    _title.font = [UIFont systemFontOfSize:15];
    _title.numberOfLines = 0;
    _average.text = [NSString stringWithFormat:@"%.1f",_modal.average];
    _average.textColor = [UIColor whiteColor];
    _year.text = [NSString stringWithFormat:@"年份 :%@",_modal.year];
    _year.font = [UIFont systemFontOfSize:15];
    _year.textColor = [UIColor blackColor];
  //  NSLog(@"%@",_year);
    _originalTitle.text = [NSString stringWithFormat:@"外文名:%@",_modal.original_title];
    _originalTitle.font = [UIFont systemFontOfSize:15];
    _originalTitle.numberOfLines = 0;
   // NSLog(@"%@",_modal.original_title);
    NSString *imageStr = [_modal.images objectForKey:@"small"];
    [_image sd_setImageWithURL:[NSURL URLWithString:imageStr]];
    _starView.average = _modal.average;

}
@end
