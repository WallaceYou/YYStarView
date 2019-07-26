//
//  UIImage+UIColor.m
//  YYStarViewDemo
//
//  Created by youyu on 2018/4/28.
//  Copyright © 2018年 youyu. All rights reserved.
//

#import "UIImage+UIColor.h"

@implementation UIImage (UIColor)
+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [UIImage imageWithColor:color size:CGSizeMake(1, 1)];
}
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pressedColorImg;
}
@end
