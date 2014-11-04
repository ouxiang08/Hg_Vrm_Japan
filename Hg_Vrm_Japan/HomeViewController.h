//
//  ViewController.h
//  iOS8Demo
//
//  Created by apple on 14/10/24.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StyledPageControl.h"

@interface HomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *pageScroll;
@property (strong, nonatomic) NSArray *imageNameArray;
@property (strong, nonatomic) StyledPageControl *pageControl;

@end

