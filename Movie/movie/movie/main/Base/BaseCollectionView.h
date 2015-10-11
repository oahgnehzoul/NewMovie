//
//  BaseCollectionView.h
//  movie
//
//  Created by oahgnehzoul on 15/7/25.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,retain) NSArray *movieModalArray;
@property (nonatomic,assign) NSInteger currentindex;
@property (nonatomic,assign) CGFloat itemWidth;
@end
