//
//  IndexCollectionViewCell.h
//  movie
//
//  Created by oahgnehzoul on 15/7/25.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModal.h"
@interface IndexCollectionViewCell : UICollectionViewCell
{
    UIImageView *_imageView;
}
@property (nonatomic,retain) MovieModal *modal;
@end
