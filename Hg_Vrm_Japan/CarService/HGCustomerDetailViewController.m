//
//  HGCustomerDetailViewController.m
//  Hg_Vrm_Japan
//
//  Created by jiajingjing on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HGCustomerDetailViewController.h"
#import "HGDetailTableViewCell.h"
#import "HGChooseBrandViewController.h"
#import "HGChooseContentViewController.h"

#define HGDetailTableViewCellIdentifier @"HGDetailTableViewCell"

@interface HGCustomerDetailViewController ()

@property (strong, nonatomic) IBOutlet UITableView *detailTableView;

@end

@implementation HGCustomerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *personCell = [UINib nibWithNibName:@"HGDetailTableViewCell" bundle:nil];
    [self.detailTableView registerNib:personCell forCellReuseIdentifier:HGDetailTableViewCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHome:(id)sender {
    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2]
                                          animated:YES];
}

- (IBAction)onSetting:(id)sender {
    
    HGChooseContentViewController *chooseContentVC = [[HGChooseContentViewController alloc] initWithNibName:@"HGChooseContentViewController" bundle:nil];
    [self.navigationController pushViewController:chooseContentVC animated:YES];
}

- (IBAction)onFront:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onNext:(id)sender {
    
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HGDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HGDetailTableViewCellIdentifier];
    
    if (cell==nil) {
        cell = [[HGDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HGDetailTableViewCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //cell.backgroundColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:0.95];
    }
    
    return cell;
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
