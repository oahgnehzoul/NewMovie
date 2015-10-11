//
//  IndexCollectionView.m
//  movie
//
//  Created by oahgnehzoul on 15/7/25.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "IndexCollectionView.h"
#import "IndexCollectionViewCell.h"
#import "MovieModal.h"
#import "common.h"
#import "UIViewExt.h"
@implementation IndexCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id) initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        // self.pagingEnabled = YES;
        [self registerClass:[IndexCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _movieModalArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IndexCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    MovieModal *modal = _movieModalArray[indexPath.row];
    cell.modal = modal;
    return cell;
}
- (void)setMovieModalArray:(NSArray *)movieModalArray {
    _movieModalArray = movieModalArray;
    [self reloadData];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //CGFloat cellWidth = KWidth/5;
    
    return UIEdgeInsetsMake(0, (KWidth-self.itemWidth)/2, 0, (KWidth-self.itemWidth)/2);
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.width/5, self.height);
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
    self.currentIndex = index;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentIndex = indexPath.row;
}
@end
