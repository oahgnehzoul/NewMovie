//
//  PosterCollectionView.h
//  movie
//
//  Created by oahgnehzoul on 15/7/24.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PosterCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,retain) NSArray *movieModalArray;
@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,assign) CGFloat itemWidth;
@end
