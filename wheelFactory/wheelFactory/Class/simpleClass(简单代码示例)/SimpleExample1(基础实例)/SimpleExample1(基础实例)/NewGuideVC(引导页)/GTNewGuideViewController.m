//
//  GTNewGuideViewController.m
//  wheelFactory
//
//  Created by GTY on 2020/2/8.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTNewGuideViewController.h"

@interface GTNewGuideViewController ()<UIScrollViewDelegate>
{
    UIPageControl * pageControl;
    int prePage;
}
@property (nonatomic, strong) UIScrollView * scroll;

@end

@implementation GTNewGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)setupView {
    self.scroll = [[UIScrollView alloc] init];
    self.scroll.delegate = self;
    self.scroll.frame = CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height);
    self.scroll.pagingEnabled = YES;
    self.scroll.scrollEnabled = YES;
    self.scroll.bounces = YES;
    self.scroll.showsHorizontalScrollIndicator = NO;
    self.scroll.showsVerticalScrollIndicator = NO;
    #ifdef __IPHONE_11_0
    if ([self.scroll respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        self.scroll.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    #endif
    [self.view addSubview:self.scroll];
    [self configView];
    //添加PageControl
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(120, 440, 80, 10)];
    pageControl.numberOfPages = 5;
    [self.view addSubview:pageControl];
}

//添加引导图
- (void)configView {
    if (self.gtnewGuideImgArray > 0) {
        for (int i = 0; i < self.gtnewGuideImgArray.count; i++) {
            UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(Main_Screen_Width*i, 0, Main_Screen_Width, Main_Screen_Height)];
            imgView.image = [UIImage imageNamed:self.gtnewGuideImgArray[i]];
            [self.scroll addSubview:imgView];
        }
        self.scroll.contentSize = CGSizeMake(Main_Screen_Width * self.gtnewGuideImgArray.count, Main_Screen_Height);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat x = scrollView.contentOffset.x + Main_Screen_Width;
    CGFloat flag = 45 + self.gtnewGuideImgArray.count * Main_Screen_Width;
    if(x>flag)
    {
        [self performSelector:@selector(toViewController:) withObject:nil afterDelay:1.0];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self setPageControl:scrollView];
}

- (void)setPageControl:(UIScrollView *)scrollView
{
        //还原上一个圆点
    UIImageView * preImgView = (UIImageView *)[pageControl viewWithTag:prePage+1];
    CGRect preRect = preImgView.frame;
    preRect.size = CGSizeMake(6, 6);
    preImgView.frame = preRect;
        //获取当前页
    int currPage = scrollView.contentOffset.x * 5 / scrollView.contentSize.width;
    pageControl.currentPage = currPage;
    prePage = currPage;
        //设置当前页圆点
//    [self setDot:currPage];

}

- (void)toViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    //设置第一次加载
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"didNewGuide"];
    [defaults synchronize];
}

//- (void)toLeft:(UIScrollView *)scroll
//{
//    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
//    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
//
//    [scroll addGestureRecognizer:swipe];
//}
//- (void)toRight:(UIScrollView *)scroll
//{
//    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
//    swipe.direction = UISwipeGestureRecognizerDirectionRight;
//
//    [scroll addGestureRecognizer:swipe];
//
//}
//- (void)move:(id)sender
//{
//    UISwipeGestureRecognizer * swipe = (UISwipeGestureRecognizer *)sender;
//    UIScrollView * scroll = (UIScrollView *)swipe.view;
//    CGPoint point =  scroll.contentOffset;
//    if(swipe.direction == UISwipeGestureRecognizerDirectionLeft)
//    {
//        if(point.x < 1280)
//            point.x += 320;
//    }
//    else
//    {
//        if(point.x>0)
//            point.x -= 320;
//    }
//    [scroll setContentOffset:point animated:YES];
//
//    [self performSelector:@selector(setPageControl:) withObject:scroll afterDelay:0.4];
//}

@end
