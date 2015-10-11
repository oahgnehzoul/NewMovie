//
//  MovieModal.m
//  movie
//
//  Created by oahgnehzoul on 15/7/20.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "MovieModal.h"

@implementation MovieModal

//-(NSString *)description {
//   // NSString *str = [NSString stringWithFormat:@";"]
//}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"rating"]) {
        _average = [[value objectForKey:@"average"] floatValue];
    }
}
@end
