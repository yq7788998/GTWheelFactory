//
//  GTSimpleUILabelVC.m
//  wheelFactory
//
//  Created by GTY on 2020/1/15.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTSimpleUILabelVC.h"

@interface GTSimpleUILabelVC ()
@property (nonatomic, strong) UILabel * commonLabel1;
@end

@implementation GTSimpleUILabelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self commonlabel];
    [self commonlabelaa];
}

- (void) commonlabel{
    self.commonLabel1 = ({
        UILabel * label = [[UILabel alloc]init];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:16];
        label.numberOfLines = 0;
        label;
    });
    [self.view addSubview:self.commonLabel1];
    self.commonLabel1.frame = CGRectMake(10, 120, 320, 100);
    
    
}

- (void) commonlabelaa{
    NSString *content = @"2018-08-27 写博客 2018-08-28 写博客 2018-08-29 写博客";
    NSRange range;
    range = [content rangeOfString:@"写博客"];
    
    NSMutableArray *locationArr = [self calculateSubStringCount:content str:@"写博客"];
    NSMutableAttributedString *attstr = [[NSMutableAttributedString alloc] initWithString:content];
    for (int i=0; i<locationArr.count; i++) {
        if (i%3==0) {
            NSNumber *location = locationArr[i];
            [attstr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255.0f/255.0f green:45.0f/255.0f blue:81.0f/255.0f alpha:1.0f] range:NSMakeRange(location.integerValue-10, 10)];//改变\n前边的10位字符颜色，
        }else if (i%3 == 1) {
            NSNumber *location = locationArr[i];
            [attstr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255.0f/255.0f green:145.0f/255.0f blue:81.0f/255.0f alpha:1.0f] range:NSMakeRange(location.integerValue-10, 10)];//改变\n前边的10位字符颜色，
        }else if (i%3 == 2) {
            NSNumber *location = locationArr[i];
            [attstr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:155.0f/255.0f green:45.0f/255.0f blue:181.0f/255.0f alpha:1.0f] range:NSMakeRange(location.integerValue-10, 10)];//改变\n前边的10位字符颜色，
        }
    }
    self.commonLabel1.attributedText = attstr;
}

- (NSMutableArray*)calculateSubStringCount:(NSString *)content str:(NSString *)tab {
    int location = 0;
    NSMutableArray *locationArr = [NSMutableArray new];
    NSRange range = [content rangeOfString:tab];
    if (range.location == NSNotFound){
        return locationArr;
    }
    //声明一个临时字符串,记录截取之后的字符串
    NSString * subStr = content;
    while (range.location != NSNotFound) {
        if (location == 0) {
            location += range.location;
        } else {
            location += range.location + tab.length;
        }
        //记录位置
        NSNumber *number = [NSNumber numberWithUnsignedInteger:location];
        [locationArr addObject:number];
        //每次记录之后,把找到的字串截取掉
        subStr = [subStr substringFromIndex:range.location + range.length];
        NSLog(@"subStr %@",subStr);
        range = [subStr rangeOfString:tab];
        NSLog(@"rang %@",NSStringFromRange(range));
    }
    return locationArr;
}

@end
