//
//  LoginViewController.m
//  iOS8Demo
//
//  Created by apple on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "LoginViewController.h"
#import "HGChooseBrandViewController.h"

@interface LoginViewController (){

    BOOL _isChecked;
}

@property (strong, nonatomic) IBOutlet UIImageView *checkImgV;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    _isChecked = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)isRemenber:(id)sender {
    
    _isChecked = !_isChecked;
    
    if (_isChecked) {
        self.checkImgV.hidden = NO;
    }else{
    
        self.checkImgV.hidden = YES;
    }
}
- (IBAction)onLoginAction:(id)sender {
    
    HGChooseBrandViewController *brandVC = [[HGChooseBrandViewController alloc] initWithNibName:@"HGChooseBrandViewController" bundle:nil];
    [self.navigationController pushViewController:brandVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
