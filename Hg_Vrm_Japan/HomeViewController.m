//
//  ViewController.m
//  iOS8Demo
//
//  Created by apple on 14/10/24.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "HGDataStore.h"

//获取物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface HomeViewController ()<UIScrollViewDelegate>{
    
    int currentPage;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //self.imageNameArray = [NSArray arrayWithObjects:@"firstPage", @"secondPage", @"thirdPage", @"forthPage", nil];
    
    self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.pageScroll.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    
    self.imageNameArray = [NSArray arrayWithObjects:@"thirdPage", @"thirdPage", @"thirdPage", @"thirdPage", nil];
    //self.pageScroll.contentSize = CGSizeMake(self.view.width*self.imageNameArray.count, self.view.height);
     self.pageScroll.contentSize = CGSizeMake(ScreenWidth*self.imageNameArray.count, ScreenHeight);
    for (int i = 0;i < self.imageNameArray.count;i++) {
        
        NSString *imgnName = [self.imageNameArray objectAtIndex:i];
        UIImageView *imgV = [[UIImageView alloc] init];
        imgV.tag = 100+i;
        imgV.userInteractionEnabled = YES;
        imgV.frame = CGRectMake(ScreenWidth*i, 0.f,ScreenWidth, ScreenHeight);
        imgV.image = [UIImage imageNamed:imgnName];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showLoginView:)];
        tap.numberOfTapsRequired = 1;
        [imgV addGestureRecognizer:tap];
        
        
        [self.pageScroll addSubview:imgV];
        
//        if (i == self.imageNameArray.count - 1) {
//            UIButton *enterButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.width-100)/2, 450.f, 100.f, 30.f)];
//            [enterButton setImage:[UIImage imageNamed:@"redButton"] forState:UIControlStateNormal];
//            [enterButton setTitle:@"立即体验" forState:UIControlStateNormal];
//            [enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            enterButton.layer.cornerRadius = CORNER_RADIUS;
//            [enterButton addTarget:self action:@selector(pressEnterButton:) forControlEvents:UIControlEventTouchUpInside];
//            [enterButton setSelected:YES];
//            [self.view addSubview:enterButton];
//        }
        
//        self.pageControl.numberOfPages = self.imageNameArray.count;
//        self.pageControl.currentPage = currentPage;
    }
}

- (void)showLoginView:(id)sender{

    NSString *isLoin = [[[HGDataStore sharedObject] userInfo] objectForKey:@"userName"];
    if (isLoin) {
        
    }else{
    
        LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
        
    
        [self presentViewController:nav animated:YES completion:^{}];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
