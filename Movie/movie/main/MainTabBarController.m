//
//  MainTabBarController.m
//  movie
//
//  Created by oahgnehzoul on 15/7/17.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "MainTabBarController.h"
#import "MovieViewController.h"
#import "NewsViewController.h"
#import "TopViewController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"
#import "Button.h"
#import "BaseNavController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _createViewControllers];
    [self _setTabBar];
}
- (void)btnAction:(UIButton *)btn {
    NSInteger index = btn.tag;
    self.selectedIndex = index;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    
    _selectImageView.center = btn.center;
    [UIView commitAnimations];
}
- (void)_createViewControllers {
    MovieViewController *vc1 = [[MovieViewController alloc] init];
    NewsViewController *vc2 = [[NewsViewController alloc] init];
    TopViewController *vc3 = [[TopViewController alloc] init];
    CinemaViewController *vc4 = [[CinemaViewController alloc] init];
    MoreViewController *vc5 = [[MoreViewController alloc] init];
    NSArray *vcArray = @[vc1,vc2,vc3,vc4,vc5];
    NSMutableArray *navArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<5; i++) {
        BaseNavController *nav = [[BaseNavController alloc]initWithRootViewController:vcArray[i]];
        [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all"] forBarMetrics:UIBarMetricsDefault];
        nav.navigationBar.barStyle = UIBarStyleBlack ;
        [navArray addObject:nav];
    }
    self.viewControllers = navArray;
}

- (void)_setTabBar {
    //移除tabBar子视图
    Class cls = NSClassFromString(@"UITabBarButton");
   // NSStringFromClass(<#__unsafe_unretained Class aClass#>)
    for (UIView *subView in self.tabBar.subviews) {
        if ([subView isKindOfClass:cls]) {
            [subView removeFromSuperview];
        }
    }
   // NSLog(@"%@",self.tabBarItem.title);
    //TabBar背景
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tab_bg_all"];
    self.tabBar.translucent = YES;
    //button子视图
    NSArray *imageName = @[@"movie_cinema",@"msg_new",@"start_top250",@"icon_cinema",@"more_select_setting"];
    CGFloat width = CGRectGetWidth(self.tabBar.frame)/5;
    CGFloat height = CGRectGetHeight(self.tabBar.frame);
    NSArray *titles = @[@"电影",@"新闻",@"Top",@"影院",@"更多"];
//    for (int i=0; i<5; i++) {
//        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i*width, 0, width, height)];
//        [button setTitle:titles[i] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:imageName[i]] forState:UIControlStateNormal];
//        button.titleLabel.font = [UIFont systemFontOfSize:11];
//        button.titleEdgeInsets = UIEdgeInsetsMake(30, -18, 0, 0);
//        button.imageEdgeInsets = UIEdgeInsetsMake(-10, 20, 0, 0);
//        [self.tabBar addSubview:button];
  //  }
    _selectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    _selectImageView.image = [UIImage imageNamed:@"selectTabbar_bg_all1@2x"];
    [self.tabBar addSubview:_selectImageView];
    for (int i = 0;i < 5;i++) {
        CGRect frame = CGRectMake(i*width, 0, width, height);
        Button *button = [[Button alloc] initWithFrame:frame AndImageName:imageName[i] AndTitle:titles[i]];
        button.tag = i;
        [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:button];
//        if (i == 4) {
//            [button removeFromSuperview];
//        }
    }

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
