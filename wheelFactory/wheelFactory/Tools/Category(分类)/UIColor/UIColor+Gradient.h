//
//  UIColor+Gradient.h
//  funchat
//
//  Created by Mac-iOS on 2017/11/8.
//  Copyright © 2017年 Mac-iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Gradient)
/**
 *  @brief  垂直渐变颜色
 *
 *  @param c1     开始颜色
 *  @param c2     结束颜色
 *  @param height 渐变高度(0~1)
 *
 *  @return 渐变颜色
 */
+ (UIColor*)verticalGradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;


/**
 *  @brief  水平渐变颜色
 *
 *  @param c1     开始颜色
 *  @param c2     结束颜色
 *  @param width  渐变宽度(0~1)
 *
 *  @return 渐变颜色
 */
+ (UIColor*)HorizontalGradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withWidth:(int)width;
@end
