//
//  MovieModal.h
//  movie
//
//  Created by oahgnehzoul on 15/7/20.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModal : NSObject

@property(nonatomic,retain) NSDictionary *images;
@property(nonatomic,assign) float average;
@property(nonatomic,copy) NSString *title;//电影名
@property(nonatomic,copy) NSString *year;

@property(nonatomic,copy) NSString *original_title;
@end
