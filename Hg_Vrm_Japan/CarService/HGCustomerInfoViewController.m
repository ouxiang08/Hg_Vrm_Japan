//
//  HGCustomerInfoViewController.m
//  Hg_Vrm_Japan
//
//  Created by jiajingjing on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HGCustomerInfoViewController.h"
#import "HGCustomerListViewController.h"

@interface HGCustomerInfoViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>{

    NSInteger _imgVTag;
}

@property (strong, nonatomic) IBOutlet UIImageView *personImgV;
@property (strong, nonatomic) IBOutlet UIImageView *carImgV;
@property (strong, nonatomic) IBOutlet UIImageView *carPhoto;

@end

@implementation HGCustomerInfoViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *peopleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(takePeoplePhoto)];
    UITapGestureRecognizer *carTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(takeCarPhoto)];
    self.personImgV.userInteractionEnabled = YES;
    self.carImgV.userInteractionEnabled = YES;
    
    [self.personImgV addGestureRecognizer:peopleTap];
    [self.carImgV addGestureRecognizer:carTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)takePeoplePhoto{
    
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        _imgVTag = 1000;
        picker.delegate = self;
        picker.allowsEditing=NO;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:^(void){}];
    }else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:@"你没有摄像头"
                              delegate:nil
                              cancelButtonTitle:@"Drat!"
                              otherButtonTitles:nil];
        [alert show];
    }
    
}

-(void)takeCarPhoto{
    
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        _imgVTag = 2000;
        picker.delegate = self;
        picker.allowsEditing=NO;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:^(void){}];
    }else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:@"你没有摄像头"
                              delegate:nil
                              cancelButtonTitle:@"Drat!"
                              otherButtonTitles:nil];
        [alert show];
    }
    
}

- (IBAction)onHome:(id)sender {
    
}
- (IBAction)onSetting:(id)sender {
    
}
- (IBAction)onCloud:(id)sender {
    
}
- (IBAction)onFront:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onNext:(id)sender {
    
    HGCustomerListViewController *customerListVC = [[HGCustomerListViewController alloc] initWithNibName:@"HGCustomerListViewController" bundle:nil];
    [self.navigationController pushViewController:customerListVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - UIImagePickerControllerDelegate Methods
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //[[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    [picker dismissViewControllerAnimated:YES completion:^(void){}];
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    [picker dismissViewControllerAnimated:YES completion:^(void){}];
    
    UIImage * image=[info objectForKey:UIImagePickerControllerOriginalImage];
    
    if (_imgVTag==1000) {
        self.personImgV.image = image;
    }else{
        self.carPhoto.image = image;
    }
   
}


@end
