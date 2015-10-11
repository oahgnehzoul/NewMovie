//
//  GuideViewController.m
//  movie
//
//  Created by oahgnehzoul on 15/7/27.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "GuideViewController.h"
#import "common.h"
#import "LaunchViewController.h"
@interface GuideViewController ()
{
    UIButton *_button;
//    UIScrollView *_scrollView;
}
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self _createSubView];
}

- (void)_createSubView {
//    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KHeight)];
//    [self.view addSubview:_scrollView];
    for (int i=0; i<5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"guide%d@2x.png",i+1];
        NSString *pageImageName = [NSString stringWithFormat:@"guideProgress%d.png",i+1];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake( KWidth*i, 0,KWidth,KHeight)];
        imageView.image = [UIImage imageNamed:imageName];
        [_scrollView addSubview:imageView];
        
        UIImageView *pageImageView = [[UIImageView alloc] initWithFrame:CGRectMake((KWidth-173)/2+KWidth*i, KHeight-50, 173, 26)];
        pageImageView.image = [UIImage imageNamed:pageImageName];
        [_scrollView addSubview:pageImageView];
        
    }
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(KWidth*5, KHeight);
//#warning 打印contentSize
//    NSLog(@"%f",_scrollView.contentSize.width);
    _scrollView.pagingEnabled = YES;
    _button = [[UIButton alloc] initWithFrame:CGRectMake((KWidth-100)/2, KHeight-100, 100, 30)];
    [_button setTitle:@"点击进入" forState:UIControlStateNormal];
    _button.titleLabel.textColor = [UIColor whiteColor];
    //_button.backgroundColor = [UIColor yellowColor];
    _button.hidden = YES;
    [_button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSInteger index = scrollView.contentOffset.x / KWidth;
//#warning 打印index
//    NSLog(@"%f",scrollView.contentOffset.x);
//    NSLog(@"%ld",index);
//    if (index == 4) {
//        _button.hidden = NO;
//    }else {
//        _button.hidden = YES;
//    }
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / KWidth;
//#warning 打印index
//    NSLog(@"%f",scrollView.contentOffset.x);
//    NSLog(@"%ld",index);
    if (index == 4) {
        _button.hidden = NO;
    }else {
        _button.hidden = YES;
    }

}
- (void)btnAction:(UIButton *)button {
    LaunchViewController *vc = [[LaunchViewController alloc] init];
    self.view.window.rootViewController = vc;
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
