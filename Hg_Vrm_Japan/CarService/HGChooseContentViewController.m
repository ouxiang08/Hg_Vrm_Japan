//
//  HGChooseContentViewController.m
//  Hg_Vrm_Japan
//
//  Created by jiajingjing on 14/11/3.
//  Copyright (c) 2014年 jingjing.jia. All rights reserved.
//

#import "HGChooseContentViewController.h"
#import "HGSettlementViewController.h"

@interface HGChooseContentViewController (){

    NSIndexPath *_selectedIndexPath;
    
    NSMutableArray *_baseSelectedItems;
    NSMutableArray *_advantageSelectedItems;
}

@end

@implementation HGChooseContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseItems = [[NSMutableArray alloc] initWithObjects:@"发动机",@"机油",@"机滤",@"燃油添加剂",@"节气门清洁",@"工时", nil];
    self.advantageItems = [[NSMutableArray alloc] initWithObjects:@"螺栓防锈防松施工",@"密封圈连接件润滑保养",@"全车金属",@"全车车窗，天窗润滑",@"风窗玻璃清洁剂",@"发动机内窥检测", nil];
    
    _baseSelectedItems = [[NSMutableArray alloc] init];
    for (int i=0; i<self.baseItems.count; i++) {
        [_baseSelectedItems addObject:[NSNumber numberWithInteger:-1]];
    }
    
    
    _advantageSelectedItems = [[NSMutableArray alloc] init];
    for (int j=0; j<self.advantageItems.count; j++) {
        [_advantageSelectedItems addObject:[NSNumber numberWithInteger:-1]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onFront:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onNext:(id)sender {
    
    HGSettlementViewController *settlementVC = [[HGSettlementViewController alloc] initWithNibName:@"HGSettlementViewController" bundle:nil];
    [self.navigationController pushViewController:settlementVC animated:YES];
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
        cell.backgroundColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:0.95];
        cell.textLabel.textColor = [UIColor lightGrayColor];
        
        UIImageView *rightImgV = [[UIImageView alloc] init];
        rightImgV.frame = CGRectMake(275, 15, 20, 20);
        rightImgV.tag = 1101;
        rightImgV.image = [UIImage imageNamed:@"conUnsel.png"];
        
        [cell.contentView addSubview:rightImgV];
    }
    
    //消除IOS7里UITableViewCell默认下划线左边的空隙
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }

    
    cell.tag = indexPath.row;
    UIImageView *imgV = (UIImageView *)[cell.contentView viewWithTag:1101];
    
    NSString *contentStr = nil;
    if(tableView.tag==10001){
        contentStr = [self.baseItems objectAtIndex:indexPath.row];
        
        NSUInteger row = [indexPath row];
        NSNumber *number = [_baseSelectedItems objectAtIndex:row];
        
        if (row == [number integerValue]&& number!= nil) {
            imgV.image = [UIImage imageNamed:@"conSel.png"];
        }else{
            imgV.image = [UIImage imageNamed:@"conUnsel.png"];
        }
        
    }else{
        contentStr = [self.advantageItems objectAtIndex:indexPath.row];
        
        NSUInteger row = [indexPath row];
        NSNumber *number = [_advantageSelectedItems objectAtIndex:row];
        
        if (row == [number integerValue]&& number!= nil) {
            imgV.image = [UIImage imageNamed:@"conSel.png"];
        }else{
            imgV.image = [UIImage imageNamed:@"conUnsel.png"];
        }
    }
    
    cell.textLabel.text = contentStr;
//    
//    NSUInteger row = [indexPath row];
//    NSUInteger oldRow = [_selectedIndexPath row];
//    
//    if (_selectedIndexPath != nil && row == oldRow){
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"conUnsel.png"]];
//    }else{
//        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"conSel.png"]];
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }

    return cell;
}


#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, 320, 50);
    headerView.backgroundColor = [UIColor redColor];
    
    UIImageView *arrowImgV = [[UIImageView alloc] init];
    arrowImgV.image = [UIImage imageNamed:@"conBannerView.png"];
    arrowImgV.frame = headerView.bounds;
    [headerView addSubview:arrowImgV];
    
    UILabel *titleLbl = [[UILabel alloc] init];
    titleLbl.textColor = [UIColor whiteColor];
    titleLbl.frame = CGRectMake(15, 15, 100, 20);
    if(tableView.tag==10001){
        titleLbl.text = @"基本护理";
    }else{
        titleLbl.text = @"升级养护";
    }
    
    [headerView addSubview:titleLbl];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    UIImageView *imgV = (UIImageView *)[cell.contentView viewWithTag:1101];
    
    if(tableView.tag==10001){
        
        if (![_baseSelectedItems containsObject:[NSNumber numberWithInteger:indexPath.row]]){
            imgV.image = [UIImage imageNamed:@"conSel.png"];
            [_baseSelectedItems replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithInteger:cell.tag]];
        }else{
            imgV.image = [UIImage imageNamed:@"conUnsel.png"];
            [_baseSelectedItems replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithInteger:-1]];
        }

    }else{
        if (![_advantageSelectedItems containsObject:[NSNumber numberWithInteger:indexPath.row]]){
            imgV.image = [UIImage imageNamed:@"conSel.png"];
            [_advantageSelectedItems replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithInteger:cell.tag]];
        }else{
            imgV.image = [UIImage imageNamed:@"conUnsel.png"];
            [_advantageSelectedItems replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithInteger:-1]];
        }
    }
    
//    int newRow = [indexPath row];
//    int oldRow = (_selectedIndexPath != nil) ? [_selectedIndexPath row] : -1;
//    
//    if (newRow!=oldRow)  {
//        _selectedIndexPath = indexPath;
//    }
//    
//    if (cell.accessoryType == UITableViewCellAccessoryNone){
//        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"conUnsel.png"]];
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }else{
//        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"conSel.png"]];
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
