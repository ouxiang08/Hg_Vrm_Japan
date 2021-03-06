//
//  HGChooseKilometreViewController.m
//  Hg_Vrm_Japan
//
//  Created by apple on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HGChooseKilometreViewController.h"
#import "HGKilometreCollectionViewCell.h"
#import "HGChooseContentViewController.h"

#define HGKilometreCollectionViewCellIdentifier @"HGKilometreCollectionViewCell"

@interface HGChooseKilometreViewController (){

    NSIndexPath *_seletedIndexPath;
}

@end

@implementation HGChooseKilometreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.kilometreItems = [[NSMutableArray alloc] initWithObjects:@"5000.png",@"40000.png",@"75000.png",@"10000.png",@"45000.png",@"80000.png",@"15000.png",@"50000.png",@"85000.png",@"20000.png",@"55000.png",@"90000.png",@"25000.png",@"60000.png",@"95000.png",@"30000.png",@"65000.png",@"100000.png",@"35000.png",@"70000.png",@"10K+.png", nil];
    
    
    UINib *lectureCell = [UINib nibWithNibName:@"HGKilometreCollectionViewCell" bundle:nil];
    [self.kilometreCollectionView registerNib:lectureCell forCellWithReuseIdentifier:HGKilometreCollectionViewCellIdentifier];
}

- (IBAction)onFront:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onNext:(id)sender {
    
    HGChooseContentViewController *chooseContentVC = [[HGChooseContentViewController alloc] initWithNibName:@"HGChooseContentViewController" bundle:nil];
    [self.navigationController pushViewController:chooseContentVC animated:YES];
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
    
    NSString *imgName = [self.kilometreItems objectAtIndex:indexPath.row];
    cell.kilometreImgV.image = [UIImage imageNamed:imgName];
    
    NSUInteger row = [indexPath row];
    NSUInteger oldRow = [_seletedIndexPath row];
    
    if (_seletedIndexPath != nil && row == oldRow) {
        cell.kilometreSele.image = [UIImage imageNamed:@"kilometreChecked.png"];
    }else{
        cell.kilometreSele.image = nil;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    int newRow = [indexPath row];
    int oldRow = (_seletedIndexPath != nil) ? [_seletedIndexPath row] : -1;
    
    if (newRow!=oldRow)  {
        _seletedIndexPath = indexPath;
    }
    [self.kilometreCollectionView reloadData];
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
