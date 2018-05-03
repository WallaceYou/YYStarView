//
//  UIImage+UIColor.h
//  CEAir
//
//
//  Created by shiqianren on 2017/6/14.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIColor)
+ (instancetype)imageWithColor:(UIColor *)color;
+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size;
@end
