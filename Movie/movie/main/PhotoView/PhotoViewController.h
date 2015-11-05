//
//  PhotoViewController.h
//  movie
//
//  Created by oahgnehzoul on 15/7/23.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionView.h"
@interface PhotoViewController : UIViewController
{
    PhotoCollectionView *_collectionView;
}
@property (nonatomic,retain) NSArray *imageUrlArray;

@property (nonatomic,assign) NSInteger currentIndex;
@end
