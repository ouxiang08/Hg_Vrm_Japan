//
//  ViewController.m
//  iOS8Demo
//
//  Created by apple on 14/10/24.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HomeViewController.h"

#import "UIView+Extensions.h"
#import "UIView+Additions.h"


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
        imgV.userInteractionEnabled = YES;
        imgV.frame = CGRectMake(ScreenWidth*i, 0.f,ScreenWidth, ScreenHeight);
        imgV.image = [UIImage imageNamed:imgnName];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
