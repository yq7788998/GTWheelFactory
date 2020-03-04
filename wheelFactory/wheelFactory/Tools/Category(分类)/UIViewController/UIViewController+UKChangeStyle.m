//
//  UIViewController+UKChangeStyle.m
//  WisRoomUpKid
//
//  Created by GTY on 2019/10/12.
//  Copyright © 2019 com.tal.wisroom. All rights reserved.
//

#import "UIViewController+UKChangeStyle.h"
#import <objc/runtime.h>

@implementation UIViewController (UKChangeStyle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 交换方法
           Method clickMethod = class_getInstanceMethod(self, @selector(presentViewController:animated:completion:));
           Method cs_clickMethod = class_getInstanceMethod(self, @selector(myPresentViewController:animated:completion:));
           method_exchangeImplementations(clickMethod, cs_clickMethod);
   
    });
}

- (void)myPresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    //设置满屏，不需要小卡片
    if(@available(iOS 13.0, *)) {
        viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    [self myPresentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
