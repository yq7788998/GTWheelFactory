//
//  MBProgressHUD+FHLoading.h
//  funChat
//
//  Created by zhoufeng on 2018/5/2.
//  Copyright © 2018年 biyingkeji. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (FHLoading)

+ (instancetype)showHUDCoverNavBar:(BOOL)coverNavBar;
+ (instancetype)showHUDInView:(UIView *)view;

+ (BOOL)hideHUD;
+ (BOOL)hideHUDInView:(UIView *)view;
@end
