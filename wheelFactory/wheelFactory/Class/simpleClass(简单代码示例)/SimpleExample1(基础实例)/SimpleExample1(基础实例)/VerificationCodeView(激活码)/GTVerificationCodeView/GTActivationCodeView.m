//
//  GTActivationCodeView.m
//  wheelFactory
//
//  Created by GTY on 2020/5/11.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTActivationCodeView.h"
static NSString *NUMBERS = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

@interface GTActivationCodeView()<UITextFieldDelegate>

@end

@implementation GTActivationCodeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupView:frame];
    }
    return self;
}

- (void)setupView:(CGRect)frame {
    
    self.textField1 = [GTMenuVisibleNoTextFieldView new];
    self.textField1.delegate = self;
    self.textField1.layer.borderWidth = 1;
    self.textField1.layer.borderColor = [UIColor colorWithRed:254/255.0 green:156/255.0 blue:44/255.0 alpha:1.0].CGColor;
    self.textField1.layer.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1.0].CGColor;
    self.textField1.layer.cornerRadius = 20;
    self.textField1.clearButtonMode = UITextFieldViewModeNever;
    self.textField1.textAlignment = NSTextAlignmentCenter;
    self.textField1.keyboardType = UIKeyboardTypeASCIICapable;
    self.textField1.placeholder = @"";
    self.textField1.font = [UIFont systemFontOfSize:12];
    self.textField1.borderStyle = UITextBorderStyleNone;
    [self addSubview:self.textField1];
    [self.textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(5);
        make.left.offset(20);
        make.height.offset(40);
    }];
    
    self.textField2 = [GTMenuVisibleNoTextFieldView new];
    self.textField2.delegate = self;
    self.textField2.layer.borderWidth = 1;
    self.textField2.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0].CGColor;
    self.textField2.layer.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1.0].CGColor;
    self.textField2.layer.cornerRadius = 20;
    self.textField2.clearButtonMode = UITextFieldViewModeNever;
    self.textField2.textAlignment = NSTextAlignmentCenter;
    self.textField2.keyboardType = UIKeyboardTypeASCIICapable;
    self.textField2.placeholder = @"";
    self.textField2.font = [UIFont systemFontOfSize:12];
    self.textField2.borderStyle = UITextBorderStyleNone;
    [self addSubview:self.textField2];
    [self.textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(5);
        make.left.equalTo(self.textField1.mas_right).offset(16);
        make.width.equalTo(self.textField1.mas_width).offset(0);
        make.height.offset(40);
    }];
    
    self.textField3 = [GTMenuVisibleNoTextFieldView new];
    self.textField3.delegate = self;
    self.textField3.layer.borderWidth = 1;
    self.textField3.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0].CGColor;
    self.textField3.layer.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1.0].CGColor;
    self.textField3.layer.cornerRadius = 20;
    self.textField3.clearButtonMode = UITextFieldViewModeNever;
    self.textField3.textAlignment = NSTextAlignmentCenter;
    self.textField3.keyboardType = UIKeyboardTypeASCIICapable;
    self.textField3.placeholder = @"";
    self.textField3.font = [UIFont systemFontOfSize:12];
    self.textField3.borderStyle = UITextBorderStyleNone;
    [self addSubview:self.textField3];
    [self.textField3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(5);
        make.left.equalTo(self.textField2.mas_right).offset(16);
        make.width.equalTo(self.textField1.mas_width).offset(0);
        make.right.offset(-20);
        make.height.offset(40);
    }];
    
    UIView * line1 = [UIView new];
    line1.backgroundColor = [UIColor colorWithHexString:@"#D8D8D8"];
    [self addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.textField1.mas_right).offset(5);
        make.centerY.equalTo(self.textField1.mas_centerY).offset(0);
        make.width.offset(6);
        make.height.offset(1);
    }];
    
    UIView * line2 = [UIView new];
    line2.backgroundColor = [UIColor colorWithHexString:@"#D8D8D8"];
    [self addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.textField2.mas_right).offset(5);
        make.centerY.equalTo(self.textField1.mas_centerY).offset(0);
        make.width.offset(6);
        make.height.offset(1);
    }];
    
    [self.textField1 becomeFirstResponder];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChangeSelection:) name:UITextFieldTextDidChangeNotification object:self.textField1];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChangeSelection:) name:UITextFieldTextDidChangeNotification object:self.textField2];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChangeSelection:) name:UITextFieldTextDidChangeNotification object:self.textField3];
}

- (void)clearAllTextFieldStr {
    self.textField1.text = @"";
    self.textField2.text = @"";
    self.textField3.text = @"";
    self.textField1.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0].CGColor;
    self.textField1.layer.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1.0].CGColor;
    self.textField2.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0].CGColor;
    self.textField2.layer.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1.0].CGColor;
    self.textField3.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0].CGColor;
    self.textField3.layer.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1.0].CGColor;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.textField1.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0].CGColor;
    self.textField1.layer.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1.0].CGColor;
    self.textField2.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0].CGColor;
    self.textField2.layer.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1.0].CGColor;
    self.textField3.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0].CGColor;
    self.textField3.layer.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1.0].CGColor;
    textField.layer.borderColor = [UIColor colorWithRed:254/255.0 green:156/255.0 blue:44/255.0 alpha:1.0].CGColor;
    textField.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:247/255.0 blue:231/255.0 alpha:1.0].CGColor;
    textField.autocorrectionType=UITextAutocorrectionTypeNo;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%@",textField.text);
    NSString *activationCode = @"";
    activationCode = [NSString stringWithFormat:@"%@-%@-%@",self.textField1.text,self.textField2.text,self.textField3.text];
    if (self.inputActivationCodeBlock) {
        self.inputActivationCodeBlock(activationCode);
        NSLog(@"激活码%@",activationCode);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    //限制只能输入数字和小数点
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basicTest = [string isEqualToString:filtered];
    if(!basicTest) {
        return NO;
    }

    if (range.length == 1 && string.length == 0) {
        return YES;
    }
    
    if (textField.text.length > 4) {
        return NO;
    }
    
    if (textField == self.textField1) {
        if (self.textField1.text.length >= 4) {
            [self.textField2 becomeFirstResponder];
        }
    }else if (textField == self.textField2) {
        if (self.textField2.text.length >= 4) {
            [self.textField3 becomeFirstResponder];
        }
    }else if (textField == self.textField3) {
        if (self.textField3.text.length >= 4) {
            [self.textField3 resignFirstResponder];
        }
    }
    
    

    return YES;
}

- (void)textFieldDidChangeSelection:(NSNotification *)notification {
    
    GTMenuVisibleNoTextFieldView * textfield = [GTMenuVisibleNoTextFieldView new];
    if ([notification  isKindOfClass:[GTMenuVisibleNoTextFieldView class]]) {
        textfield = (GTMenuVisibleNoTextFieldView *)notification;
    }else{
        textfield = notification.object;
    }
    //输入内容转换成大写
    textfield.text = [textfield.text uppercaseString];
    
    if (textfield == self.textField2 && textfield.text.length == 0) {
        [self.textField1 resignFirstResponder];
        [self.textField2 resignFirstResponder];
        [self.textField3 resignFirstResponder];
        [self.textField1 becomeFirstResponder];
    }
    if (textfield == self.textField3 && textfield.text.length == 0) {
        [self.textField1 resignFirstResponder];
        [self.textField2 resignFirstResponder];
        [self.textField3 resignFirstResponder];
        [self.textField2 becomeFirstResponder];
    }
    
}

@end
