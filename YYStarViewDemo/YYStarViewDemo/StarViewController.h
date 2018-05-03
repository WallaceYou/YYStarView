//
//  StarViewController.h
//  YYStarViewDemo
//
//  Created by youyu on 2018/5/2.
//  Copyright © 2018年 youyu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, StarViewControllerType) {
    StarViewControllerTypeNoSetting,
    StarViewControllerTypeOneTimeSetting,
    StarViewControllerTypeReversalSetting,
};

@interface StarViewController : UIViewController

- (instancetype)initWithType:(StarViewControllerType)type;

@end
