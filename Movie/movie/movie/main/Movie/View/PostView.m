//
//  PostView.m
//  movie
//
//  Created by oahgnehzoul on 15/7/24.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "PostView.h"
#import "common.h"
#import "UIViewExt.h"
#import "MovieModal.h"
#define kTabBarHeight 49
#define KHeight [UIScreen mainScreen].bounds.size.height
#define kHeaderViewH 136 //头视图高度
#define kIndexCollectionViewH 100 //小海报collectionView 高度
#define kBottomTitleLableH 35 //底部label高度
#define kBottomTitleLableY (KHeight-kTabBarHeight-kBottomTitleLableH) //底部label坐标Y
#define kHeaderOffH   36 // 头视图的偏移
#define kPosterColletionViewY  (kHeaderViewH-kHeaderOffH) //头视图Y坐标
#define kPosterColletionViewH  (KHeight-kPosterColletionViewY-kTabBarHeight-kBottomTitleLableH) // 大海报collectionView高度
@implementation PostView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _createPosterCollectionView];
        
        [self _createCoverView];
        [self _createHeaderView];
        [self _createGesture];
        [self _createBottomLabel];
        [_indexCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        [_postCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSNumber *number = [change objectForKey:@"new"];
    NSInteger index = [number integerValue];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    if ([object isKindOfClass:[PosterCollectionView class]]&&_indexCollectionView.currentIndex
        != index) {
        [_indexCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _indexCollectionView.currentIndex = index;
    }
    if ([object isKindOfClass:[_indexCollectionView class]] &&_postCollectionView.currentIndex != index) {
        [_postCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _postCollectionView.currentIndex = index;
    }
    MovieModal *modal = _movieModalArray[index];
    _bottomLabel.text = modal.title;
  //  NSLog(@"%@",_bottomLabel.text);
}
#pragma mark - createHeaderView
//添加头视图
- (void)_createHeaderView {
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -kHeaderOffH, KWidth, kHeaderViewH)];
   // _headerView.backgroundColor = [UIColor redColor];
    [self addSubview:_headerView];
    
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_headerView.bounds];
    imageView.image = image;
    [_headerView addSubview:imageView];
    //小海报
//    UIView *indexView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, kIndexCollectionViewH)];
    UICollectionViewFlowLayout *indexLayout = [[UICollectionViewFlowLayout alloc] init];
    _indexCollectionView = [[IndexCollectionView alloc]initWithFrame:CGRectMake(0, 0, KWidth,kIndexCollectionViewH)  collectionViewLayout:indexLayout];
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake((KWidth-30)/5,0, (KWidth-30)/5, kIndexCollectionViewH)];
    imageView1.image = [UIImage imageNamed:@"light"];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake((KWidth-30)/5*3+10,0, (KWidth-30)/5, kIndexCollectionViewH)];
    imageView2.image = [UIImage imageNamed:@"light"];
    indexLayout.minimumInteritemSpacing =0;
    indexLayout.minimumLineSpacing =0;
    indexLayout.scrollDirection =UICollectionViewScrollDirectionHorizontal;
  //  indexLayout.itemSize = CGSizeMake(kIndexCollectionViewH*0.5, kIndexCollectionViewH);
   // _indexCollectionView.backgroundColor = [UIColor greenColor];
    [_headerView addSubview:_indexCollectionView];
    [_headerView addSubview:imageView1];
    [_headerView addSubview:imageView2];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((KWidth-20)/2, kHeaderViewH-25, 20, 20)];
    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    button.tag = 100;
    [button addTarget:self action:@selector(pullAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:button];
}
- (void)pullAction:(UIButton *)button {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    if (button.selected == NO) {
        [self showHeader];
    }
    else {
        [self hideHeader];
    }
    button.selected = !button.selected;
    [UIView commitAnimations];
}
- (void)showHeader {
    _headerView.top = 64;
    _coverView.hidden = NO;
}
- (void)hideHeader {
    _headerView.top = -36;
    _coverView.hidden = YES;
}
#pragma mark - createCoverView
//添加灰色笼罩视图
- (void)_createCoverView {
    _coverView = [[UIControl alloc] initWithFrame:self.bounds];
    _coverView.backgroundColor = [UIColor colorWithWhite:1 alpha:.8];
    _coverView.hidden = YES;
    [_coverView addTarget:self action:@selector(coverTapAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_coverView];
}
- (void)coverTapAction:(UIControl *)control {
    NSLog(@"coverView");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    UIButton *button = (UIButton *)[_headerView viewWithTag:100];
    button.selected = !button.selected;
    [self hideHeader];
    [UIView commitAnimations];

}
#pragma mark - createPosterCollectionview
//添加海报页面
- (void)_createPosterCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    _postCollectionView = [[PosterCollectionView alloc] initWithFrame:CGRectMake(0, kPosterColletionViewY, KWidth, kPosterColletionViewH) collectionViewLayout:layout];
    _postCollectionView.itemWidth = KWidth*3/4;//!!!
   // _postCollectionView.backgroundColor = [UIColor yellowColor];
    [self addSubview:_postCollectionView];
}
- (void)setMovieModalArray:(NSArray *)movieModalArray {
    _movieModalArray = movieModalArray;
    _postCollectionView.movieModalArray = movieModalArray;
    _indexCollectionView.movieModalArray = movieModalArray;
    _bottomLabel.text = [movieModalArray[0] title];
}
#pragma mark -createBottomLabel
//添加底部label
- (void)_createBottomLabel {
    _bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kBottomTitleLableY, KWidth, kBottomTitleLableH)];
   // _bottomLabel.backgroundColor = [UIColor blueColor];
    _bottomLabel.textColor = [UIColor whiteColor];
    _bottomLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_bottomLabel];
}
#pragma mark -createGesture
//轻扫手势
- (void)_createGesture {
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDownAction)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipeDown];
}
- (void)swipeDownAction {
    NSLog(@"清扫手势");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    //_coverView.hidden = NO;
    
    [self showHeader];
    UIButton *button = (UIButton*)[_headerView viewWithTag:100];
    
    button.selected = !button.selected;
    [UIView commitAnimations];
}
@end
