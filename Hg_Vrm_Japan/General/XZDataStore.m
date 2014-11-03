//
//  XZDataStore.m
//  XZhuang
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 Sensu. All rights reserved.
//

#import "XZDataStore.h"

static XZDataStore *shareInstance = nil;

@implementation XZDataStore

+ (XZDataStore *) sharedObject{
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

- (void)saveCartData:(XZGoodModel *)model  complete:(void(^)(BOOL success))block{

    NSData* data  = [[NSUserDefaults standardUserDefaults] objectForKey:KCartData];
    NSMutableArray *cart = [NSKeyedUnarchiver unarchiveObjectWithData:data];

    int oldNum = 0;
    NSMutableArray *classArray = [[NSMutableArray alloc] init];
    for (int i = 0; i <[cart count]; i++) {
        XZGoodModel *oldModel = [cart objectAtIndex:i];
        if ([model.goodId isEqualToString:oldModel.goodId]) {
            oldNum++;
        }
        BOOL isHave = NO;
        for (int k = 0; k < [classArray count]; k++) {
            XZGoodModel *classModel = [classArray objectAtIndex:k];
            if ([oldModel.goodId isEqualToString:classModel.goodId]) {
                isHave = YES;
            }
        }
        if (!isHave) {
            [classArray addObject:oldModel];
        }
    }
    
    if (classArray.count >= 20) {//种类大于20
        if (oldNum >= 20) {
            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"你选择%@商品限量最多加入20件",model.name]];
            block(NO);
            return ;
        }
        else if(oldNum == 0){//表示是新种类
            [SVProgressHUD showErrorWithStatus:@"您得购物车商品种类达到上限量,最多加入20种!"];
            block(NO);
            return ;
        }
        else{}
    }
    else{//种类小于20
        if (oldNum >= 20) {
            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"你选择%@商品限量最多加入20件",model.name]];
            block(NO);
            return ;
        }
    }
    
    if (!cart) {
        cart = [[NSMutableArray alloc] init];
    }
    
    BOOL isExist = NO;
    for (XZGoodModel *newModel in cart) {
        if ([newModel.goodId isEqualToString:model.goodId]) {
            isExist = YES;
            break;
        }
    }
   
//    if (!isExist) {
        [cart addObject:model];
        [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:cart] forKey:KCartData];
        [[NSUserDefaults standardUserDefaults] synchronize];
//    }
    block(YES);
}

- (NSMutableArray *)cartData {
    NSData* data  = [[NSUserDefaults standardUserDefaults] objectForKey:KCartData];
    NSMutableArray *cart = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if (!cart) {
        cart = [[NSMutableArray alloc] init];
    }
    return cart;
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
