//
//  LaunchViewController.m
//  movie
//
//  Created by oahgnehzoul on 15/7/27.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "LaunchViewController.h"
#import "common.h"
#import "UIViewExt.h"
#import "MainTabBarController.h"
@interface LaunchViewController ()
{
    NSMutableArray *imageViewArray;//存放图片
    NSInteger index;
}
@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"thumb_IMG_1682_1024.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
    
    [self _createImageView];
    [self startAnimation];
}
//创建图片视图
- (void)_createImageView {
    int count = 24;
    CGFloat width = KWidth/4;//图片的宽
    CGFloat height = KHeight/6;
    CGFloat x = 0;
    CGFloat y = 0;
    imageViewArray = [NSMutableArray array];
    for (int i=0; i<count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        imageView.alpha = 0;
    
        NSString *imageName = [NSString stringWithFormat:@"%d.png",i+1];
        imageView.image = [UIImage imageNamed:imageName];
        [self.view addSubview:imageView];
        [imageViewArray addObject:imageView];
        if (i<=3) {
            x = i*width;
            y = 0;
        }
        else if (i<=8) {
            x = width*3;
            y = (i-3)*height;
        }
        else if (i<=11) {
            x = (11-i)*width;
            y = height*5;
        }
        
        else if (i<=15) {
            x = 0;
            y = (16-i)*height;
        }
        else if (i<=17) {
            x = (i-15)*width;
            y = height;
        }
        else if (i<=20) {
            x = 2*width;
            y = (i-16)*height;
        }
        else if (i <=23) {
            x = width;
            y = (25-i)*height;
        }
        imageView.origin = CGPointMake(x, y);
    }
}
- (void)startAnimation {
    if (index >= imageViewArray.count) {
        UIWindow *window = self.view.window;
        MainTabBarController *mainCtrl = [[MainTabBarController alloc] init];
        mainCtrl.view.transform = CGAffineTransformMakeScale(.2, .2);
        [UIView animateWithDuration:.1 animations:^{mainCtrl.view.transform = CGAffineTransformIdentity;
        }];
        window.rootViewController = mainCtrl;
        return;
    }
    UIImageView *imageView = imageViewArray[index];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.5];
    imageView.alpha = 1;
    [UIView commitAnimations];
    index++;
    [self performSelector:@selector(startAnimation) withObject:nil afterDelay:.2];
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
