//
//  UIView+ViewController.h
//  funchat  
//
//  Created by Mac-iOS on 2017/11/8.
//  Copyright © 2017年 Mac-iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewController)
/**
 *  @brief  找到当前view所在的viewcontroler
 */
@property (readonly) UIViewController *viewController;

@end
