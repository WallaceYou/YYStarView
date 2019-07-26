//
//  UIButton+Custom.m
//  YYStarViewDemo
//
//  Created by youyu on 2018/4/28.
//  Copyright © 2018年 youyu. All rights reserved.
//

#import "UIButton+Custom.h"
#import "UIImage+UIColor.h"

@implementation UIButton (Custom)

+ (UIButton *)buttonWithImageName:(NSString *)imageName bgImageName:(NSString *)bgImageName {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (![imageName isEqualToString:@""] && imageName != nil) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[imageName stringByAppendingString:@"_highlighted"]] forState:UIControlStateHighlighted];
    }
    
    if (![bgImageName isEqualToString:@""] && bgImageName != nil) {
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[imageName stringByAppendingString:@"_highlighted"]] forState:UIControlStateHighlighted];
    }
    
    return btn;
    
}


+ (UIButton *)buttonWithBgColor:(UIColor *)bgColor font:(UIFont *)font titleColor:(UIColor *)titleColor title:(NSString *)title {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setBackgroundImage:[UIImage imageWithColor:bgColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    return btn;
}


@end
