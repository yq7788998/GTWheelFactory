//
//  GTMenuVisibleNoTextFieldView.m
//  wheelFactory
//
//  Created by GTY on 2020/5/11.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTMenuVisibleNoTextFieldView.h"

@implementation GTMenuVisibleNoTextFieldView

//建议整体禁用（复制、粘贴、全选等都被禁用了）
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}

@end
