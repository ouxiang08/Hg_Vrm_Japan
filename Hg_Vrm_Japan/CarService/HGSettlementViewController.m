//
//  HGSettlementViewController.m
//  Hg_Vrm_Japan
//
//  Created by apple on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HGSettlementViewController.h"
#import "HGCustomerInfoViewController.h"

@interface HGSettlementViewController ()

@end

@implementation HGSettlementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onFront:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onNext:(id)sender {
    
    HGCustomerInfoViewController *customerInfoVC = [[HGCustomerInfoViewController alloc] initWithNibName:@"HGCustomerInfoViewController" bundle:nil];
    [self.navigationController pushViewController:customerInfoVC animated:YES];
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
