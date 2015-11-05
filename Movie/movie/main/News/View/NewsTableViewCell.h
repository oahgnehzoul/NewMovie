//
//  NewsTableViewCell.h
//  movie
//
//  Created by oahgnehzoul on 15/7/20.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModal.h"
@interface NewsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *summary;

@property (strong, nonatomic) IBOutlet UIButton *button1;



@property(strong,nonatomic) NewsModal *modal;
@end
