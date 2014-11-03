//
//  HGChooseTypeViewController.m
//  Hg_Vrm_Japan
//
//  Created by apple on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HGChooseTypeViewController.h"
#import "HGCarTypeCollectionViewCell.h"
#import "HGChooseBrandViewController.h"
#import "HGChooseKilometreViewController.h"

#define HGCarTypeCollectionViewCellIdentifier @"HGCarTypeCollectionViewCell"

@interface HGChooseTypeViewController (){

    NSIndexPath *_selectedIndexPath;
}

@end

@implementation HGChooseTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.carTypeItems = [[NSMutableArray alloc] init];
    
    for (int i=0; i<12; i++) {
        [self.carTypeItems addObject:[NSString stringWithFormat:@"type%d.png",i]];
    }
    
    UINib *lectureCell = [UINib nibWithNibName:@"HGCarTypeCollectionViewCell" bundle:nil];
    [self.carTypeCollectionView registerNib:lectureCell forCellWithReuseIdentifier:HGCarTypeCollectionViewCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onFront:(id)sender {
 
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onNext:(id)sender {
    
    HGChooseKilometreViewController *chooseKilometreVC = [[HGChooseKilometreViewController alloc] initWithNibName:@"HGChooseKilometreViewController" bundle:nil];
    [self.navigationController pushViewController:chooseKilometreVC animated:YES];
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
    NSString *imgName = [self.carTypeItems objectAtIndex:indexPath.row];
    cell.carTypeImgV.image = [UIImage imageNamed:imgName];
    
    if (_selectedIndexPath==indexPath) {
        cell.carSelImgV.image = [UIImage imageNamed:@"carSeleted.png"];
    }else{
    
        cell.carSelImgV.image = [UIImage imageNamed:@"carUnSele.png"];
    }

    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath!=_selectedIndexPath) {
        _selectedIndexPath = indexPath;
    }
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
