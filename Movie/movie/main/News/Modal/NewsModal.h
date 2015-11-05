//
//  NewsModal.h
//  movie
//
//  Created by oahgnehzoul on 15/7/20.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModal : NSObject

@property (nonatomic,retain) NSString *image;
@property (nonatomic,copy) NSString *title;//标题
@property (nonatomic,copy) NSString *summary;//摘要
@property (nonatomic,assign) NSInteger type;//类型
@property (nonatomic,assign) NSInteger newId;
@end
