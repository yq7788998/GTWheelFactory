//
//  UIView+ViewController.m
//  funchat
//
//  Created by Mac-iOS on 2017/11/8.
//  Copyright © 2017年 Mac-iOS. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)
/**
 *  @brief  找到当前view所在的viewcontroler
 */
- (UIViewController *)viewController
{
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    } while (responder);
    return nil;
}

@end
