//
//  GTSimpleDomeTableViewListVC.m
//  testDemo
//
//  Created by GTY on 2020/1/3.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTSimpleDomeTableViewListVC.h"

@interface GTSimpleDomeTableViewListVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView * tableView;
@property (nonatomic, strong)NSArray * arrayList;

@end

@implementation GTSimpleDomeTableViewListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIKit";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.arrayList = @[@"UIView",@"UILabel",@"UIButton",@"UIImageView",@"UITextField",@"UIScrollView",@"UIAlertView",@"UIPickerView",@"",@"",@"",];
}

#pragma mark - 懒加载
-(UITableView *)tableView {
    if (!_tableView) {
        CGRect tableViewRect = CGRectZero;
        tableViewRect = CGRectMake(0, 64+5, self.view.frame.size.width, self.view.frame.size.height-20-25);
        _tableView = [[UITableView alloc] initWithFrame:tableViewRect style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
           _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        }
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.estimatedRowHeight = 44;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

#pragma mark - table代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (self.arrayList.count > indexPath.row) {
        cell.textLabel.text = self.arrayList[indexPath.row];
    }
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   return 40;
}

#pragma mark - 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self selectVCAtIndex:indexPath.row];
}

- (void)selectVCAtIndex:(NSInteger)index {
    UIViewController * vc;
    switch (index) {
        case 0:
            
            break;
        case 1:
        
            break;
        case 2:
        {
            vc = [[GTSimpleUIButtonVC alloc]init];
        }
            break;
        case 3:
        
            break;
        case 4:
        
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
