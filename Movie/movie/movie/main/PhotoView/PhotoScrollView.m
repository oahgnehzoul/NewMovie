//
//  PhotoScrollView.m
//  movie
//
//  Created by oahgnehzoul on 15/7/23.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "PhotoScrollView.h"
#import "UIImageView+WebCache.h"
@implementation PhotoScrollView


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeCenter;
        self.minimumZoomScale = 1;
        self.maximumZoomScale = 3;
        self.delegate = self;
        [self addSubview:_imageView];
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap)];
        doubleTap.numberOfTapsRequired = 2;
        doubleTap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:doubleTap];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap)];
        [self addGestureRecognizer:singleTap];
        [singleTap requireGestureRecognizerToFail:doubleTap];
    }
    return self;
}
- (void)doubleTap {
    if (self.zoomScale == 1) {
        [self setZoomScale:3 animated:YES];
    }
    else {
        [self setZoomScale:1 animated:YES];
    }
}
- (void)singleTap {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"HideNavigationBarNotification" object:nil];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}
- (void)setImageUrlstr:(NSString *)imageUrlstr {
    _imageUrlstr = imageUrlstr;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_imageUrlstr]];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
}

@end
