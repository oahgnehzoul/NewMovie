//
//  MovieViewController.h
//  movie
//
//  Created by oahgnehzoul on 15/7/17.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MovieModal.h"
#import "PostView.h"
@interface MovieViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_movieTableView;
    PostView *_posterView;//海报页面
    NSMutableArray *_movieModalArray;//存放modal对象数组
}
//@property (nonatomic,strong) MovieModal *modal;
@end
