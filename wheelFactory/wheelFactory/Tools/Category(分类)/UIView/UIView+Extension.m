//
//  UIView+Extension.m
//  funchat
//
//  Created by Mac-iOS on 2017/11/8.
//  Copyright © 2017年 Mac-iOS. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void)setFc_x:(CGFloat)fc_x
{
    CGRect frame = self.frame;
    frame.origin.x = fc_x;
    self.frame = frame;
}

- (CGFloat)fc_x
{
    return self.frame.origin.x;
}

- (void)setFc_y:(CGFloat)fc_y
{
    CGRect frame = self.frame;
    frame.origin.y = fc_y;
    self.frame = frame;
}

- (CGFloat)fc_y
{
    return self.frame.origin.y;
}

- (void)setFc_width:(CGFloat)fc_width
{
    CGRect frame = self.frame;
    frame.size.width = fc_width;
    self.frame = frame;
}

- (CGFloat)fc_width
{
    return self.frame.size.width;
}

- (void)setFc_height:(CGFloat)fc_height
{
    CGRect frame = self.frame;
    frame.size.height = fc_height;
    self.frame = frame;
}

- (CGFloat)fc_height
{
    return self.frame.size.height;
}

- (void)setFc_centerX:(CGFloat)fc_centerX
{
    CGPoint center = self.center;
    center.x = fc_centerX;
    self.center = center;
}

- (CGFloat)fc_centerX
{
    return self.center.x;
}
- (void)setFc_centerY:(CGFloat)fc_centerY
{
    CGPoint center = self.center;
    center.y = fc_centerY;
    self.center = center;
}

- (CGFloat)fc_centerY
{
    return self.center.y;
}


- (void)setFc_size:(CGSize)fc_size
{
    //    self.width = size.width;
    //    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = fc_size;
    self.frame = frame;
}

- (CGSize)fc_size
{
    return self.frame.size;
}
- (void)setFc_frame:(CGRect)fc_frame
{
    CGRect frame = fc_frame;
    self.fc_frame = frame;
}

- (CGRect)fc_frame
{
    return self.frame;
}

- (CGFloat)fc_left {
    return self.frame.origin.x;
}

- (void)setFc_left:(CGFloat)fc_left {
    CGRect frame = self.frame;
    frame.origin.x = fc_left;
    self.frame = frame;
}

- (CGFloat)fc_top {
    return self.frame.origin.y;
}

- (void)setFc_top:(CGFloat)fc_top {
    CGRect frame = self.frame;
    frame.origin.y = fc_top;
    self.frame = frame;
}

- (CGFloat)fc_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setFc_right:(CGFloat)fc_right {
    CGRect frame = self.frame;
    frame.origin.x = fc_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)fc_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setFc_bottom:(CGFloat)fc_bottom {
    CGRect frame = self.frame;
    frame.origin.y = fc_bottom - frame.size.height;
    self.frame = frame;
}

@end
