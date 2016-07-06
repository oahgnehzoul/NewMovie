//
//  ImageCell.h
//  movie
//
//  Created by oahgnehzoul on 15/7/22.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModal.h"
@interface ImageCell : UICollectionViewCell
{
    UIImageView *_imageView;
}
@property (nonatomic,retain) ImageModal *modal;
@end
