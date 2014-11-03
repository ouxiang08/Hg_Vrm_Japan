//
//  HGChooseTypeViewController.m
//  Hg_Vrm_Japan
//
//  Created by apple on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HGChooseTypeViewController.h"
#import "HGCarTypeCollectionViewCell.h"

#define HGCarTypeCollectionViewCellIdentifier @"HGCarTypeCollectionViewCell"

@interface HGChooseTypeViewController ()

@end

@implementation HGChooseTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.carTypeItems = [[NSMutableArray alloc] init];
    
    UINib *lectureCell = [UINib nibWithNibName:@"HGCarTypeCollectionViewCell" bundle:nil];
    [self.carTypeCollectionView registerNib:lectureCell forCellWithReuseIdentifier:HGCarTypeCollectionViewCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.carTypeItems.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    HGCarTypeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HGCarTypeCollectionViewCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[HGCarTypeCollectionViewCell alloc] init];
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
