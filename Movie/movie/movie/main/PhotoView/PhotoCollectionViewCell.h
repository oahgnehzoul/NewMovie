//
//  PhotoCollectionViewCell.h
//  movie
//
//  Created by oahgnehzoul on 15/7/23.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoScrollView.h"
@interface PhotoCollectionViewCell : UICollectionViewCell<UIScrollViewDelegate>
{
    PhotoScrollView *_scrollerView;
}
@property (nonatomic,copy) NSString *ImageUrlStr;
@end
