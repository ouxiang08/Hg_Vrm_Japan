//
//  ViewController.m
//  iOS8Demo
//
//  Created by apple on 14/10/24.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "ViewController.h"

#import "UIView+Extensions.h"
#import "UIView+Additions.h"

@interface ViewController ()<UIScrollViewDelegate>{
    
    int currentPage;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.imageNameArray = [NSArray arrayWithObjects:@"firstPage", @"secondPage", @"thirdPage", @"forthPage", nil];
    self.imageNameArray = [NSArray arrayWithObjects:@"thirdPage", @"thirdPage", @"thirdPage", @"thirdPage", nil];
    self.pageScroll.contentSize = CGSizeMake(self.view.width*self.imageNameArray.count, self.view.height);
    
    for (int i = 0;i < self.imageNameArray.count;i++) {
        UIImageView *imgV = [[UIImageView alloc] init];
        
        imgV.frame = CGRectMake(self.view.width*i, 0.f, self.view.width, self.view.height);
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
