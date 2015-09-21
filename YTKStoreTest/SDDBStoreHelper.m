//
//  SDDBStoreHelper.m
//  YTKStoreTest
//
//  Created by yurongde on 15/9/21.
//  Copyright © 2015年 yurongde. All rights reserved.
//

#import "SDDBStoreHelper.h"

@implementation SDDBStoreHelper
+ (YTKKeyValueStore *)shareStore {
    static YTKKeyValueStore *shareStore = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    shareStore = [[YTKKeyValueStore alloc]initDBWithName:DB_Name];
    });
    return shareStore;
}
@end
