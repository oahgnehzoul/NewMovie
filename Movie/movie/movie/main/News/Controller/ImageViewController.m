//
//  ImageViewController.m
//  movie
//
//  Created by oahgnehzoul on 15/7/22.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "ImageViewController.h"
#import "common.h"
#import "ImageCell.h"
#import "DataService.h"
#import "ImageModal.h"

#import "BaseNavController.h"
#import "PhotoViewController.h"
@interface ImageViewController ()

@end

@implementation ImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"厨子戏子痞子";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.view.backgroundColor = [UIColor redColor];
    [self _createCollectionView];
    [self _loadData];
}

- (void)_createCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _imageCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    layout.itemSize = CGSizeMake((KWidth -50)/4, (KWidth-50)/4);
    _imageCollectionView.delegate = self;
    _imageCollectionView.dataSource = self;
    
    [_imageCollectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_imageCollectionView];
}
- (void)_loadData {
    _imageModalArray = [[NSMutableArray alloc] init];
    NSArray *array = [DataService getJsonDataFromFile:NewsImageFile];
    for (NSDictionary *dic in array) {
        ImageModal *modal = [[ImageModal alloc] init];
        [modal setValuesForKeysWithDictionary:dic];
        [_imageModalArray addObject:modal];
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageModalArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    ImageModal *modal = _imageModalArray[indexPath.row];
    cell.modal = modal;
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   // NSLog(@"123");
    
    PhotoViewController *vc = [[PhotoViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
     vc.currentIndex = indexPath.row;
    BaseNavController *nav = [[BaseNavController alloc] initWithRootViewController:vc];
  
    NSMutableArray *imageUrlarray = [[NSMutableArray alloc] init];
    for (int i=0; i<_imageModalArray.count; i++) {
        ImageModal *modal = _imageModalArray[i];
        NSString *str = modal.image;
        [imageUrlarray addObject:str];
    }
  //  vc.view.backgroundColor = [UIColor redColor];
    vc.imageUrlArray = imageUrlarray;
    //self.view.backgroundColor = [UIColor redColor];
      [self presentViewController:nav animated:YES completion:nil];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
