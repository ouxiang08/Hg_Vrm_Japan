//
//  HGCustomerListViewController.m
//  Hg_Vrm_Japan
//
//  Created by jiajingjing on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HGCustomerListViewController.h"
#import "HGCustomerDetailViewController.h"
#import "HGPersonTableViewCell.h"
#import "HGChooseBrandViewController.h"

#define HGPersonTableViewCellIdentifier @"HGPersonTableViewCell"

@interface HGCustomerListViewController (){

    NSIndexPath *_selectedIndexPath;
}

@end

@implementation HGCustomerListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UINib *personCell = [UINib nibWithNibName:@"HGPersonTableViewCell" bundle:nil];
    [self.personTableView registerNib:personCell forCellReuseIdentifier:HGPersonTableViewCellIdentifier];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onHome:(id)sender {
    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2]
                                          animated:YES];
}


- (IBAction)onFront:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onNext:(id)sender {
    
//    HGCustomerInfoViewController *customerInfoVC = [[HGCustomerInfoViewController alloc] initWithNibName:@"HGCustomerInfoViewController" bundle:nil];
//    [self.navigationController pushViewController:customerInfoVC animated:YES];
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    //return self.personItems.count;
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HGPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HGPersonTableViewCellIdentifier];
    
    if (cell==nil) {
        cell = [[HGPersonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HGPersonTableViewCellIdentifier];
        //cell.backgroundColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:0.95];
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (_selectedIndexPath!=indexPath) {
        _selectedIndexPath = indexPath;
    }
    
    HGCustomerDetailViewController *customerDetailVC = [[HGCustomerDetailViewController alloc] init];
    [self.navigationController pushViewController:customerDetailVC animated:YES];
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
