//
//  NewsDetailViewController.m
//  movie
//
//  Created by oahgnehzoul on 15/7/27.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建webView
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
//    NSURLRequest *requset = [[NSURLRequest alloc] initWithURL:url];
//    [webView loadRequest:requset];
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"news.html" ofType:nil];
    NSString *htmlStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:htmlStr baseURL:nil];
    [self.view addSubview:webView];
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
