//
//  HeaderViewModal.h
//  movie
//
//  Created by oahgnehzoul on 15/7/28.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeaderViewModal : NSObject

@property (nonatomic,retain) NSArray *actors;
@property (nonatomic,retain) NSArray *directors;
@property (nonatomic,copy) NSString *image;
//@property (nonatomic,retain) NSArray *images;
@property (nonatomic,copy) NSString *titleCn;
@property (nonatomic,retain) NSArray *type;
@property (nonatomic,retain) NSDictionary *releases;
@property (nonatomic,retain) NSArray *videos;



@end
