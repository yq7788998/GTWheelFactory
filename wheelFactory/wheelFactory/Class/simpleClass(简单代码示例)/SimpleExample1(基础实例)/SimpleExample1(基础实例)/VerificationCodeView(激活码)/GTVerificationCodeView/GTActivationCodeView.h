//
//  GTActivationCodeView.h
//  wheelFactory
//
//  Created by GTY on 2020/5/11.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMenuVisibleNoTextFieldView.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTActivationCodeView : UIView

@property (nonatomic, strong) GTMenuVisibleNoTextFieldView * textField1;

@property (nonatomic, strong) GTMenuVisibleNoTextFieldView * textField2;

@property (nonatomic, strong) GTMenuVisibleNoTextFieldView * textField3;

@property (copy, nonatomic) void (^inputActivationCodeBlock)(NSString *activationCodeStr);

- (void)clearAllTextFieldStr;

@end

NS_ASSUME_NONNULL_END
