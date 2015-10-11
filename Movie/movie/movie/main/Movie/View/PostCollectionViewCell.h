//
//  PostCollectionViewCell.h
//  movie
//
//  Created by oahgnehzoul on 15/7/24.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterDetailView.h"
#import "MovieModal.h"
@interface PostCollectionViewCell : UICollectionViewCell
{
    UIImageView *_imageView;
    PosterDetailView *_detailView;
}
//@property (nonatomic,copy) NSString *imageUrlStr;
@property (nonatomic,retain) MovieModal *modal;
@property (nonatomic,assign) BOOL isBack;
- (void)flipCell;
@end
