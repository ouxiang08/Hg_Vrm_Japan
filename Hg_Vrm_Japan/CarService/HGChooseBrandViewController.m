//
//  HGChooseBrandViewController.m
//  Hg_Vrm_Japan
//
//  Created by apple on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HGChooseBrandViewController.h"
#import "HGChooseTypeViewController.h"
#import "HGCustomerListViewController.h"

@interface HGChooseBrandViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *userPhotoImgV;
@end

@implementation HGChooseBrandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onUser)];
    tap.numberOfTapsRequired = 1;
    self.userPhotoImgV.userInteractionEnabled = YES;
    [self.userPhotoImgV addGestureRecognizer:tap];
}

- (IBAction)onFront:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onNext:(id)sender {
    

}

- (IBAction)onClickBrand:(id)sender {
    
    HGChooseTypeViewController *chooseType = [[HGChooseTypeViewController alloc] initWithNibName:@"HGChooseTypeViewController" bundle:nil];
    [self.navigationController pushViewController:chooseType animated:YES];
}

- (void)onUser{

    HGCustomerListViewController *customerInfoVC = [[HGCustomerListViewController alloc] initWithNibName:@"HGCustomerListViewController" bundle:nil];
    [self.navigationController pushViewController:customerInfoVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
