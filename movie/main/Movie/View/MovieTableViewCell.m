//
//  MovieTableViewCell.m
//  movie
//
//  Created by oahgnehzoul on 15/7/20.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "MovieTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"
@implementation MovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setModal:(MovieModal *)modal {
    _modal = modal;
     _starView.average = modal.average;//!!!!
    [self setNeedsLayout];
}
- (void)layoutSubviews {
   // _iconImage = _modal.images;
   // self.backgroundColor = ]
    _titleLabel.text = _modal.title;
    _average.text = [NSString stringWithFormat:@"%.1f",_modal.average];
    _average.textColor = [UIColor whiteColor];
    _year.text = [NSString stringWithFormat:@"年份 :%@",_modal.year];
    _year.textColor = [UIColor whiteColor];
    NSString *imageStr = [_modal.images objectForKey:@"small"];
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:imageStr]];
//    UIImage *image1 = [UIImage imageNamed:@"yellow"];
//    UIImage *image2 = [UIImage imageNamed:@"gray"];
//
//    float i = _modal.average/2;
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, image1.size.width*i, image1.size.height)];
//
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, image2.size.width*5, image2.size.height)];
//    
//    view1.backgroundColor = [UIColor colorWithPatternImage:image1];
//
//    view2.backgroundColor = [UIColor colorWithPatternImage:image2];
//    [self.starView addSubview:view2];
//    [self.starView addSubview:view1];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
