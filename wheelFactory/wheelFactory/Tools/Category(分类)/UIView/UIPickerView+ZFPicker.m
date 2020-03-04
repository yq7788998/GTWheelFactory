//
//  UIPickerView+ZFPicker.m
//  funChat
//
//  Created by zhoufeng on 2018/2/7.
//  Copyright © 2018年 biyingkeji. All rights reserved.
//

#import "UIPickerView+ZFPicker.h"

@implementation UIPickerView (ZFPicker)

- (void)clearSpearatorLine {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.frame.size.height < 1)
        {
            [obj setBackgroundColor:[UIColor clearColor]];
        }
    }];
}

@end
