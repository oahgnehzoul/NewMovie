//
//  NewsViewController.h
//  movie
//
//  Created by oahgnehzoul on 15/7/17.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface NewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_newsTableView;
    NSMutableArray *_newsModalArray;//存放newsModal对象数组
}
@end
