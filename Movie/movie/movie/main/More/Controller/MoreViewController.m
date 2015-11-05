//
//  MoreViewController.m
//  movie
//
//  Created by oahgnehzoul on 15/7/17.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "MoreViewController.h"
#import "UIImageView+WebCache.h"
#import "common.h"
@interface MoreViewController ()
{
    SDImageCache *cache;
    UILabel *cacheLabel;
}
@end

@implementation MoreViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"更多";
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    [_tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor blackColor];
    [self _createTableView];
    [self _loadData];
}
- (void)_createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_tableView];
}

- (void)_loadData {
    imageNames = @[@"moreClear@2x",@"moreScore@2x",@"moreVersion@2x",@"moreBusiness@2x",@"moreAbout@2x"];
    titles = @[@"清除缓存",@"给个评价",@"检查新版本",@"商务合作",@"关于"];
    cacheLabel = [[UILabel alloc] initWithFrame:CGRectMake(KWidth-70, 15, 100, 30)];
   
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return imageNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.row == 0) {
        cache = [SDImageCache sharedImageCache];
        CGFloat size = [cache getSize];
        cacheLabel.text = [NSString stringWithFormat:@"%.2fM",size/1024/1024];
            [cell.contentView addSubview:cacheLabel];
        cacheLabel.textColor = [UIColor whiteColor];

    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = titles[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.imageView.image = [UIImage imageNamed:imageNames[indexPath.row]];
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定清除所有缓存" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
         ;
        [cache clearDisk];
        [_tableView reloadData];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
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
