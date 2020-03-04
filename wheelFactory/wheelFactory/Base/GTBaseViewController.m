//
//  GTBaseViewController.m
//  wheelFactory
//
//  Created by GTY on 2020/3/4.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTBaseViewController.h"

@interface GTBaseViewController ()

@end

@implementation GTBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
  
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//  控制器移除后键盘推出
//    [[IQKeyboardManager sharedManager] resignFirstResponder];
//    [self hideAllHUD];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor whiteColor];
    [self setupLeftAndRightBarButton];
}

#pragma mark ---- 自定义leftBarButtonItem 和 rightBarButtonItem
- (void)setupLeftAndRightBarButton {
    
    [self.rightButton addTarget:self action:@selector(rightItemClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    self.navigationItem.rightBarButtonItem = item;
    
    [self.leftButton addTarget:self action:@selector(leftItemClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    self.navigationItem.leftBarButtonItem = item2;
    
}

//左边按钮事件
- (void)leftItemClick:(UIButton *)click
{
    
//    [MBProgressHUD hideHUD];
    [self.navigationController popViewControllerAnimated:YES];
    
}

//右边按钮事件
- (void)rightItemClick:(UIButton *)click
{
    
    self.rightButton.hidden = YES;
    
}

//设置右边按键
- (UIButton *)rightButton
{
    
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [_rightButton setImage:nil forState:UIControlStateNormal];
        [_rightButton setImageEdgeInsets:UIEdgeInsetsMake(0, -6, 0, 6)];
    }
    return _rightButton;
    
}

//设置左边按键
-(UIButton*)leftButton
{
    
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [_leftButton setImage:[UIImage imageNamed:@"nav"] forState:UIControlStateNormal];
        [_leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 6)];
        
    }
    return _leftButton;
    
}

//配置右边item按钮显示文字
- (void)configRightButtonTitle:(NSString *)buttonTitle color:(UIColor *)color
{
    
    [self.rightButton setTitle:buttonTitle forState:UIControlStateNormal];
    self.rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.rightButton setTitleColor:color?color:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.rightButton sizeToFit];
    self.rightButton.frame = CGRectMake(0, 0, self.rightButton.frame.size.width, self.rightButton.frame.size.height);
    
}

//配置右边item按钮显示图片
- (void)configRightButtonImage:(NSString *)imageName
{
    
    [_rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [_rightButton setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    
}

- (void)hiddenBackItem {
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem=nil;
    
}

- (void)hiddenRigthItem {

    self.navigationItem.rightBarButtonItem=nil;
    
}

- (void)hiddenNavBar {
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
    
}


#pragma mark ---- 根据字符串或者类名来push和popViewController
- (void)pushViewControllerWithClassOrName:(id)classOrName {
    
    if (classOrName) {
        Class classs;
        if ([classOrName isKindOfClass:[NSString class]]) {
            NSString *name = classOrName;
            classs = NSClassFromString(name);
        } else if ([classOrName isSubclassOfClass:[GTBaseViewController class]]) {
            classs = classOrName;
        }
        UIViewController *vc = [classs new];
        if (vc) {
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
}

- (void)popReturnViewControllerWithClassOrName:(id)classOrName {
    
    if (classOrName) {
        Class classs;
        if ([classOrName isKindOfClass:[NSString class]]) {
            NSString *name = classOrName;
            classs = NSClassFromString(name);
        } else if ([classOrName isSubclassOfClass:[GTBaseViewController class]]) {
            classs = classOrName;
        }
        [self.navigationController.viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%@", obj);
            if ([obj isKindOfClass:classs]) {
                [self.navigationController popToViewController:obj animated:YES];
                *stop = YES;
                return;
            }
        }];
    }
    
}


#pragma mark ---- 导航栏设置
- (void)navigationBarTransparent {
    ///设置导航栏变透明
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
}

//导航不透明
- (void)navigationBarNo {
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];

}

- (void)navigationBarWhile {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
       [self.navigationController.navigationBar setShadowImage:nil];
}

- (BOOL)shouldAutorotate{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}


@end
