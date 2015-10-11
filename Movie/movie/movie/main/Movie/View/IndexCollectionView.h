//
//  IndexCollectionView.h
//  movie
//
//  Created by oahgnehzoul on 15/7/25.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import<UIKit/UIKit.h>

@interface IndexCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic,retain) NSArray *movieModalArray;
@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,assign) CGFloat itemWidth;

@end
