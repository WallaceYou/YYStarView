//
//  UIImage+UIColor.h
//  YYStarViewDemo
//
//  Created by youyu on 2018/4/28.
//  Copyright © 2018年 youyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIColor)
+ (instancetype)imageWithColor:(UIColor *)color;
+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size;
@end
