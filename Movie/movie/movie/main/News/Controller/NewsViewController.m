//
//  NewsViewController.m
//  movie
//
//  Created by oahgnehzoul on 15/7/17.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "NewsViewController.h"
#import "common.h"
#import "NewsModal.h"
#import "NewsTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DataService.h"
#import "UIViewExt.h"
#import "ImageViewController.h"
#import "NewsDetailViewController.h"
@interface NewsViewController ()
{
    NSArray *array;
    UIImageView *headImageView;
    UILabel *headerLabel;
}
@end

@implementation NewsViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"新闻";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor orangeColor]];
    [self _setNewsTableView];
    [self _setHeaderView];
    [self _loadData];
  //  NSLog(@"%@",headerLabel.text);
}
//添加headerView
- (void)_setHeaderView {
   // self.navigationController.navigationBar.translucent = YES;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    _newsTableView.tableHeaderView = headerView;
    headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, KWidth, 200)];
    UIImage *image = [UIImage imageNamed:@"1"];
    headImageView.image = image;
    [self.view addSubview:headImageView];
    headerView.backgroundColor = [UIColor redColor];

    headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KWidth, 20)];
    headerLabel.bottom = headImageView.bottom;
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = [UIColor whiteColor];
   // NSLog(@"%@",headerLabel.text);
    [self.view addSubview:headerLabel];

}
#pragma mark - setNewsTableView
- (void)_setNewsTableView {
    _newsTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _newsTableView.delegate = self;
    _newsTableView.dataSource = self;
    [self.view addSubview:_newsTableView];
    UINib *nib = [UINib nibWithNibName:@"NewsTableViewCell" bundle:nil];
    [_newsTableView registerNib:nib forCellReuseIdentifier:@"cell"];
}
#pragma mark - loadData
- (void)_loadData {
    array = [DataService getJsonDataFromFile:@"news_list.json"];
    _newsModalArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array) {
        NewsModal *modal = [[NewsModal alloc] init];
        [modal setValuesForKeysWithDictionary:dic];
        [_newsModalArray addObject:modal];
    }
    NSString *title = [_newsModalArray[0] title];
    headerLabel.text = title;
   // NSLog(@"%@",title);
    NSString *imageStr = (NSString *)[_newsModalArray[0] image];
//#warning 打印str
//    NSLog(@"%@",imageStr);
    [headImageView sd_setImageWithURL:[NSURL URLWithString:imageStr]];
//    NSLog(@"%@",headImageView.image);
    [_newsModalArray removeObjectAtIndex:0];
}
#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsModalArray.count ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NewsModal *modal = _newsModalArray[indexPath.row];
    cell.modal = modal;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offY = scrollView.contentOffset.y;
   
  // 导航栏不透明
//    if (offY > 0){
//        headImageView.top = -offY;
//        headerLabel.bottom = headImageView.bottom;
//    }
//
//    else {
//        CGFloat newHeight = -offY +200;
//        CGFloat newWidth = KWidth/200*newHeight;
//        headImageView.frame = CGRectMake((KWidth -newWidth)/2, 0, newWidth, newHeight);
//        headerLabel.bottom = headImageView.bottom;
//    }
    if (offY > -64) {
        headImageView.top = -offY;
        headerLabel.bottom = headImageView.bottom;
    }
    else {
        CGFloat newHeight = ABS(offY) -64+200;
        CGFloat newWidth = KWidth/200*newHeight;
        headImageView.frame = CGRectMake((KWidth -newWidth)/2, 64, newWidth, newHeight);
        headerLabel.bottom = headImageView.bottom;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsModal *modal = _newsModalArray[indexPath.row];
    if (modal.type == 0) {
        NewsDetailViewController *vc = [[NewsDetailViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (modal.type == 1) {
        ImageViewController *vc = [[ImageViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
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
