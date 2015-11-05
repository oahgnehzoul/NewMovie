//
//  PhotoCollectionViewCell.m
//  movie
//
//  Created by oahgnehzoul on 15/7/23.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "PhotoScrollView.h"
#define KWidth [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height
@implementation PhotoCollectionViewCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _createScrollerViews];
    }
    return  self;
}

- (void)_createScrollerViews {
    _scrollerView = [[PhotoScrollView alloc] initWithFrame:self.bounds];
    _scrollerView.bounces = YES;
    _scrollerView.contentSize = CGSizeMake(KWidth, KHeight);
    _scrollerView.tag = 100;
    [self.contentView addSubview:_scrollerView];
}
- (void)setImageUrlStr:(NSString *)ImageUrlStr {
    _ImageUrlStr = ImageUrlStr;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _scrollerView.imageUrlstr = _ImageUrlStr;
}
@end
