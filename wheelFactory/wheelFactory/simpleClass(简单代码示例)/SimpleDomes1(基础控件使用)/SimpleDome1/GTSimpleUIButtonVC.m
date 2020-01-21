//
//  GTSimpleUIButtonVC.m
//  wheelFactory
//
//  Created by GTY on 2020/1/15.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTSimpleUIButtonVC.h"

@interface GTSimpleUIButtonVC ()
@property (nonatomic, strong) UIButton * commonBtn1;
@property (nonatomic, strong) UIButton * commonBtn2;
@end

@implementation GTSimpleUIButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SimpleUIButton";
    self.view.backgroundColor = [UIColor whiteColor];
    [self commonBtn];
}

- (void)commonBtn{
    
    self.commonBtn1 =  ({
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.cornerRadius = (40) / 2;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor blackColor].CGColor;
        btn.backgroundColor = [UIColor whiteColor];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)]; //扩大响应区范围设置图片对应边距
        [btn setTitle:[NSString stringWithFormat:@"取消"] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(commonBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn;
    });
    [self.view addSubview:self.commonBtn1];
    self.commonBtn1.frame = CGRectMake(20, 70, 100, 40);
    
    
    self.commonBtn2 =  ({
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn中"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn中亮"] forState:UIControlStateSelected];
        [btn setTitle:[NSString stringWithFormat:@"确定"] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(commonBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn;
    });
    [self.view addSubview:self.commonBtn2];
    self.commonBtn2.frame = CGRectMake(160, 70, 122, 44);
    
}

- (void)commonBtnAction:(UIButton *)btn {
    
}

@end
