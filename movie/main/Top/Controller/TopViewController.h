//
//  TopViewController.h
//  movie
//
//  Created by oahgnehzoul on 15/7/17.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_topCollectionView;
    NSMutableArray *_topModalArray;
}
@end
