//
//  XZDataStore.h
//  XZhuang
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 Sensu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XZGoodModel.h"

#define KUserJson @"UserJson"
#define KUserInfo @"UserInfo"
#define KCartData @"Cart"
#define KAreaData @"area"
#define KBDUid @"bduid"
#define KBDChannelId @"bdchannelid"

//是否登入
#define isLogin ([[[XZDataStore sharedObject] userInfo] objectForKey:@"userid"])
//登入角色
#define XZIdentity ([[[[XZDataStore sharedObject] userInfo] objectForKey:@"role"] intValue])
#define Identity_Students 1
#define Identity_Lecturer 2
#define Identity_Liaison  3
#define Identity_Double   4



@interface XZDataStore : NSObject

@property(nonatomic,retain)UINavigationController *naviCtrl;

+ (XZDataStore *) sharedObject;

- (void)saveUserInfo:(NSDictionary *)userInfo;
- (NSDictionary *)userInfo;

- (void)saveUserJson: (NSString *)userJson;
- (NSString *)userJson;

- (void)saveCartData:(XZGoodModel *)model complete:(void(^)(BOOL success))block;
- (void)saveCartDataArray:(NSMutableArray *)arrModel;
- (NSMutableArray *)cartData;

- (void)saveAreaData:(NSArray *)areaData;
- (NSMutableArray *)areaData;

- (NSString *)strBDUid;
- (void)saveBDUid:(NSString *)strBDUid;

- (NSString *)strBDChannelId;
- (void)saveBDChannelId:(NSString *)strBDChannelId;

@end
