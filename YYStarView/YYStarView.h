//
//  YYStarView.h
//  StarComment
//
//  Created by youyu on 2018/4/28.
//  Copyright © 2018年 youyu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, StarViewType) {
    StarViewTypeShow = 1,
    StarViewTypeSelect = 2,
};

@interface YYStarView : UIView

/** 亮色星图片名称，如果不设置，则使用默认图片 */
@property (nonatomic, copy) NSString *starBrightImageName;

/** 暗色星图片名称，如果不设置，则使用默认图片 */
@property (nonatomic, copy) NSString *starDarkImageName;

/** 星与星之间的间距，如果不设置，则默认为0 */
@property (nonatomic, assign) CGFloat starSpacing;

/** 每颗星的大小，如果不设置，则按照图片大小自适应 */
@property (nonatomic, assign) CGSize starSize;

/** 星的个数，如果不设置，则默认为5颗 */
@property (nonatomic, assign) NSInteger starCount;

/** starView的类型，如果不设置，默认为Select类型 */
@property (nonatomic, assign) StarViewType type;

/** 星级评分，如果不设置，默认为0颗星 */
@property (nonatomic, assign) CGFloat starScore;

/** 点击星回调的block */
@property (nonatomic, copy) void(^starClick)(void);

@end
