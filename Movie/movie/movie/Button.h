//
//  Button.h
//  movie
//
//  Created by oahgnehzoul on 15/7/17.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Button : UIControl
{
    UIImageView *_imgView;
    UILabel *_label;
}

- (id)initWithFrame:(CGRect)frame AndImageName:(NSString *)imageName AndTitle:(NSString *)title;
@end
