//
//  DataService.h
//  movie
//
//  Created by oahgnehzoul on 15/7/21.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^BlockType) (id result);
@interface DataService : NSObject

+ (id)getJsonDataFromFile:(NSString *)fileName;

+ (void)requestUrl:(NSString *)url block:(BlockType)block;
@end
