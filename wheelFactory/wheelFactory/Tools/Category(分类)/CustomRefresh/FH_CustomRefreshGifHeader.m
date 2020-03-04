//
//  FH_CustomRefreshGifHeader.m
//  funChat
//
//  Created by sunqingkai on 2018/4/14.
//  Copyright © 2018年 biyingkeji. All rights reserved.
//

#import "FH_CustomRefreshGifHeader.h"
#import "UIImage+GIF.h"

@implementation FH_CustomRefreshGifHeader
-(void)prepare{
    [super prepare];
    
    NSString * bundlePath = [[NSBundle mainBundle] pathForResource:@"loading" ofType :@"gif"];
    NSData  *imageData = [NSData dataWithContentsOfFile:bundlePath];
//    self.gifView.image = [UIImage sd_animatedGIFWithData:imageData];
    self.mj_h = MJRefreshHeaderHeight + 40;
}

-(void)placeSubviews{
    [super placeSubviews];
//    self.mj_h = 81;
//    // 设置y值(当自己的高度发生改变了，肯定要重新调整Y值，所以放到placeSubviews方法中设置y值)
//    self.mj_y = - self.mj_h - self.ignoredScrollViewContentInsetTop;
//    self.gifView.contentMode = UIViewContentModeCenter;
//
//    self.gifView.mj_w = self.mj_w;
//    self.gifView.mj_h = 54;
//    self.stateLabel.frame = CGRectMake(0, 54, self.mj_w, 27);
    
    self.gifView.mj_y = 10;
    self.gifView.mj_h = MJRefreshHeaderHeight;
    
    if (self.stateLabel.hidden && self.lastUpdatedTimeLabel.hidden) {
        self.gifView.contentMode = UIViewContentModeCenter;
    } else {
        self.gifView.contentMode = UIViewContentModeRight;
        self.gifView.mj_w = self.mj_w /2;
    }
    
    self.stateLabel.mj_w = self.mj_w/2;
    self.stateLabel.mj_x = self.mj_w/2;
    self.stateLabel.mj_y = self.gifView.mj_y;
    self.stateLabel.mj_h = self.gifView.mj_h/2;
    if (self.lastUpdatedTimeLabel.hidden) {
        self.stateLabel.mj_h = self.gifView.mj_h;
    }
    self.stateLabel.textAlignment = 0;
    
    self.lastUpdatedTimeLabel.mj_w = self.mj_w/2;
    self.lastUpdatedTimeLabel.mj_x = self.mj_w/2;
    self.lastUpdatedTimeLabel.mj_y = self.stateLabel.fc_bottom;
    self.lastUpdatedTimeLabel.mj_h = self.gifView.mj_h/2;
    if (self.stateLabel.hidden) {
        self.lastUpdatedTimeLabel.mj_h = self.gifView.mj_h;
    }
    self.lastUpdatedTimeLabel.textAlignment = 0;
}
@end
