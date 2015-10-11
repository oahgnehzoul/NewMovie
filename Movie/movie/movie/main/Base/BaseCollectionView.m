//
//  BaseCollectionView.m
//  movie
//
//  Created by oahgnehzoul on 15/7/25.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "BaseCollectionView.h"
#import "common.h"
@implementation BaseCollectionView

//- (UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return cell;
//}
- (id) initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _movieModalArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}
- (void)setMovieModalArray:(NSArray *)movieModalArray {
    _movieModalArray = movieModalArray;
    [self reloadData];
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //CGFloat cellWidth = self.itemWidth;
    
    return UIEdgeInsetsMake(0, (KWidth-self.itemWidth)/2, 0, (KWidth-self.itemWidth)/2);
    
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGFloat x = targetContentOffset->x;
    CGFloat itemWidth = self.itemWidth;
    NSInteger index = x/itemWidth;
    //targetContentOffset->x = index *itemWidth;
    if (index <0) {
        index=0;
    }else if(index>=_movieModalArray.count){
        index = _movieModalArray.count -1;
    }
    self.currentindex = index;
    
}

@end
