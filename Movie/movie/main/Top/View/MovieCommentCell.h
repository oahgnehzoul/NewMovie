//
//  MovieCommentCell.h
//  movie
//
//  Created by oahgnehzoul on 15/7/28.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCommentModal.h"
@interface MovieCommentCell : UITableViewCell
{
    UIImageView *_uerImage;
    UILabel *_nickNameLabel;
    UILabel *_ratingLabel;
    UILabel *_contentLabel;
    UIImageView *_bgImageView;
}


@property (nonatomic,retain) MovieCommentModal *modal;
@property (nonatomic,assign) BOOL isBigger;
@end
