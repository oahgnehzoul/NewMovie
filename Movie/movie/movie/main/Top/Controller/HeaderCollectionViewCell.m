//
//  HeaderCollectionViewCell.m
//  movie
//
//  Created by oahgnehzoul on 15/7/28.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "HeaderCollectionViewCell.h"
#import "UIViewExt.h"
@implementation HeaderCollectionViewCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubViews];
    }
    return self;
}
- (void)_createSubViews {
    CGFloat width = self.width*0.9;
    CGFloat height = self.height*0.9;
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width-width)/2,(self.height-height)/2, width, height)];
    _imageView.layer.cornerRadius = 10;
    _imageView.layer.borderWidth = 1;
    _imageView.layer.masksToBounds = YES;
    _imageView.layer.borderColor = [UIColor whiteColor].CGColor;

    [self.contentView addSubview:_imageView];
}

- (void)setModal:(HeaderViewModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.backgroundColor = [UIColor yellowColor];
   // NSArray *array = _modal.videos;
    
//    NSString *str = [_modal.videos objectForKey:@"large"];
//    [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
}

@end
