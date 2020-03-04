//
//  UIImage+ThumbnailImage.m
//  funChat
//
//  Created by yanglei on 2018/1/31.
//  Copyright © 2018年 biyingkeji. All rights reserved.
//

#import "UIImage+ThumbnailImage.h"
#import <AVFoundation/AVFoundation.h>

@implementation UIImage (ThumbnailImage)

+ (UIImage *)firstFrameWithVideoURL:(NSURL *)url size:(CGSize)size
{
    // 获取视频第一帧
    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:url options:opts];
    AVAssetImageGenerator *generator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
    
    generator.appliesPreferredTrackTransform = YES;
    generator.maximumSize = CGSizeMake(size.width, size.height);
    NSError *error = nil;
    CGImageRef img = [generator copyCGImageAtTime:CMTimeMake(2, 10) actualTime:NULL error:&error];
    {
        UIImage *im = [UIImage imageWithCGImage:img];
        
        return im;
    }
    return nil;
}

@end
