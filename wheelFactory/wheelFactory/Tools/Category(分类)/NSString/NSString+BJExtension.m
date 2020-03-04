//
//  NSString+BJExtension.m
//  funchat
//
//  Created by Mac-iOS on 2017/11/8.
//  Copyright © 2017年 Mac-iOS. All rights reserved.
//

#import "NSString+BJExtension.h"
#define UI_IS_IPHONE  ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define iPhone5 (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
@implementation NSString (BJExtension)

-(NSString *)trim{
    if (self!=nil) {
        return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }else{
        return nil;
    }
}
-(BOOL)isChinese{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}
//-(BOOL)isEmpty{
//
//    // 判断是否为空串
//    if (self == nil || self == NULL) {
//        return YES;
//    }else if ([self isKindOfClass:[NSNull class]]) {
//        return YES;
//    }else if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
//        return YES;
//    }else{
//        return NO;
//    }
//}

- (BOOL)isNotBlank {
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isEmailAddress {
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [pre evaluateWithObject:self];
}

//- (NSString *)getAgeWithBirthdayFormatter:(NSString *)formatter {
//    if (![formatter isNotBlank]) {
//        formatter = @"yyyy-MM-dd";
//    }
//    NSDate *birthday = [[FH_UniversalTools shareTools] stringtoDate:self formatter:formatter];
//    NSDate *today = [NSDate date];
//    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//
//    NSUInteger unitFlags = NSCalendarUnitYear;
//
//    NSDateComponents *components = [gregorian components:unitFlags fromDate:birthday toDate:today options:0];
//
//    //距现在多少年
//    NSInteger age = [components year];
//    return [NSString stringWithFormat:@"%ld",(long)age];
//}

- (NSAttributedString *)getTitleDecorateStr {
    NSString *str = [self copy];
    str = [NSString stringWithFormat:@" %@ ",str];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:@"common_titleDecorate"];
    attch.bounds = CGRectMake(0, 0, 8, 8);
    NSAttributedString *imgString = [NSAttributedString attributedStringWithAttachment:attch];
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    [attrString addAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor],
                                NSFontAttributeName : [UIFont systemFontOfSize:12]} range:NSMakeRange(0, str.length)];
    
    [attrString insertAttributedString:imgString atIndex:0];
    [attrString appendAttributedString:imgString];
    
    return attrString;
}

- (NSAttributedString *)attributeWithleftImg:(NSString *)lefgImg rightImg:(NSString *)rightImg fontsize:(CGFloat)fontsize textColor:(UIColor *)color extendStr:(NSString *)extendStr {
    NSString *str;
    if ([lefgImg isNotBlank] && [rightImg isNotBlank]) {
        
        if ([lefgImg isEqualToString:rightImg]) {
            str = [NSString stringWithFormat:@" %@ ",[self copy]];
        }else{
            str = [NSString stringWithFormat:@"  %@  ",[self copy]];
        }
        
    }else {
        str = [self copy];
    }
    CGFloat offset = 0.f;
    if (![lefgImg isEqualToString:rightImg]) {
        offset = -2;
    }
    
    NSAttributedString *leftImgStr;
    NSAttributedString *rightImgStr;
    if (lefgImg) {
        leftImgStr = [self getImageAttrWithImage:[UIImage imageNamed:lefgImg] offset:offset];
    }
    if (rightImg) {
        rightImgStr = [self getImageAttrWithImage:[UIImage imageNamed:rightImg] offset:offset];
    }
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    [attrString addAttributes:@{NSForegroundColorAttributeName : color,
                                NSFontAttributeName : [UIFont systemFontOfSize:14]} range:NSMakeRange(0, str.length)];
    if ([extendStr isNotBlank]) {
        [attrString addAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor],
                                    NSFontAttributeName : [UIFont systemFontOfSize:14]} range:[str rangeOfString:extendStr]];
    }
    if (leftImgStr) {
        [attrString insertAttributedString:leftImgStr atIndex:0];
    }
    if (rightImgStr) {
        [attrString appendAttributedString:rightImgStr];
    }
    
    return attrString;
}

