//
//  ImageCell.m
//  movie
//
//  Created by oahgnehzoul on 15/7/22.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "ImageCell.h"
#import "UIImageView+WebCache.h"
@implementation ImageCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubViews];
    }
    return self;
}

- (void)_createSubViews {
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.layer.cornerRadius = 10;
    _imageView.layer.borderWidth = 1;
    _imageView.layer.masksToBounds = YES;
    _imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.contentView addSubview:_imageView];
}


- (void)setModal:(ImageModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}
- (void)layoutSubviews {
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_modal.image]];
}
@end
