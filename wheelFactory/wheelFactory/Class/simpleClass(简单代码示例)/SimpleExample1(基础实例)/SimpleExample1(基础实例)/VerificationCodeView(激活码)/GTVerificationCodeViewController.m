//
//  GTVerificationCodeViewController.m
//  wheelFactory
//
//  Created by GTY on 2020/4/17.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTVerificationCodeViewController.h"
#import "GTActivationCodeView.h"

@interface GTVerificationCodeViewController ()
@property (nonatomic, strong)GTActivationCodeView * activationCodeTextFView;
@property (nonatomic, strong)UISlider * sliderView;
@property (nonatomic, strong)UILabel * passLabel;
@property (nonatomic, strong)NSString *loginActivateCode;

@end

@implementation GTVerificationCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)setupView {
    
    self.activationCodeTextFView = [GTActivationCodeView new];
    [self.view addSubview:self.activationCodeTextFView];
    [self.activationCodeTextFView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(100);
        make.height.offset(40);
    }];
    
    self.sliderView = [[UISlider alloc]initWithFrame:CGRectMake(20, 90 + Navi_Height + 80 + 30, Main_Screen_Width -40, 40)];
    [self.view addSubview:self.sliderView];
    self.sliderView.minimumValue = 0.0;
    self.sliderView.maximumValue = 1.0;
    [self.sliderView setContinuous:YES];
    [self.sliderView setThumbImage:[UIImage imageNamed:@"盒子滑条左"] forState:UIControlStateNormal];
    [self.sliderView setThumbImage:[UIImage imageNamed:@"盒子滑条左"] forState:UIControlStateHighlighted];
    [self.sliderView setMinimumTrackImage:[UIImage imageNamed:@"盒子滑条Minbg"] forState:UIControlStateNormal];
    [self.sliderView setMaximumTrackImage:[UIImage imageNamed:@"盒子滑条bg"] forState:UIControlStateNormal];
    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.right.offset(-20);
        make.top.equalTo(self.activationCodeTextFView.mas_bottom).offset(30 * kScreenHeightRatio);
        make.height.offset(44);
    }];
    self.sliderView.value = 0.0;
    [self.sliderView addTarget:self action:@selector(sliderViewValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderView addTarget:self action:@selector(sliderViewTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    self.sliderView.enabled = NO;
    
    self.passLabel = [[UILabel alloc]init];
    self.passLabel.text = @"验证通过";
    self.passLabel.textColor = [UIColor whiteColor];
    self.passLabel.font = [UIFont systemFontOfSize:14];
    self.passLabel.textAlignment = NSTextAlignmentCenter;
    self.passLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.passLabel];
    self.passLabel.hidden = YES;
    [self.passLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.right.offset(-20);
        make.top.equalTo(self.activationCodeTextFView.mas_bottom).offset(30 * kScreenHeightRatio);
        make.height.offset(44);
    }];
    
    WSWeakSelf
       self.activationCodeTextFView.inputActivationCodeBlock = ^(NSString * _Nonnull activationCodeStr) {
           weakSelf.loginActivateCode = activationCodeStr;
           if (activationCodeStr.length == 14) {
               weakSelf.sliderView.enabled = YES;
               if (weakSelf.sliderView.value == 1.0) {
                   weakSelf.sliderView.enabled = NO;
               }
           }else {
               weakSelf.sliderView.value = 0;
               [weakSelf.sliderView setThumbImage:[UIImage imageNamed:@"盒子滑条左"] forState:UIControlStateNormal];
               [weakSelf.sliderView setThumbImage:[UIImage imageNamed:@"盒子滑条左"] forState:UIControlStateHighlighted];
               weakSelf.passLabel.hidden = YES;
               weakSelf.sliderView.enabled = NO;
             
           }
       };
}


- (void)sliderViewValueChanged:(UISlider *)slider {
    NSLog(@"%f",slider.value);
    if (slider.value == 1.0) {
        [self.sliderView setThumbImage:[UIImage imageNamed:@"盒子滑条右"] forState:UIControlStateNormal];
        [self.sliderView setThumbImage:[UIImage imageNamed:@"盒子滑条右"] forState:UIControlStateHighlighted];
        self.passLabel.hidden = NO;
    }else {
        [self.sliderView setThumbImage:[UIImage imageNamed:@"盒子滑条左"] forState:UIControlStateNormal];
        [self.sliderView setThumbImage:[UIImage imageNamed:@"盒子滑条左"] forState:UIControlStateHighlighted];
        self.passLabel.hidden = YES;
    }
}

- (void)sliderViewTouchUpInside:(UISlider *)slider {
    NSLog(@"%f",slider.value);
    if (slider.value == 1.0) {
        self.passLabel.hidden = NO;
        self.sliderView.enabled = NO;
    }else {
        self.sliderView.value = 0.0;
        self.passLabel.hidden = YES;
    }
}


@end
