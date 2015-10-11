//
//  MovieCommentCell.m
//  movie
//
//  Created by oahgnehzoul on 15/7/28.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "MovieCommentCell.h"
#import "UIImageView+WebCache.h"
#import "common.h"
@implementation MovieCommentCell

- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _createContentView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)_createContentView {
    _uerImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    _nickNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nickNameLabel.font = [UIFont systemFontOfSize:12];
    _ratingLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _ratingLabel.font = [UIFont systemFontOfSize:12];
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _contentLabel.font = [UIFont systemFontOfSize:15];
    _bgImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_uerImage];
    [self.contentView addSubview:_bgImageView];
    [self.contentView addSubview:_nickNameLabel];
    [self.contentView addSubview:_ratingLabel];
    [self.contentView addSubview:_contentLabel];
    
}
- (void)setModal:(MovieCommentModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}

- (void)layoutSubviews {

//    _nickName.text = _modal.nickname;
//    _rating.text = _modal.rating;
//    _content.text = _modal.content;
    NSString *imageStr = _modal.userImage;
    [_uerImage sd_setImageWithURL:[NSURL URLWithString:imageStr]];
    _nickNameLabel.text = _modal.nickname;
    _ratingLabel.text = _modal.rating;
    _contentLabel.text = _modal.content;
    _contentLabel.numberOfLines = 0;
   // NSLog(@"%@",_contentLabel.text);
    UIImage *bgImage = [UIImage imageNamed:@"movieDetail_comments_frame"];
    bgImage = [bgImage stretchableImageWithLeftCapWidth:bgImage.size.width*0.5 topCapHeight:bgImage.size.height*0.7];
    _bgImageView.image = bgImage;
    
    CGFloat macLabelWidth = KWidth -140;
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    CGSize contentSize = [_modal.content boundingRectWithSize:CGSizeMake(macLabelWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    _uerImage.frame = CGRectMake(10, 10, 40, 40);
//    _bgImageView.frame = CGRectMake(60, 10, KWidth-70, contentSize.height+30);
//    _contentLabel.frame = CGRectMake(80, 30, contentSize.width+20, contentSize.height);
    if (_isBigger) {
        _bgImageView.frame = CGRectMake(60, 10, KWidth-70, contentSize.height+30);
        _contentLabel.frame = CGRectMake(80, 30, contentSize.width+20, contentSize.height);
    }
    else {
        _bgImageView.frame = CGRectMake(60, 10, KWidth-70, 60);
        _contentLabel.frame = CGRectMake(80, 30, KWidth-120, 30);
    }
    _ratingLabel.frame = CGRectMake(KWidth-70, 10, 60, 20);
    _nickNameLabel.frame = CGRectMake(80, 10, 90, 20);
}
@end
