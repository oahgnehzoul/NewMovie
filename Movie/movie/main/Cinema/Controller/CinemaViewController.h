//
//  CinemaViewController.h
//  movie
//
//  Created by oahgnehzoul on 15/7/17.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface CinemaViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_cinemaTableView;
    NSMutableArray *_cinemaModalArray;
}
@end
