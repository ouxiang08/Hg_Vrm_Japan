//
//  HGChooseContentViewController.m
//  Hg_Vrm_Japan
//
//  Created by jiajingjing on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HGChooseContentViewController.h"

@interface HGChooseContentViewController (){

    NSIndexPath *_seletedIndexPath;
}

@end

@implementation HGChooseContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseItems = [[NSMutableArray alloc] initWithObjects:@"发动机",@"机油",@"机滤",@"燃油添加剂",@"节气门清洁",@"工时", nil];
    self.advantageItems = [[NSMutableArray alloc] initWithObjects:@"螺栓防锈防松施工",@"密封圈连接件润滑保养",@"全车金属",@"全车车窗，天窗润滑",@"风窗玻璃清洁剂",@"发动机内窥检测", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if(tableView.tag==10001){
        return self.baseItems.count;
    }else{
    
        return self.advantageItems.count;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *contentStr = nil;
    if(tableView.tag==10001){
        contentStr = [self.baseItems objectAtIndex:indexPath.row];
    }else{
        contentStr = [self.advantageItems objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = contentStr;
    
    if (_seletedIndexPath==indexPath) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"carSeleted.png"]];
    }else{
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"carUnSele.png"]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (_seletedIndexPath!=indexPath) {
        _seletedIndexPath = indexPath;
    }
    
    if (cell.accessoryType == UITableViewCellAccessoryNone){
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"carSeleted.png"]];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"carUnSele.png"]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



@end
