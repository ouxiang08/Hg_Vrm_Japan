//
//  NSArray+Addition.h
//  XZhuang
//
//  Created by zouliangming on 14-10-10.
//  Copyright (c) 2014年 Sensu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(Plist)

- (BOOL)writeToPlistFile:(NSString *)filePath;
+(NSArray *)readFromPlistFile:(NSString *)filePath;

@end
