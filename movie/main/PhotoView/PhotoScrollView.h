//
//  PhotoScrollView.h
//  movie
//
//  Created by oahgnehzoul on 15/7/23.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imageView;
}
@property (nonatomic,copy)NSString *imageUrlstr;
@end
