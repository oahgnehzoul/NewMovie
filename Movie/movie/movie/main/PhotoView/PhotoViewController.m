//
//  PhotoViewController.m
//  movie
//
//  Created by oahgnehzoul on 15/7/23.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "PhotoViewController.h"
#define KWidth [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height
@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _createNavigation];
    [self _createCollectionView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hiddenNav) name:@"HideNavigationBarNotification" object:nil];
}
- (void)hiddenNav {
    BOOL isHidden = self.navigationController.navigationBar.isHidden;
    [self.navigationController setNavigationBarHidden:!isHidden animated:YES];
}
- (void)_createNavigation {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationController.navigationBar.translucent = YES;
}
- (void)cancelAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)_createCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(KWidth, KHeight-64);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 30;
    _collectionView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, KWidth+30, KHeight) collectionViewLayout:layout];
    _collectionView.pagingEnabled = YES;
    
    [self.view addSubview:_collectionView];

}
- (void)setImageUrlArray:(NSArray *)imageUrlArray {
    _imageUrlArray = imageUrlArray;
    _collectionView.imageUrlArray = _imageUrlArray;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.currentIndex inSection:0];
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
