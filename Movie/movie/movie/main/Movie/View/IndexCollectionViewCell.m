//
//  IndexCollectionViewCell.m
//  movie
//
//  Created by oahgnehzoul on 15/7/25.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "IndexCollectionViewCell.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
@implementation IndexCollectionViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
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
}

- (void)setModal:(MovieModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    NSString *str = [_modal.images objectForKey:@"large"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
}

@end
