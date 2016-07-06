//
//  HeaderCollectionViewCell.h
//  movie
//
//  Created by oahgnehzoul on 15/7/28.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderViewModal.h"
@interface HeaderCollectionViewCell : UICollectionViewCell
//{
//    UIImageView *_imageView;
//}
@property (nonatomic,retain) UIImageView *imageView;
@property (nonatomic,retain) HeaderViewModal *modal;
@end
