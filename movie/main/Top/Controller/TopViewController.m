//
//  TopViewController.m
//  movie
//
//  Created by oahgnehzoul on 15/7/17.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "TopViewController.h"
#import "common.h"
#import "TopCollectionViewCell.h"
#import "TopModal.h"
#import "DataService.h"
#import "HeaderViewController.h"
@interface TopViewController ()

@end

@implementation TopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Top 250";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    [self _createCollectionView];
    [self _initData];
    [self _loadData];
}
#pragma mark -createCollectionView
- (void)_createCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.minimumInteritemSpacing = 10;
//    layout.minimumLineSpacing = 10;
    layout.itemSize = CGSizeMake((KWidth-40)/3, 200);
    
    _topCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _topCollectionView.dataSource = self;
    _topCollectionView.delegate = self;
    
  //  [_topCollectionView registerClass:[TopCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    UINib *nib = [UINib nibWithNibName:@"TopCollectionViewCell" bundle:[NSBundle mainBundle]];
    [_topCollectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_topCollectionView];
}
#pragma mark - initData
- (void)_initData {
    _topModalArray = [[NSMutableArray alloc] init];
}
#pragma mark - loadData 
- (void)_loadData {
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [DataService requestUrl:Top250Url block:^(id result) {
            NSArray *subjectsArray = [result objectForKey:@"subjects"];
            //  _topModalArray = [[NSMutableArray alloc] init];
            for (NSDictionary *dic in subjectsArray) {
                TopModal *modal = [[TopModal alloc] init];
                modal.images = [dic objectForKey:@"images"];
                NSNumber *number = [[dic objectForKey:@"rating"] objectForKey:@"average"];
                modal.average = [number floatValue];
                modal.title = [dic objectForKey:@"title"];
                [_topModalArray addObject:modal];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [_topCollectionView reloadData];
            });
        }];
    });
}
#pragma mark - CollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _topModalArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.modal = _topModalArray[indexPath.row];
  //  cell.backgroundColor = [UIColor brownColor];
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {    HeaderViewController *vc = [[HeaderViewController alloc ] init];
   [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
