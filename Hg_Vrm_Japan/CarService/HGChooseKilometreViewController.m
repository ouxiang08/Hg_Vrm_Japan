//
//  HGChooseKilometreViewController.m
//  Hg_Vrm_Japan
//
//  Created by apple on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HGChooseKilometreViewController.h"
#import "HGKilometreCollectionViewCell.h"

#define HGKilometreCollectionViewCellIdentifier @"HGKilometreCollectionViewCell"

@interface HGChooseKilometreViewController ()

@end

@implementation HGChooseKilometreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.kilometreItems = [[NSMutableArray alloc] init];
    
    
    UINib *lectureCell = [UINib nibWithNibName:@"HGKilometreCollectionViewCell" bundle:nil];
    [self.kilometreCollectionView registerNib:lectureCell forCellWithReuseIdentifier:HGKilometreCollectionViewCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.kilometreItems.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HGKilometreCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HGKilometreCollectionViewCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[HGKilometreCollectionViewCell alloc] init];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
