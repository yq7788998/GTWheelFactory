//
//  GTSimpleUIViewVC.m
//  wheelFactory
//
//  Created by GTY on 2020/1/15.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTSimpleUIViewVC.h"

@interface GTSimpleUIViewVC ()

@end

@implementation GTSimpleUIViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//常用线条
- (void)creatLine{
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor colorWithHexString:@"#D8D8D8"];
    [self.view addSubview:line];
    line.frame = CGRectMake(0, 0, Main_Screen_Width, 1);
}



@end
