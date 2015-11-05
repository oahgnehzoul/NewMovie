//
//  CinemaModal.h
//  movie
//
//  Created by oahgnehzoul on 15/7/22.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaModal : NSObject

@property (nonatomic,copy) NSString *name;//名字
@property (nonatomic,copy) NSString *address;//地址
@property (nonatomic,assign) float grade;//评分
@property (nonatomic,copy) NSString *lowPrice;//票价
//@property (nonatomic,assign) NSInteger distance;//距离
@property (nonatomic,copy) NSString *isSeatSupport;//座
@property (nonatomic,copy) NSString *isCouponSupport;//券
@property (nonatomic,copy) NSString *isGroupBuySupport;
@property (nonatomic,copy) NSString  *districtId;//区号
@end
