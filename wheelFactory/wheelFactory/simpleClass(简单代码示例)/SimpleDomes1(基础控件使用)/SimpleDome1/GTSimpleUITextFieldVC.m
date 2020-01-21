//
//  GTSimpleUITextFieldVC.m
//  wheelFactory
//
//  Created by GTY on 2020/1/15.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTSimpleUITextFieldVC.h"

@interface GTSimpleUITextFieldVC ()<UITextFieldDelegate>
{
    UITextField * myTextField;
}
@end

@implementation GTSimpleUITextFieldVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField * tf = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:tf];

    UIView * left = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    left.backgroundColor = [UIColor yellowColor];
    
    myTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 150, 30)];
    [myTextField becomeFirstResponder];
    myTextField.delegate = self;
    myTextField.borderStyle = UITextBorderStyleNone;
    myTextField.placeholder = @"请输入密码";
    myTextField.clearButtonMode = UITextFieldViewModeNever;
    myTextField.background = [UIImage imageNamed:@"sele_love.png"];
    [self.view addSubview:myTextField];
    
    myTextField.leftView = left;
    myTextField.leftViewMode = UITextFieldViewModeAlways;

}

#pragma UITextField_Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"begin editing");
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%@",textField.text);
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField.text.length <5)
        return YES;
    return NO;
}



@end