- (NSAttributedString *)newblueattributeWithleftImg:(NSString *)lefgImg rightImg:(NSString *)rightImg fontsize:(CGFloat)fontsize textColor:(UIColor *)color extendStr:(NSString *)extendStr {
    NSString *str = [self copy];
    CGFloat offset = 0.f;
    if ([lefgImg isEqualToString:rightImg]) {
        str = [NSString stringWithFormat:@" %@",str];
    }else {
        offset = -3;
    }
    
    NSAttributedString *leftImgStr = [self getImageAttrWithImage:[UIImage imageNamed:lefgImg] offset:offset];
    NSAttributedString *rightImgStr = [self getImageAttrWithImage:[UIImage imageNamed:rightImg] offset:offset];
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    [attrString addAttributes:@{NSForegroundColorAttributeName : color,
                                NSFontAttributeName :[UIFont systemFontOfSize:14]} range:NSMakeRange(0, str.length)];
    if ([extendStr isNotBlank]) {
        [attrString addAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor],
                                    NSFontAttributeName : [UIFont systemFontOfSize:14]} range:[str rangeOfString:extendStr]];
    }
    [attrString insertAttributedString:leftImgStr atIndex:0];
    [attrString appendAttributedString:rightImgStr];
    
    return attrString;
}
- (NSAttributedString *)attributeWithleftImg:(NSString *)lefgImg fontsize:(CGFloat)fontsize textColor:(UIColor *)color extendStr:(NSString *)extendStr {
    NSString *str = [self copy];
    CGFloat offset = -2.0f;
    
    NSAttributedString *leftImgStr = [self getImageAttrWithImageLeft:[UIImage imageNamed:lefgImg] offset:offset];
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    [attrString addAttributes:@{NSForegroundColorAttributeName : color,
                                NSFontAttributeName : [UIFont systemFontOfSize:14]} range:NSMakeRange(0, str.length)];
    if ([extendStr isNotBlank]) {
        [attrString addAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor],
                                    NSFontAttributeName : [UIFont systemFontOfSize:14]} range:[str rangeOfString:extendStr]];
    }
    [attrString insertAttributedString:leftImgStr atIndex:0];
    
    return attrString;
}

- (NSAttributedString *)getImageAttrWithImageLeft:(UIImage *)image offset:(CGFloat)offset {
    if (image.size.height < 10) {
        offset = 0;
    }
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = image;
    if (iPhone5) {
        attch.bounds = CGRectMake(-3, offset, image.size.width-6, image.size.height-6);
    }else{
        
        attch.bounds = CGRectMake(-3, offset-1, image.size.width-5, image.size.height-5);
    }
    
    NSAttributedString *imgString = [NSAttributedString attributedStringWithAttachment:attch];
    return imgString;
}

- (NSAttributedString *)getImageAttrWithImage:(UIImage *)image offset:(CGFloat)offset {
    if (image.size.height < 10) {
        offset = 1;
    }
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = image;
    attch.bounds = CGRectMake(0, offset, image.size.width, image.size.height);
    NSAttributedString *imgString = [NSAttributedString attributedStringWithAttachment:attch];
    return imgString;
}

- (CGFloat)widthForFont:(UIFont *)font {
    CGSize size = [self sizeForFont:font size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    return size.width;
}

- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}

- (BOOL)judgeStringLegalMinLength:(NSInteger)minLength maxLength:(NSInteger)maxLength {
    BOOL result = NO;
    if ([self length] >= minLength && [self length] <= maxLength){
        NSString *str =@"^[A-Za-z0-9]+$";
        //        NSString *str =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
        NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
        if ([emailTest evaluateWithObject:self]) {
            result = YES;
        }
    }
    return result;
}

- (NSString *)getStringInStartString:(NSString *)startString endString:(NSString *)endString {
    NSString *string = [self copy];
    NSRange startRange = [string rangeOfString:startString];
    NSRange endRange = [string rangeOfString:endString];
    
    NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
    NSString *result;
    if (startRange.length == 0 || endRange.length == 0) {
        result = @"";
    }else {
        result = [string substringWithRange:range];
    }
    return result;
}

- (unsigned long long)fileSize
{
    // 总大小
    unsigned long long size = 0;
    NSString *sizeText = nil;
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL isDir = NO;
    BOOL exist = [manager fileExistsAtPath:self isDirectory:&isDir];
    
    // 判断路径是否存在
    if (!exist) return size;
    if (isDir) { // 是文件夹
        NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:self];
        for (NSString *subPath in enumerator) {
            NSString *fullPath = [self stringByAppendingPathComponent:subPath];
            size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
            
        }
    }else{ // 是文件
        size += [manager attributesOfItemAtPath:self error:nil].fileSize;
    }
    return size;
}

@end
