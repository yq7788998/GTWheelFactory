//
//  MacrosHeader.h
//  wheelFactory
//
//  Created by GTY on 2020/1/14.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#ifndef MacrosHeader_h
#define MacrosHeader_h /* MacrosHeader_h */

#ifdef DEBUG
#define FHLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define DebugLog(FORMAT,...) fprintf(stderr, "%s文件第%d行信息如下\t%s\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);
#else
#define FHLog(...)
#define DebugLog(FORMAT,...)
#endif

/** 获取APP名称 */
#define APP_NAME ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])
/** 程序版本号 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** 获取APP build版本 */
#define APP_BUILD ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])

/** 手机系统判定 */
#define SYSTEMVERSION  [[[UIDevice currentDevice] systemVersion] floatValue]
#define isIOS8 ([[[UIDevice currentDevice]systemVersion]floatValue] >= 8.0)
#define isIOS9 ((SYSTEMVERSION >= 9.0)?(YES):(NO))
#define IOS10 ((SYSTEMVERSION >= 10.0)?(YES):(NO))
#define IOS11 ((SYSTEMVERSION >= 11.0)?(YES):(NO))
#define IOS12 ((SYSTEMVERSION >= 12.0)?(YES):(NO))
#define IOS13 ((SYSTEMVERSION >= 13.0)?(YES):(NO))
#define iSLessIOS13 ((SYSTEMVERSION < 13.0)?(YES):(NO))

/** 手机类型判定 */
#define UI_IS_IPHONE  ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define iPhone5 (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define iPhone6 (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define iPhone6plus (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 736.0)
#define iPhoneX (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0)
// 横屏判断手机类型
#define iPhone5Landscape (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.width == 568.0)
#define iPhone6Landscape (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.width == 667.0)
#define iPhone6plusLandscape (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.width == 736.0 || [[UIScreen mainScreen] bounds].size.height == 736.0)
#define iPhoneXLandscape (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.width == 812.0)
// 判断ipad类型
#define kIPADScreenWidthRatio (kIPHONE_WIDTH / 768.0)
#define kIPADScreenHeightRatio (kIPHONE_HEIGHT / 1024.0)
#define kIPADLandscapeScreenWidthRatio  (kIPHONE_WIDTH / 1024.0)//横屏
#define kIPADLandscapeScreenHeightRatio (kIPHONE_HEIGHT / 768.0) //横屏

/** AppDelegate对象 */
#define kAppdelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

/** 屏幕尺寸 */
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width
#define statusHeight [UIApplication sharedApplication].statusBarFrame.size.height
//刘海 X_44 非X_20
#define Navi_Height ([UIApplication sharedApplication].statusBarFrame.size.height+44)
//如果是iponex留出安全区,安全区域高度
#define Safeplace (Main_Screen_Height>=812?34:0)
//底部标签栏高度
#define TabBarHeight (Main_Screen_Height>=812 ? (49.f+34.f) : 49.f)
//不同屏幕尺寸字体适配（375.0 667.0 是因为效果图为IPHONE6 如果不是则根据实际情况修改）
#define kScreenHeightRatio (Main_Screen_Width / 375.0)
// 以4.7寸屏的宽度为基准，计算宽比和高比
#define SCREEN_WIDTH_RATIO47   Main_Screen_Height / 667.0f
#define IsPortrait ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)

//对应的比例获取的字体大小
#define AdaptedWidth(x)  ceilf((x) * kScreenHeightRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define AdaptedFontSize(R)     CHINESE_SYSTEM(AdaptedWidth(R))

//  检查block是否可用 后面... 为参数，可不填
#define kSafeBlock(block,...) if (block) block(__VA_ARGS__);

//字符串为空
#define KCNSSTRING_ISEMPTY(str) (str == nil || [str isEqual:[NSNull null]] || str.length <= 0 || [str isEqualToString:@"(null)"]|| [str isEqualToString:@"<null>"])

//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define kLoginBgColor kRGB(251.0,251.0,251.0,1.0);
#define KBgColor kRGB(245.0,246.0,247.0,1.0)
#define KTextColor kRGB(153.0,153.0,153.0,1.0)
#define kNavBarColor kRGB(0, 122, 178, 1.0)

//字体
#define KFONT(size) [UIFont systemFontOfSize:size]
#define KBOLDFONT(size) [UIFont boldSystemFontOfSize:size]

//获取图片资源
#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]
#define WSWeakSelf __weak typeof(self) weakSelf = self;



#endif /* MacrosHeader_h */
