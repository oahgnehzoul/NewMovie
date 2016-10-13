//
//  DataService.m
//  movie
//
//  Created by oahgnehzoul on 15/7/21.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "DataService.h"
#import "common.h"
#import "AFNetworking.h"
@implementation DataService

+ (id)getJsonDataFromFile:(NSString *)fileName {
    NSString *filePath = [[NSBundle mainBundle]pathForResource:fileName ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    id jsonDicOrArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return jsonDicOrArray;
}

+ (void)requestUrl:(NSString *)url block:(BlockType)block {

    NSString *fullUrlStr = [NSString stringWithFormat:@"%@%@",BaseUrl,url];
    NSURL *paraUrl = [NSURL URLWithString:fullUrlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:paraUrl];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * operation, id responseObject) {
        if (block) {
            block(responseObject);
        }

    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
            }];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

@end
