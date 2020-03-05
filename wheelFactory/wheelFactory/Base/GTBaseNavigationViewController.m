//
//  GTBaseNavigationViewController.m
//  wheelFactory
//
//  Created by GTY on 2020/3/4.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTBaseNavigationViewController.h"

@interface GTBaseNavigationViewController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation GTBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNvagation];
    self.delegate = self;
}

#pragma mark ---- 以下是基本使用方法1
//重写pushVC方法，pushVC后隐藏底部taBBar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
    
}

//重写PopVC方法
- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    return  [super popViewControllerAnimated:animated];
    
}

#pragma mark ---- 以下是基本使用方法1 + 1，右滑返回
- (void)configNvagation
{
    //启用左滑返回
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
    //是否隐约显示底层的视图
    self.extendedLayoutIncludesOpaqueBars = YES;
    // 设置nva的title文字大小
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#323232"], NSForegroundColorAttributeName,[UIFont fontWithName:@"PingFangSC" size: 18],NSFontAttributeName, nil]];
    }else{
      
    }
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 *  手势识别器对象会调用这个代理方法来决定手势是否有效
 *
 *  @return YES : 手势有效, NO : 手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        // 手势何时有效 : 当导航控制器的子控制器个数 > 1就有效
        return self.childViewControllers.count > 1;
    }
    return YES;
}


#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // if rootViewController, set delegate nil
    if (navigationController.viewControllers.count == 1) {
        navigationController.interactivePopGestureRecognizer.enabled = NO;
        navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}


@end
