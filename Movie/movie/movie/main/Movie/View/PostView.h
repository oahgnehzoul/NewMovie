//
//  PostView.h
//  movie
//
//  Created by oahgnehzoul on 15/7/24.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"
@interface PostView : UIView
{
    UIView *_headerView;
    PosterCollectionView *_postCollectionView;
    UILabel *_bottomLabel;
    UIControl *_coverView;
    IndexCollectionView *_indexCollectionView;
}
@property (nonatomic,retain) NSArray *movieModalArray;
@end
