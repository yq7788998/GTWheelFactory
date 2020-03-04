//
//  GTBaseTabBarViewController.m
//  wheelFactory
//
//  Created by GTY on 2020/3/4.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTBaseTabBarViewController.h"
#import "GTBaseNavigationViewController.h"
#import "MainViewController.h"
#import "GTSimpleDomeTableViewListVC.h"
#import "GTSimpleExampleTableViewListVC.h"

@interface GTBaseTabBarViewController ()

@end

@implementation GTBaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    //tab1
    MainViewController *tab1VC = [[MainViewController alloc]init];
    [self setViewController:tab1VC title:@"" image:@"Home" selectImage:@"HomeN"];
    
    //tab2
    GTSimpleDomeTableViewListVC *tab2VC = [[GTSimpleDomeTableViewListVC alloc]init];
    tab2VC.title = @"引导页";
    [self setViewController:tab2VC title:@"" image:@"voide" selectImage:@"voideN"];
    
    //tab3
    GTSimpleExampleTableViewListVC *tab3VC = [[GTSimpleExampleTableViewListVC alloc]init];
    tab3VC.title = @"tab3";
    [self setViewController:tab3VC title:@"" image:@"mine" selectImage:@"mineN"];
}

#pragma mark ---- 以下是基本使用方法1
#pragma mark - 添加子控制器
-(void)setViewController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage {
    static NSInteger index = 0;
    viewController.tabBarItem.title = title;
//    viewController.title = title;
//    if (iSLessIOS13) {
//        // 小于iOS 13系统 走偏移
//        viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
//    }
    viewController.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.tag = index;
    index++;
    GTBaseNavigationViewController *nav = [[GTBaseNavigationViewController alloc]initWithRootViewController:viewController];
    [self addChildViewController:nav];
}

#pragma mark ---- 以下是基本使用方法1 + 1

@end
