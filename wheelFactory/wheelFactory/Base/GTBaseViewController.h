//
//  GTBaseViewController.h
//  wheelFactory
//
//  Created by GTY on 2020/3/4.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTBaseViewController : UIViewController

//右边的按钮
@property (nonatomic,strong)UIButton * _Nullable rightButton;

//左边的按钮
@property (nonatomic,strong)UIButton * _Nullable leftButton;

//配置右边itemButton的文字和文字颜色
- (void)configRightButtonTitle:(NSString *_Nullable)buttonTitle color:(UIColor *_Nullable)color;


//配置右边itemButton按钮显示图片
- (void)configRightButtonImage:(NSString *_Nullable)imageName;

//点击左边按钮触发的事件
- (void)leftItemClick:(UIButton *_Nullable)click;


//点就右边的按钮触发事件
- (void)rightItemClick:(UIButton *_Nullable)click;

//隐藏左边返回按钮
- (void)hiddenBackItem;

//隐藏right按钮
- (void)hiddenRigthItem;

//隐藏导航条
- (void)hiddenNavBar;

#pragma mark ---- 根据字符串或者类名来push和popViewController
//不需要传参数的push 只需告诉类名字符串
- (void)pushViewControllerWithClassOrName:(id _Nullable )classOrName;

//回到当前模块导航下的某一个页面
- (void)popReturnViewControllerWithClassOrName:(id _Nullable )classOrName;


@end

NS_ASSUME_NONNULL_END
