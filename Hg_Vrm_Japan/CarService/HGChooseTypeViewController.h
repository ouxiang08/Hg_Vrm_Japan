//
//  HGChooseTypeViewController.h
//  Hg_Vrm_Japan
//
//  Created by apple on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGChooseTypeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *carTypeCollectionView;
@property (strong, nonatomic) NSMutableArray *carTypeItems;

@end
