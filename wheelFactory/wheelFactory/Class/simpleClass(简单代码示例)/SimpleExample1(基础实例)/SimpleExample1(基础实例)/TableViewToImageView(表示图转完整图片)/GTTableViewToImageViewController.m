//
//  GTTableViewToImageViewController.m
//  wheelFactory
//
//  Created by GTY on 2020/5/12.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTTableViewToImageViewController.h"
#import "ShowBigViewController.h"

@interface GTTableViewToImageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIView * cropView;
@property (nonatomic, strong)UITableView * tableView;
@end

@implementation GTTableViewToImageViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cropView = [[UIView alloc]initWithFrame:CGRectMake(0, Navi_Height + 50, 300, Main_Screen_Height - Navi_Height -100)];
    [self.view addSubview:self.cropView];
    [self.cropView addSubview:self.tableView];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.cropView.backgroundColor = [UIColor yellowColor];
    self.tableView.backgroundColor = [UIColor grayColor];
}

#pragma mark - 懒加载
-(UITableView *)tableView {
    if (!_tableView) {
        CGRect tableViewRect = CGRectZero;
        tableViewRect = CGRectMake(0, 0, self.cropView.frame.size.width, self.cropView.frame.size.height);
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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.row >= 0) {
        long i = 10 + indexPath.row * 30;
        cell.backgroundColor = [UIColor colorWithWholeRed:i green:0 blue:255 - i];
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        cell.layer.borderColor = [UIColor orangeColor].CGColor;
        cell.layer.borderWidth = 1;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

#pragma mark - 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self selectVCAtIndex:indexPath.row];
}

- (void)selectVCAtIndex:(NSInteger)index {
    UIImage * img = [self tableViewToImageView];
   if (img) {
       ShowBigViewController *big = [[ShowBigViewController alloc] init];
       [big ConfigData:@[img]];
       big.modalPresentationStyle = UIModalPresentationFullScreen;
       [self presentViewController:big animated:YES completion:nil];
   }
}

- (UIImage *)tableViewToImageView {
    
    UIGraphicsBeginImageContextWithOptions(self.cropView.frame.size, YES, 0.0);
    float craH = self.tableView.contentSize.height;
    UIImageView *allView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, craH)];
    for (float f = 0.0; f<craH; f += self.tableView.frame.size.height) {
        self.tableView.contentOffset = CGPointMake(0, f);
        [self.cropView.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImageView *imgV = [[UIImageView alloc]initWithImage:UIGraphicsGetImageFromCurrentImageContext()];
        imgV.frame = CGRectMake(0, f, Main_Screen_Width, self.tableView.frame.size.height);
        [allView addSubview:imgV];
    }
    UIGraphicsEndImageContext();
    
    //保存图片
    UIGraphicsBeginImageContextWithOptions(allView.frame.size, YES, 0.0);
    [allView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return img;

}


@end
