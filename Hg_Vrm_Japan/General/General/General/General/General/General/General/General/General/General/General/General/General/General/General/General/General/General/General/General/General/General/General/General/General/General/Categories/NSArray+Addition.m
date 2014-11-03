//
//  NSArray+Addition.m
//  XZhuang
//
//  Created by zouliangming on 14-10-10.
//  Copyright (c) 2014年 Sensu. All rights reserved.
//

#import "NSArray+Addition.h"

@implementation NSArray(Plist)

- (BOOL)writeToPlistFile:(NSString *)filePath {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    BOOL didWriteSuccessful = [data writeToFile:filePath atomically:YES];
    return didWriteSuccessful;
}

+(NSArray *)readFromPlistFile:(NSString *)filePath{
    NSData * data = [NSData dataWithContentsOfFile:filePath];
    return  [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
