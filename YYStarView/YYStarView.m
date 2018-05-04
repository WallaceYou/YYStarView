//
//  YYStarView.m
//  StarComment
//
//  Created by youyu on 2018/4/28.
//  Copyright © 2018年 youyu. All rights reserved.
//

#import "YYStarView.h"

@interface YYStarView ()


@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation YYStarView

#pragma mark - Init

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUpSubviews];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setUpSubviews];
        
    }
    return self;
}


#pragma mark - View Layout
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //1.首先，先删除所有约束
    [self removeConstraints:self.constraints];
    
    //2.然后再添加新的约束
    //2.1.准备VFL中子视图与实际对象引用之间的关联关系的字典
    NSMutableDictionary *diction = [NSMutableDictionary new];
    
    //2.2.准备水平方向的VFL表达式
    NSMutableString *hVFL = [[NSMutableString alloc] initWithString:@"H:|"];
    //2.3.准备竖直方向的VFL表达式
    NSMutableString *vVFL = [[NSMutableString alloc] initWithString:@"V:|"];
    
    //2.3.创建一个VFL中的长度参照表
    NSDictionary *metrics = @{@"left":@0,@"right":@0,@"top":@0,@"bottom":@0,@"space":@(self.starSpacing)};
    
    for (int i = 0; i < self.buttons.count; i++) {
        
        UIButton *starBtn = [self.buttons objectAtIndex:i];
        
        //2.4.关掉自动翻译功能（必须关闭，否则VFL不生效）
        starBtn.translatesAutoresizingMaskIntoConstraints = NO;
        
        //2.5.设置关联关系的字典
        [diction setValue:starBtn forKey:[NSString stringWithFormat:@"button%i",i+1]];
        
        //2.6.设置VFL表达式
        
        CGFloat starWidth = self.starSize.width;
        CGFloat starHeight = self.starSize.height;
        
        if (i == 0) {
            
            if (starWidth > 0) {//如果有设置starSize，则按照starSize显示
                [hVFL appendFormat:@"-left-[button%i(%lf)]",i+1,starWidth];
            } else {//如果没有设置starSize，则按照图片大小自适应
                [hVFL appendFormat:@"-left-[button%i]",i+1];
            }
            
            if (starHeight > 0) {
                [vVFL appendFormat:@"-top-[button%i(%lf,",i+1,starHeight];
            } else {
                [vVFL appendFormat:@"-top-[button%i(",i+1];
            }
            
            if (self.buttons.count == 1) {
                
                [vVFL deleteCharactersInRange:NSMakeRange(vVFL.length-1, 1)];
                
                if (starWidth > 0) {
                    [vVFL appendFormat:@")"];
                }
                
                [hVFL appendFormat:@"-bottom-|"];
                [vVFL appendFormat:@"]-bottom-|"];
            }
            
        } else if (i == self.starCount-1) {
            [hVFL appendFormat:@"-space-[button%i(button1)]-right-|",i+1];
            [vVFL appendFormat:@"button%i)]-bottom-|",i+1];
        } else {
            [hVFL appendFormat:@"-space-[button%i(button1)]",i+1];
            [vVFL appendFormat:@"button%i,",i+1];
        }
        
    }
    
    //2.7. 创建约束对象
    NSArray *cs1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatAlignAllCenterY metrics:metrics views:diction];
    
    //2.8.添加约束
    [self addConstraints:cs1];
    
    //创建竖直方向的约束
    NSArray *cs2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:metrics views:diction];
    
    //添加约束到父视图中
    [self addConstraints:cs2];
}


#pragma mark - Setter

- (void)setStarBrightImageName:(NSString *)starBrightImageName {
    
    _starBrightImageName = starBrightImageName;
    [self setStarImage];
}

- (void)setStarDarkImageName:(NSString *)starDarkImageName {
    
    _starDarkImageName = starDarkImageName;
    [self setStarImage];
}


- (void)setStarSpacing:(CGFloat)starSpacing {
    _starSpacing = starSpacing;
    [self setNeedsLayout];
}

- (void)setStarSize:(CGSize)starSize {
    _starSize = starSize;
    [self setNeedsLayout];
}

- (void)setStarCount:(NSInteger)starCount {
    
    _starCount = starCount;
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.buttons removeAllObjects];
    [self setUpSubviews];
}

- (void)setStarScore:(CGFloat)starScore {
    _starScore = floorf(starScore);//先向下取整
    if (starScore < 0) {
        _starScore = 0;
    }
    
    if (starScore > self.starCount) {
        _starScore = self.starCount;
    }
    
    [self setStarImage];
}

- (void)setType:(StarViewType)type {
    _type = type;
    self.userInteractionEnabled = _type == StarViewTypeSelect;
}


#pragma mark - Privite Func
- (void)setUpSubviews {
    
    if (self.starCount <= 0) {
        _starCount = 5;
    }
    
    for (int i = 0; i < self.starCount; i++) {
        UIButton *starBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [starBtn addTarget:self action:@selector(starBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:starBtn];
        [self.buttons addObject:starBtn];
    }
    
    self.starScore = 0;//设置显示亮星为0，即默认全部显示暗星
}


- (void)setStarImage {
    
    NSBundle *resourcesBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"YYStarView" ofType:@"bundle"]];
    
    if (!self.starBrightImageName) {
        self.starBrightImageName = @"yy_star_bright";
    }

    if (!self.starDarkImageName) {
        self.starDarkImageName = @"yy_star_dark";
    }
    
    //1.首先准备星要显示的图片
    UIImage *starBrightImage = [UIImage imageNamed:self.starBrightImageName];
    UIImage *starDarkImage = [UIImage imageNamed:self.starDarkImageName];
    
    UIImage *starBrightHighlightedImage = [UIImage imageNamed:[self.starBrightImageName stringByAppendingString:@"_highlighed"]];
    UIImage *starDarkHighlightedImage = [UIImage imageNamed:[self.starDarkImageName stringByAppendingString:@"_highlighed"]];;
    
    if (starBrightImage == nil) {
        starBrightImage = [UIImage imageNamed:@"yy_star_bright" inBundle:resourcesBundle compatibleWithTraitCollection:nil];
        starBrightHighlightedImage = nil;
    }
    
    if (starDarkImage == nil) {
        starDarkImage = [UIImage imageNamed:@"yy_star_dark" inBundle:resourcesBundle compatibleWithTraitCollection:nil];
        starDarkHighlightedImage = nil;
    }
    
    for (int i = 0; i < self.buttons.count; i++) {
        
        UIButton *starBtn = [self.buttons objectAtIndex:i];
        
        //根据当前的score数来选择显示亮星还是暗星
        if (i < self.starScore) {
            [starBtn setBackgroundImage:starBrightImage forState:UIControlStateNormal];
            [starBtn setBackgroundImage:starBrightHighlightedImage forState:UIControlStateHighlighted];
        } else {
            [starBtn setBackgroundImage:starDarkImage forState:UIControlStateNormal];
            [starBtn setBackgroundImage:starDarkHighlightedImage forState:UIControlStateHighlighted];
        }
    }
}

#pragma mark - Lazy
- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray new];
    }
    return _buttons;
}

#pragma mark - Button Click
- (void)starBtnClick:(UIButton *)btn {
    
    
    NSInteger index = [self.buttons indexOfObject:btn];
    self.starScore = index+1;
    if (self.starClick) {
        self.starClick();
    }
    
}


@end
