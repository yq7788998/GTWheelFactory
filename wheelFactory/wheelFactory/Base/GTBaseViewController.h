//
//  GTBaseViewController.h
//  wheelFactory
//
//  Created by GTY on 2020/3/4.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD+BWMExtension.h"
#import "MBProgressHUD+FHLoading.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^FHVoidBlock)(void);
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

///设置导航栏变透明
- (void)navigationBarTransparent;

///设置导航栏不透明
- (void)navigationBarNo;

///设置导航栏白色
- (void)navigationBarWhile;

#pragma mark ---- 根据字符串或者类名来push和popViewController
//不需要传参数的push 只需告诉类名字符串
- (void)pushViewControllerWithClassOrName:(id _Nullable )classOrName;

//回到当前模块导航下的某一个页面
- (void)popReturnViewControllerWithClassOrName:(id _Nullable )classOrName;

#pragma -mark HUD
- (MBProgressHUD *_Nullable)showLoadingViewWithTitle:(NSString *_Nullable)title;     //永远显示的菊花动画

- (MBProgressHUD *_Nullable)showHUDWithTitle:(NSString *_Nullable)title
                                        type:(BWMMBProgressHUDMsgType)type; //自动消失

- (MBProgressHUD *_Nullable)showHUDWithTitle:(NSString *_Nullable)title
                                        type:(BWMMBProgressHUDMsgType)type
                                  completion:(FHVoidBlock _Nullable)completion;//自动消失

- (MBProgressHUD *_Nullable)showHUDWithTitle:(NSString *_Nullable)title              //按需消失
                              hideAfterDelay:(NSTimeInterval)delay
                                        type:(BWMMBProgressHUDMsgType)type
                                  completion:(FHVoidBlock _Nullable )completion;

- (void)hideHUD;
- (void)hideAllHUD;


@end

NS_ASSUME_NONNULL_END
