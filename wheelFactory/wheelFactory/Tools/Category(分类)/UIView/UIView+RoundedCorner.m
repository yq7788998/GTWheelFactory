//
//  UIView+RoundedCorner.m
//  funchat
//
//  Created by Mac-iOS on 2017/11/8.
//  Copyright © 2017年 Mac-iOS. All rights reserved.
//

#import "UIView+RoundedCorner.h"
#import <objc/runtime.h>

static NSOperationQueue *fc_operationQueue;
static char fc_operationKey;

@implementation UIView (RoundedCorner)

+ (void)load {
    fc_operationQueue = [[NSOperationQueue alloc] init];
}

- (NSOperation *)fc_getOperation {
    id operation = objc_getAssociatedObject(self, &fc_operationKey);
    return operation;
}

- (void)fc_setOperation:(NSOperation *)operation {
    objc_setAssociatedObject(self, &fc_operationKey, operation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)fc_cancelOperation {
    NSOperation *operation = [self fc_getOperation];
    [operation cancel];
    [self fc_setOperation:nil];
}

- (void)fc_setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    [self fc_setCornerRadius:radius withBorderColor:borderColor borderWidth:borderWidth backgroundColor:nil backgroundImage:nil contentMode:UIViewContentModeScaleAspectFill];
}

- (void)fc_setFCRadius:(FCRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    [self fc_setFCRadius:radius withBorderColor:borderColor borderWidth:borderWidth backgroundColor:nil backgroundImage:nil contentMode:UIViewContentModeScaleAspectFill];
}

- (void)fc_setCornerRadius:(CGFloat)radius withBackgroundColor:(UIColor *)backgroundColor {
    [self fc_setCornerRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:backgroundColor backgroundImage:nil contentMode:UIViewContentModeScaleAspectFill];
}

- (void)fc_setFCRadius:(FCRadius)radius withBackgroundColor:(UIColor *)backgroundColor {
    [self fc_setFCRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:backgroundColor backgroundImage:nil contentMode:UIViewContentModeScaleAspectFill];
}

- (void)fc_setCornerRadius:(CGFloat)radius withImage:(UIImage *)image {
    [self fc_setCornerRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image contentMode:UIViewContentModeScaleAspectFill];
}

- (void)fc_setFCRadius:(FCRadius)radius withImage:(UIImage *)image {
    [self fc_setFCRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image contentMode:UIViewContentModeScaleAspectFill];
}

- (void)fc_setCornerRadius:(CGFloat)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode {
    [self fc_setCornerRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image contentMode:contentMode];
}

- (void)fc_setFCRadius:(FCRadius)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode {
    [self fc_setFCRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image contentMode:contentMode];
}

- (void)fc_setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage contentMode:(UIViewContentMode)contentMode {
    [self fc_setFCRadius:FCRadiusMake(radius, radius, radius, radius) withBorderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor backgroundImage:backgroundImage contentMode:contentMode];
}

- (void)fc_setFCRadius:(FCRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage contentMode:(UIViewContentMode)contentMode {
    [self fc_cancelOperation];
    
    [self fc_setFCRadius:radius withBorderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor backgroundImage:backgroundImage contentMode:contentMode size:CGSizeZero];
}

- (void)fc_setFCRadius:(FCRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage contentMode:(UIViewContentMode)contentMode size:(CGSize)size {
    
    __block CGSize _size = size;
    
    __weak typeof(self) wself = self;
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        if ([[wself fc_getOperation] isCancelled]) return;
        
        if (CGSizeEqualToSize(_size, CGSizeZero)) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                _size = wself.bounds.size;
            });
        }
        
        CGSize size2 = CGSizeMake(pixel(_size.width), pixel(_size.height));
        
        UIImage *image = [UIImage fc_imageWithRoundedCornersAndSize:size2 FCRadius:radius borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor backgroundImage:backgroundImage withContentMode:contentMode];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            __strong typeof(wself) self = wself;
            if ([[self fc_getOperation] isCancelled]) return;
            
            self.frame = CGRectMake(pixel(self.frame.origin.x), pixel(self.frame.origin.y), size2.width, size2.height);
            if ([self isKindOfClass:[UIImageView class]]) {
                ((UIImageView *)self).image = image;
            } else if ([self isKindOfClass:[UIButton class]] && backgroundImage) {
                [((UIButton *)self) setBackgroundImage:image forState:UIControlStateNormal];
            } else if ([self isKindOfClass:[UILabel class]]) {
                self.layer.backgroundColor = [UIColor colorWithPatternImage:image].CGColor;
            } else {
                self.layer.contents = (__bridge id _Nullable)(image.CGImage);
            }
        }];
    }];
    
    [self fc_setOperation:blockOperation];
    [fc_operationQueue addOperation:blockOperation];
}

static inline float pixel(float num) {
    float unit = 1.0 / [UIScreen mainScreen].scale;
    double remain = fmod(num, unit);
    return num - remain + (remain >= unit / 2.0? unit: 0);
}

@end
