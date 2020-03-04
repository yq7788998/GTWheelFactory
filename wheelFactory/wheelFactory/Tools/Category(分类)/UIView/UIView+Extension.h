//
//  UIView+Extension.h
//  funchat
//
//  Created by Mac-iOS on 2017/11/8.
//  Copyright © 2017年 Mac-iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat fc_x;
@property (nonatomic, assign) CGFloat fc_y;
@property (nonatomic, assign) CGFloat fc_width;
@property (nonatomic, assign) CGFloat fc_height;
@property (nonatomic, assign) CGSize fc_size;
@property (nonatomic, assign) CGFloat fc_centerX;
@property (nonatomic, assign) CGFloat fc_centerY;
@property (nonatomic, assign) CGRect fc_frame;

@property (nonatomic, assign) CGFloat fc_left;
@property (nonatomic, assign) CGFloat fc_right;
@property (nonatomic, assign) CGFloat fc_top;
@property (nonatomic, assign) CGFloat fc_bottom;
@end
