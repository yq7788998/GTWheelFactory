//
//  UIView+Empty.h
//  funchat
//
//  增加：(void)showWithImageName:(NSString *)imageName title:(NSString *)title detailTitle:(NSString *)detailTitle buttonTitle:(NSString *)buttonTitle refresh:(RefreshBlock)block;
//  移除：(void)removeEmptyView;
//  Created by Mac-iOS on 2017/11/8.
//  Copyright © 2017年 Mac-iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Empty)

typedef void(^RefreshBlock)(void);

@property (nonatomic, strong, readonly) UIView *bottomView;

@property (nonatomic, copy) RefreshBlock block;

- (void)showNetWorkErrorWithRefresh:(RefreshBlock)block;

- (void)showEmptyViewWithRefresh:(RefreshBlock)block;

- (void)showWithImageName:(NSString *)imageName
                    title:(NSString *)title
              detailTitle:(NSString *)detailTitle
              buttonTitle:(NSString *)buttonTitle
                  refresh:(RefreshBlock)block;

- (void)removeEmptyView;

@end
