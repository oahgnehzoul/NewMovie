//
//  StarView.m
//  movie
//
//  Created by oahgnehzoul on 15/7/21.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "StarView.h"
#import "UIViewExt.h"
@implementation StarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubViews];
    }
    return self;
}
- (void)awakeFromNib {
    [self _createSubViews];
}
- (void)_createSubViews {
    
    UIImage *_yellowImage = [UIImage imageNamed:@"yellow"];
    UIImage *_grayImage = [UIImage imageNamed:@"gray"];
    _grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _grayImage.size.width*5, _grayImage.size.height)];
    _yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _yellowImage.size.width*5, _yellowImage.size.height)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:_yellowImage];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:_grayImage];
    [self addSubview:_grayView];
    [self addSubview:_yellowView];
    //放大
    float scale = self.frame.size.height /_grayImage.size.height;
    _grayView.transform = CGAffineTransformMakeScale(scale,scale);
    _yellowView.transform = CGAffineTransformMakeScale(scale,scale);
    //调整坐标
    CGRect frame = _grayView.frame;
    frame.origin = CGPointZero;
    _yellowView.frame = frame;
    _grayView.frame = frame;
}

- (void)setAverage:(float)average {
    _average = average;
    [self setNeedsLayout];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    //根据评分调整黄色星星宽度
    CGRect frame = _grayView.frame;
    frame.size.width = _average /10.0 *_grayView.frame.size.width;
    _yellowView.frame = frame;

}
@end
