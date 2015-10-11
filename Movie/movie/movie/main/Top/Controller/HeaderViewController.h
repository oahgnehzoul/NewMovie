//
//  HeaderViewController.h
//  movie
//
//  Created by oahgnehzoul on 15/7/27.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "BaseViewController.h"
#import "HeaderView.h"
#import "HeaderViewModal.h"
#import "MovieCommentModal.h"
@interface HeaderViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    HeaderView *_headView;
    UICollectionView *_collectionView;
    UITableView *_tableView;
}
@property (nonatomic,retain) HeaderViewModal *modal;
@property (nonatomic,retain) MovieCommentModal *commentModal;
@end
