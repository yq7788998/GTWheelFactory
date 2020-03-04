//
//  GTAnimationViewController.m
//  wheelFactory
//
//  Created by GTY on 2020/2/15.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTAnimationViewController.h"

@interface GTAnimationViewController ()
@property (nonatomic, strong) UIImageView * imageView1;
@end

@implementation GTAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupView{
    
    self.imageView1 = ({
        UIImageView * imageView = [[UIImageView alloc]init];
        imageView;
    });
     
}


@end
