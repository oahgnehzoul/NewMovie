//
//  NewsTableViewCell.m
//  movie
//
//  Created by oahgnehzoul on 15/7/20.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "common.h"
@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.frame = CGRectMake(0, 0,KWidth, 90);
//    NSLog(@"%f",self.frame.size.width);
}

- (void)setModal:(NewsModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    NSString *imgStr = _modal.image;
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:imgStr]];
    _title.text = _modal.title;
//    _title.font = [UIFont systemFontOfSize:18];
    _title.numberOfLines = 0;
    _title.font = [UIFont boldSystemFontOfSize:17];
    _title.textColor = [UIColor blackColor];
    
    _summary.text = _modal.summary;
    _summary.textColor = [UIColor orangeColor];
    _summary.font = [UIFont boldSystemFontOfSize:14];
    UIImage *image1 = [UIImage imageNamed:@"sctpxw"];
    UIImage *image2 = [UIImage imageNamed:@"scspxw"];
    if (_modal.type == 1) {
        [_button1 setBackgroundImage:image1 forState:UIControlStateNormal];
       // newsViewController *vc = [[newsViewController alloc] init];
    }
    if (_modal.type == 2) {
        [_button1 setBackgroundImage:image2 forState:UIControlStateNormal];
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
