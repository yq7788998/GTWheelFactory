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

#pragma mark ---- 以下是基本使用方法1 + 1

#pragma mark - UINavigationControllerDelegate
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    // if rootViewController, set delegate nil
//    if (navigationController.viewControllers.count == 1) {
//        navigationController.interactivePopGestureRecognizer.enabled = NO;
//        navigationController.interactivePopGestureRecognizer.delegate = nil;
//    }
//}


@end
