//
//  HeaderViewController.m
//  movie
//
//  Created by oahgnehzoul on 15/7/27.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "HeaderViewController.h"
#import "common.h"
#import "DataService.h"
#import "UIImageView+WebCache.h"
#import "HeaderCollectionViewCell.h"
#import "MovieCommentCell.h"
#import "UIViewExt.h"
#import <MediaPlayer/MediaPlayer.h>
@interface HeaderViewController ()
{
    NSMutableArray *_commentArray;
    BOOL isSelected;
    UIView *_topView;
    CGSize contentSize;
    BOOL isBig;
    NSInteger currentIndex;
}
@end

@implementation HeaderViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"电影详情";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _createHeaderView];
    [self _loadData];
    [self _createCollectionView];
    [self _createTableView];
    }

- (void)_createHeaderView {
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 300)];
    _tableView.tableHeaderView = _topView;
    _topView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_topView];
    NSArray *views = [[NSBundle mainBundle]loadNibNamed:@"View" owner:self options:nil];
    _headView = [views lastObject];
    _headView.frame = CGRectMake(0, 0,KWidth , 190);
    [_topView addSubview:_headView];

}

- (void)_createCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 190, KWidth, 100) collectionViewLayout:layout];
    layout.itemSize = CGSizeMake((KWidth -50)/4, (KWidth-50)/4);
    //layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;

   // _collectionView.backgroundColor = [UIColor redColor];
    [_collectionView registerClass:[HeaderCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_topView addSubview:_collectionView];
}

- (void)_createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.tableHeaderView = _topView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
//     UINib *nib = [UINib nibWithNibName:@"MovieCommentCell" bundle:nil];
//    [_tableView registerNib:nib forCellReuseIdentifier:@"commentCell"];
    [_tableView registerClass:[MovieCommentCell class] forCellReuseIdentifier:@"commentCell"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _commentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCommentCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    if (cell == nil) {
        cell = [[MovieCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"commentCell"];
    }
    MovieCommentModal *modal = _commentArray[indexPath.row];
    cell.modal = modal;
  // indexPath.row = currentIndex;
    if (isBig && indexPath.row == currentIndex) {
        cell.isBigger = YES;
    }
    else {
        cell.isBigger = NO;
    }
    return cell;
}


- (void)_loadData {
    NSDictionary *dic = [DataService getJsonDataFromFile:@"movie_detail.json"];
    _modal = [[HeaderViewModal alloc] init];
    _modal.image = [dic objectForKey:@"image"];
    _modal.directors = [dic objectForKey:@"directors"];
    _modal.releases = [dic objectForKey:@"release"];
    _modal.titleCn = [dic objectForKey:@"titleCn"];
    _modal.type = [dic objectForKey:@"type"];
    _modal.actors = [dic objectForKey:@"actors"];
    _modal.videos = [dic objectForKey:@"videos"];
    _headView.modal = _modal;
    
    
    NSDictionary *commentDic = [DataService getJsonDataFromFile:@"movie_comment.json"];
    NSArray *array = [commentDic objectForKey:@"list"];
    _commentArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array) {
        MovieCommentModal *modal = [[MovieCommentModal alloc] init];
        [modal setValuesForKeysWithDictionary:dic];
        [_commentArray addObject:modal];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _modal.videos.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HeaderCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSString *imageStr = [_modal.videos[indexPath.row] objectForKey:@"image"];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageStr]];
      return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *vidioStr = [_modal.videos[indexPath.row] objectForKey:@"url"];
    MPMoviePlayerViewController *ctrl = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:vidioStr]];
    [self presentMoviePlayerViewControllerAnimated:ctrl];
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake((KWidth-20-20)/4, 90);
//}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //CGFloat cellWidth = KWidth/5;
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}
//设置单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    MovieCommentModal *modal = _commentArray[indexPath.row];
//    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
//    CGSize size = [modal.content boundingRectWithSize:CGSizeMake(KWidth - 140, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
//    return  size.height +40;
    if (isBig &&indexPath.row == currentIndex) {
        MovieCommentModal *modal = _commentArray[indexPath.row];
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        CGSize size = [modal.content boundingRectWithSize:CGSizeMake(KWidth - 140, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
        return  size.height +40;
    }
    else {
        return 80;
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offY = scrollView.contentOffset.y;
   // NSLog(@"%f",offY);
    if (offY > -64) {
        _topView.top = -offY;
    }
}
//选中时调用方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    isSelected = !isSelected;
    currentIndex = indexPath.row;
    if (isSelected) {//选中
        isBig = YES;
    }
    else { //选中
        isBig = NO;
    }
    [tableView reloadData];
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
