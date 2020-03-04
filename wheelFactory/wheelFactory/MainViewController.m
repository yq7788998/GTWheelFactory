//
//  MainViewController.m
//  wheelFactory
//
//  Created by GTY on 2020/1/3.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "MainViewController.h"
#import "GTSimpleDomeTableViewListVC.h"
#import "GTSimpleExampleTableViewListVC.h"

@interface MainViewController ()

@property (nonatomic, strong)GTSimpleDomeTableViewListVC * simpvc;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.simpvc = [[GTSimpleExampleTableViewListVC alloc]init];
//    self.simpvc = [[GTSimpleDomeTableViewListVC alloc]init];
    [self.navigationController pushViewController:self.simpvc animated:YES];
}


@end
