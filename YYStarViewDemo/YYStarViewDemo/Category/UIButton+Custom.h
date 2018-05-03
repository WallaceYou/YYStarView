//
//  UIButton+Custom.h
//  SupremeGolfPro
//
//  Created by youyu on 2018/4/27.
//  Copyright © 2018年 software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Custom)

+ (UIButton *)buttonWithImageName:(NSString *)imageName bgImageName:(NSString *)bgImageName;

+ (UIButton *)buttonWithBgColor:(UIColor *)bgColor font:(UIFont *)font titleColor:(UIColor *)titleColor title:(NSString *)title;

@end
