//
//  HGCustomerListViewController.h
//  Hg_Vrm_Japan
//
//  Created by jiajingjing on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGCustomerListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *personTableView;
@property (strong, nonatomic) NSMutableArray *personItems;


@end
