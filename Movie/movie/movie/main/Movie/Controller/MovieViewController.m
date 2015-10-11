//
//  MovieViewController.m
//  movie
//
//  Created by oahgnehzoul on 15/7/17.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "MovieViewController.h"
#import "BaseNavController.h"
#import "MovieModal.h"
#import "MovieTableViewCell.h"
#import "DataService.h"
#import "common.h"
#import "AFNetworking.h"
#define KWidth [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height
@interface MovieViewController ()
{
  //  BOOL index ;
  //  UIButton *button;
  //  BOOL isLeft;
    NSDictionary *resultDic;
}
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self _setNavigation];
    [self _createMovieTableView];
    [self _createPosterView];
    [self _loadData];
  
}

#pragma mark - MainViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"电影";
    }
    return self;
}
#pragma mark - SetNavigation
- (void)_setNavigation {
   /* UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [button setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    index = YES;*/
    UIView *flipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    button1.tag = 1;
    [button1 sizeToFit];
    [button1 addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
    [flipView addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    button2.tag = 2;
    [button2 sizeToFit];
    [button2 addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
    [flipView addSubview:button2];
    button2.hidden = YES;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:flipView];
    self.navigationItem.rightBarButtonItem = item;
}
#pragma mark createPosterView
- (void)_createPosterView {
    _posterView = [[PostView alloc] initWithFrame:self.view.bounds];
   [self.view addSubview:_posterView];
}
#pragma mark createMovieTableView
- (void)_createMovieTableView {
    _movieTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //！设置代理 从而调用 代理方法
    _movieTableView.delegate = self;
    _movieTableView.dataSource = self;
    [self.view addSubview:_movieTableView];
    _movieTableView.hidden = YES;
    
    UINib *nib = [UINib nibWithNibName:@"MovieTableViewCell" bundle:[NSBundle mainBundle]];
    [_movieTableView registerNib:nib forCellReuseIdentifier:@"cell"];
    _movieTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
}
#pragma mark - loadData
//把json数据读取到 modal对象数组 里面
- (void)_loadData {
//    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"us_box.json" ofType:nil];
//    NSData *data = [NSData dataWithContentsOfFile:filePath];
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        resultDic = [DataService requestUrl:Us_boxUrl block:^(id result) {
//            NSLog(@"123");
//        }];
//    });

     dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [DataService requestUrl:Us_boxUrl block:^(id result) {
            resultDic = result;
             NSArray *subjectsArray = [resultDic objectForKey:@"subjects"];
             _movieModalArray = [[NSMutableArray alloc] init];
             
             for (NSDictionary *dic in subjectsArray) {
                 NSDictionary *subject = [dic objectForKey:@"subject"];
                 MovieModal *modal = [[MovieModal alloc] init];
                 modal.title = [subject objectForKey:@"title"];
                 NSNumber *number = [[subject objectForKey:@"rating"] objectForKey:@"average"];
                 modal.images = [subject objectForKey:@"images"];
                 modal.average = [number floatValue];
                 modal.year = [subject objectForKey:@"year"];
                 modal.original_title = [subject objectForKey:@"original_title"];
                 [_movieModalArray addObject:modal];
             }
                dispatch_async(dispatch_get_main_queue(), ^{
                  _posterView.movieModalArray = _movieModalArray;
             });
         }];
         
     });

}
#pragma mark - Action
- (void)flipAction:(UIButton *)button {
    UIView *flipView = self.navigationItem.rightBarButtonItem.customView;
    UIButton *btn1 = (UIButton *)[flipView viewWithTag:1];
    UIButton *btn2 = (UIButton *)[flipView viewWithTag:2];
    
   // isLeft = !isLeft;
    BOOL isLeft = btn2.hidden;
    [self _flipView:flipView isLeft:isLeft];
    [self _flipView:self.view isLeft:isLeft];
    btn1.hidden = !btn1.hidden;
    btn2.hidden = !btn2.hidden;
    
    _movieTableView.hidden = !_movieTableView.hidden;
    _posterView.hidden = !_posterView.hidden;
}
#pragma mark - Tools
- (void)_flipView:(UIView *)view isLeft:(BOOL)isLeft {
  //  Left = isLeft;
   UIViewAnimationOptions option = isLeft ? UIViewAnimationOptionTransitionFlipFromLeft :UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionWithView:view duration:0.3 options:option animations:nil completion:nil];
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _movieModalArray.count;
}
//创建cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    MovieModal *modal = _movieModalArray[indexPath.row];
   // cell.textLabel.text = modal.title;
  //  NSLog(@"%@",cell.textLabel.text);
   // self.modal = modal;
    cell.modal = modal;
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
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
