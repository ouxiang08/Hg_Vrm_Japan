//
//  XZDataStore.m
//  XZhuang
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 Sensu. All rights reserved.
//

#import "HGDataStore.h"

static HGDataStore *shareInstance = nil;

@implementation HGDataStore

+ (HGDataStore *) sharedObject{
    if (nil == shareInstance) {
        @synchronized(self) {
            if (shareInstance == nil) {
                shareInstance = [[self alloc] init]; //assignment not done here
            }
        }
    }
    return shareInstance;
}

- (void) saveUserJson: (NSString *)userJson{

    [[NSUserDefaults standardUserDefaults] setObject:userJson  forKey:KUserJson];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)userJson{

    NSString *bduid = [[NSUserDefaults standardUserDefaults] objectForKey:KUserJson];
    if (bduid==nil) {
        return @"";
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:KUserJson];
}

- (void) saveUserInfo:(NSDictionary *)userInfo{

    [[NSUserDefaults standardUserDefaults] setObject:userInfo  forKey:KUserInfo];
	[[NSUserDefaults standardUserDefaults] synchronize];
}
- (NSDictionary *)userInfo{

    return [[NSUserDefaults standardUserDefaults] objectForKey:KUserInfo];
}


- (void)saveUserChoose: (NSString *)choose{
    //0 不记住  1记住
    [[NSUserDefaults standardUserDefaults] setObject:choose  forKey:KIsRemenber];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (NSString *)userChoose{

     return [[NSUserDefaults standardUserDefaults] objectForKey:KIsRemenber];
}

- (void)saveCartDataArray:(NSMutableArray *)arrModel {
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:KCartData];
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:arrModel] forKey:KCartData];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)saveAreaData:(NSArray *)areaData{
    [[NSUserDefaults standardUserDefaults] setObject:areaData  forKey:KAreaData];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableArray *)areaData{
    NSMutableArray *area = [[NSUserDefaults standardUserDefaults] objectForKey:KAreaData];
    if (!area) {
        area = [[NSMutableArray alloc] init];
    }
    return area;
}


- (void)saveBDUid: (NSString *)strBDUid{
    
    [[NSUserDefaults standardUserDefaults] setObject: strBDUid  forKey:KBDUid];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)strBDUid{
    NSString *bduid = [[NSUserDefaults standardUserDefaults] objectForKey:KBDUid];
    if (bduid==nil) {
        return @"";
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:KBDUid];
}

- (void)saveBDChannelId: (NSString *)strBDChannelId{
    
    [[NSUserDefaults standardUserDefaults] setObject: strBDChannelId  forKey:KBDChannelId];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)strBDChannelId{
    NSString *bdchanneid = [[NSUserDefaults standardUserDefaults] objectForKey:KBDChannelId];
    if (bdchanneid==nil) {
        return @"";
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:KBDChannelId];
}

@end
