//
//  NSString+BJExtension.h
//  funchat
//
//  Created by Mac-iOS on 2017/11/8.
//  Copyright © 2017年 Mac-iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+BJExtension.h"

@interface NSString (BJExtension)
/**
 *  判断是否是中文
 */
-(BOOL)isChinese;
/**
 *  去掉前后空格
 */
-(NSString *)trim;
///**
// *  是否为空 有问题
// */
//-(BOOL)isEmpty;

//字符串不为空
- (BOOL)isNotBlank;

/**
 前面后面各一个三角
 */
//- (NSAttributedString *)getTitleDecorateStr;


/**
 返回左右各一个有一个图片的富文本

 @param lefgImg 左边图片名字
 @param rightImg 右边图片名字
 @param fontsize 字体大小
 @param color 字体颜色
 @param extendStr 需要额外添加颜色的文字
 @return 最后得到的文字
 */
- (NSAttributedString *)attributeWithleftImg:(NSString *)lefgImg
                                    rightImg:(NSString *)rightImg
                                    fontsize:(CGFloat)fontsize
                                   textColor:(UIColor *)color
                                   extendStr:(NSString *)extendStr;



- (NSAttributedString *)attributeWithleftImg:(NSString *)lefgImg
                                    fontsize:(CGFloat)fontsize
                                   textColor:(UIColor *)color
                                   extendStr:(NSString *)extendStr ;
//新改版传显示蓝色的字体
- (NSAttributedString *)newblueattributeWithleftImg:(NSString *)lefgImg
                                           rightImg:(NSString *)rightImg
                                           fontsize:(CGFloat)fontsize
                                          textColor:(UIColor *)color
                                          extendStr:(NSString *)extendStr;
/**
 字符串长度
 */
- (CGFloat)widthForFont:(UIFont *)font;

/**
 判断字符只包含数字或字母 长度在min和max之间
 
 @param minLength 最小长度
 @param maxLength 最大长度
 @return 是否合法
 */
- (BOOL)judgeStringLegalMinLength:(NSInteger)minLength maxLength:(NSInteger)maxLength;

/**
 获取两个字符串中间的字符
 
 @param startString 开始的字符串
 @param endString 结束的字符串
 @return 结果
 */
- (NSString *)getStringInStartString:(NSString *)startString endString:(NSString *)endString;


/**
 是否是正确的email
 */
- (BOOL)isEmailAddress;

///获取 文件/文件夹  大小
- (unsigned long long)fileSize;

@end
