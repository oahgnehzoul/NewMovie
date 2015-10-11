//
//  HeaderView.m
//  movie
//
//  Created by oahgnehzoul on 15/7/27.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "HeaderView.h"
#import "UIImageView+WebCache.h"
@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setModal:(HeaderViewModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    _titleCn.text = _modal.titleCn;
    _director.text = _modal.directors[0];
    NSString *imgStr = _modal.image;
    [_image sd_setImageWithURL:[NSURL URLWithString:imgStr]];
    _actors.text = [NSString stringWithFormat:@"%@,%@,%@,%@,%@",_modal.actors[0],_modal.actors[1],_modal.actors[2],_modal.actors[3],_modal.actors[4]];
   // NSLog(@"%@",_modal.actors[0]);
    _type.text = [NSString stringWithFormat:@"%@,%@,%@,%@",_modal.type[0],_modal.type[1],_modal.type[2],_modal.type[3]];
    _releases.text = [NSString stringWithFormat:@"%@,%@",[_modal.releases objectForKey:@"location"],[_modal.releases objectForKey:@"date"]];
}
@end
