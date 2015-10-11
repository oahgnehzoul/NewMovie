//
//  PostCollectionViewCell.m
//  movie
//
//  Created by oahgnehzoul on 15/7/24.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "PostCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#import "common.h"
@implementation PostCollectionViewCell
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
    [self.contentView addSubview:_imageView];
    
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"PosterDetailView" owner:self options:nil];
    _detailView  = [views lastObject];
    _detailView.frame = CGRectMake((self.width-width)/2,(self.height-height)/2, width, height);
    _detailView.hidden = YES;
    [self.contentView addSubview:_detailView];
}

- (void)setModal:(MovieModal *)modal {
    _modal = modal;
    _detailView.modal = modal;
    [self setNeedsLayout];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_isBack) {
        _detailView.hidden = NO;
        _imageView.hidden = YES;
    }
    else {
        _detailView.hidden = YES;
        _imageView.hidden = NO;
    }
    NSString *str = [_modal.images objectForKey:@"large"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
}
- (void)flipCell {
    [self _flipView:self isLeft:_imageView.hidden];
    _imageView.hidden = !_imageView.hidden;
    _detailView.hidden = !_detailView.hidden;
}
- (void)_flipView:(UIView *)view isLeft:(BOOL)isLeft {
    UIViewAnimationOptions option = isLeft ? UIViewAnimationOptionTransitionFlipFromLeft :UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionWithView:view duration:0.3 options:option animations:nil completion:nil];
}

@end
