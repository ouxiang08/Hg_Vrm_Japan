//
//  HGChooseContentViewController.h
//  Hg_Vrm_Japan
//
//  Created by jiajingjing on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGChooseContentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *baseTableView;
@property (weak, nonatomic) IBOutlet UITableView *advantageTableView;

@property (strong, nonatomic) NSMutableArray *baseItems;
@property (strong, nonatomic) NSMutableArray *advantageItems;

@end
