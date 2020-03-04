//
//  MBProgressHUD+FHLoading.m
//  funChat
//
//  Created by zhoufeng on 2018/5/2.
//  Copyright © 2018年 biyingkeji. All rights reserved.
//

#import "MBProgressHUD+FHLoading.h"
#import "UIImage+GIF.h"

#define kBackViewTag 10000
#define kMaxLoadingImage 16

@implementation MBProgressHUD (FHLoading)

+ (instancetype)showHUDCoverNavBar:(BOOL)coverNavBar {
    UIView *view = [[UIView alloc] init];
    view.tag = kBackViewTag;
    if (coverNavBar) {
        view.frame = kKeyWindow.frame;
    }else {
        view.frame = CGRectMake(0, Navi_Height, Main_Screen_Width, Main_Screen_Height-Navi_Height);
    }
    
    [kKeyWindow addSubview:view];
    
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.mode = MBProgressHUDModeCustomView;
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:GetImage(@"loadingImg_1")];
//    imageView.frame = CGRectMake(0, 0, 40, 40);
//    NSMutableArray *images = [NSMutableArray array];
//    for (int i = 0; i < kMaxLoadingImage; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loadingImg_%d",i+1]];
//        [images addObject:image];
//    }
//    [imageView setAnimationImages:images];
//    [imageView setAnimationDuration:1];
//    [imageView startAnimating];
//    hud.customView = imageView;
    hud.labelYOffset = 3;
    hud.color = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.7];
    hud.labelText = @"正在加载...";
    hud.labelColor = [UIColor whiteColor];
    hud.labelFont = [UIFont systemFontOfSize:13];
    hud.margin = 12;
    hud.opacity = 0.5;
    if (!coverNavBar) {
        hud.yOffset = -Navi_Height/2;
    }
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    [hud show:YES];
    return hud;
}

+ (instancetype)showHUDInView:(UIView *)view {
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.mode = MBProgressHUDModeCustomView;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:GetImage(@"loadingImg_1")];
    imageView.frame = CGRectMake(0, 0, 40, 40);
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i < kMaxLoadingImage; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loadingImg_%d",i+1]];
        [images addObject:image];
    }
    [imageView setAnimationImages:images];
    [imageView setAnimationDuration:1];
    [imageView startAnimating];
    hud.customView = imageView;
    hud.labelYOffset = 3;
    hud.color = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.7];
    hud.labelText = @"正在加载";
    hud.labelColor = [UIColor whiteColor];
    hud.labelFont = [UIFont systemFontOfSize:12];
    hud.margin = 12;
    hud.opacity = 0.5;
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    [hud show:YES];
    return hud;
}

+ (BOOL)hideHUD {
    UIView *view = [kKeyWindow viewWithTag:kBackViewTag];
    MBProgressHUD *hud = [self HUDForView:view];
    if (hud != nil) {
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES];
        [view removeFromSuperview];
        view = nil;
        return YES;
    }
    return NO;
}

+ (BOOL)hideHUDInView:(UIView *)view {
    MBProgressHUD *hud = [self HUDForView:view];
    if (hud != nil) {
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES];
        [view removeFromSuperview];
        view = nil;
        return YES;
    }
    return NO;
}

@end
