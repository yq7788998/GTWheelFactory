//
//  UIImage+ThumbnailImage.h
//  funChat
//
//  Created by yanglei on 2018/1/31.
//  Copyright © 2018年 biyingkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ThumbnailImage)
+ (UIImage *)firstFrameWithVideoURL:(NSURL *)url size:(CGSize)size;
@end
