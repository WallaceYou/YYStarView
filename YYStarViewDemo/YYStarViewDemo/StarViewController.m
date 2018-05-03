//
//  StarViewController.m
//  YYStarViewDemo
//
//  Created by youyu on 2018/5/2.
//  Copyright © 2018年 youyu. All rights reserved.
//

#import "StarViewController.h"
#import "Masonry/Masonry.h"
#import "YYStarView.h"
#import "UIButton+Custom.h"



@interface StarViewController ()

@property (nonatomic, assign) StarViewControllerType type;

@property (nonatomic, strong) YYStarView *starView;

@property (nonatomic, strong) UILabel *scoreLb;

@property (nonatomic, strong) UIView *buttonsView;

@property (nonatomic, strong) NSMutableArray *buttonsArray;

@end

@implementation StarViewController

- (instancetype)initWithType:(StarViewControllerType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    YYStarView *starView = [YYStarView new];
    starView.starClick = ^ {
        self.scoreLb.text = [NSString stringWithFormat:@"%.0lf分",self.starView.starScore];
    };
    [self.view addSubview:starView];
    [starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);//无需设置大小size，只需设置位置即可
        make.top.mas_equalTo(100);
    }];
    self.starView = starView;
    self.scoreLb.text = @"请评价";//启动懒加载
    
    
    //设置参数
    if (self.type == StarViewControllerTypeNoSetting) {
    } else if (self.type == StarViewControllerTypeOneTimeSetting) {
        starView.starScore = 2;
        starView.starSize = CGSizeMake(25, 25);
        starView.starSpacing = 15;
        starView.starCount = 7;
        starView.starBrightImageName = @"star_bright";
        starView.starDarkImageName = @"star_dark";
    } else {
        self.buttonsView.hidden = NO;
    }
    
}


#pragma mark - Lazy
- (UILabel *)scoreLb {
    if (!_scoreLb) {
        _scoreLb = [UILabel new];
        _scoreLb.textColor = [UIColor blackColor];
        [self.view addSubview:_scoreLb];
        [_scoreLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.starView.mas_right).mas_equalTo(10);
            make.centerY.mas_equalTo(self.starView);
        }];
    }
    return _scoreLb;
}

- (UIView *)buttonsView {
    if (!_buttonsView) {
        _buttonsView = [UIView new];
        
        UIButton *spacingUpBtn = [UIButton buttonWithBgColor:[UIColor grayColor] font:nil titleColor:[UIColor whiteColor] title:@"扩大间隙"];
        UIButton *spacingDownBtn = [UIButton buttonWithBgColor:[UIColor grayColor] font:nil titleColor:[UIColor whiteColor] title:@"减小间隙"];
        UIButton *countUpBtn =[UIButton buttonWithBgColor:[UIColor grayColor] font:nil titleColor:[UIColor whiteColor] title:@"加星"];
        UIButton *countDownBtn =[UIButton buttonWithBgColor:[UIColor grayColor] font:nil titleColor:[UIColor whiteColor] title:@"减星"];
        UIButton *sizeUpBtn =[UIButton buttonWithBgColor:[UIColor grayColor] font:nil titleColor:[UIColor whiteColor] title:@"扩大size"];
        UIButton *sizeDownBtn =[UIButton buttonWithBgColor:[UIColor grayColor] font:nil titleColor:[UIColor whiteColor] title:@"减小size"];
        UIButton *scoreUpBtn =[UIButton buttonWithBgColor:[UIColor grayColor] font:nil titleColor:[UIColor whiteColor] title:@"加亮星"];
        UIButton *scoreDownBtn =[UIButton buttonWithBgColor:[UIColor grayColor] font:nil titleColor:[UIColor whiteColor] title:@"减亮星"];
        UIButton *imageChangeBtn =[UIButton buttonWithBgColor:[UIColor grayColor] font:nil titleColor:[UIColor whiteColor] title:@"更改星"];
        UIButton *imageReChangeBtn =[UIButton buttonWithBgColor:[UIColor grayColor] font:nil titleColor:[UIColor whiteColor] title:@"变回星"];
        
        [spacingUpBtn addTarget:self action:@selector(starSettingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [spacingDownBtn addTarget:self action:@selector(starSettingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [countUpBtn addTarget:self action:@selector(starSettingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [countDownBtn addTarget:self action:@selector(starSettingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [sizeUpBtn addTarget:self action:@selector(starSettingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [sizeDownBtn addTarget:self action:@selector(starSettingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [scoreUpBtn addTarget:self action:@selector(starSettingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [scoreDownBtn addTarget:self action:@selector(starSettingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [imageChangeBtn addTarget:self action:@selector(starSettingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [imageReChangeBtn addTarget:self action:@selector(starSettingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.buttonsArray addObject:spacingUpBtn];
        [self.buttonsArray addObject:spacingDownBtn];
        [self.buttonsArray addObject:countUpBtn];
        [self.buttonsArray addObject:countDownBtn];
        [self.buttonsArray addObject:sizeUpBtn];
        [self.buttonsArray addObject:sizeDownBtn];
        [self.buttonsArray addObject:scoreUpBtn];
        [self.buttonsArray addObject:scoreDownBtn];
        [self.buttonsArray addObject:imageChangeBtn];
        [self.buttonsArray addObject:imageReChangeBtn];
        
        
        [_buttonsView addSubview:spacingUpBtn];
        [_buttonsView addSubview:spacingDownBtn];
        [_buttonsView addSubview:countUpBtn];
        [_buttonsView addSubview:countDownBtn];
        [_buttonsView addSubview:sizeUpBtn];
        [_buttonsView addSubview:sizeDownBtn];
        [_buttonsView addSubview:scoreUpBtn];
        [_buttonsView addSubview:scoreDownBtn];
        [_buttonsView addSubview:imageChangeBtn];
        [_buttonsView addSubview:imageReChangeBtn];
        
        [spacingUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
        }];
        
        [spacingDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(spacingUpBtn.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.size.mas_equalTo(spacingUpBtn);
        }];
        
        [countUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(spacingUpBtn.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(spacingUpBtn);
        }];
        
        [countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(countUpBtn);
            make.leftMargin.mas_equalTo(spacingDownBtn);
            make.right.mas_equalTo(0);
            make.size.mas_equalTo(countUpBtn);
        }];
        
        [sizeUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(countUpBtn.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(spacingUpBtn);
        }];
        
        [sizeDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(sizeUpBtn);
            make.leftMargin.mas_equalTo(spacingDownBtn);
            make.right.mas_equalTo(0);
            make.size.mas_equalTo(sizeUpBtn);
        }];
        
        [scoreUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(sizeUpBtn.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(spacingUpBtn);
        }];
        
        [scoreDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(scoreUpBtn);
            make.leftMargin.mas_equalTo(spacingDownBtn);
            make.right.mas_equalTo(0);
            make.size.mas_equalTo(scoreUpBtn);
        }];
        
        [imageChangeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(scoreUpBtn.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(spacingUpBtn);
        }];
        
        [imageReChangeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(imageChangeBtn);
            make.leftMargin.mas_equalTo(spacingDownBtn);
            make.right.mas_equalTo(0);
            make.size.mas_equalTo(imageChangeBtn);
        }];
        
    
        [self.view addSubview:_buttonsView];
        [_buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.starView.mas_bottom).mas_equalTo(100);
            make.size.mas_equalTo(CGSizeMake(300, 300));
        }];
    }
    return _buttonsView;
}

- (NSMutableArray *)buttonsArray {
    if (!_buttonsArray) {
        _buttonsArray = [NSMutableArray new];
    }
    return _buttonsArray;
}

#pragma mark - Button Click
- (void)starSettingBtnClick:(UIButton *)settingBtn {
    NSInteger index = [self.buttonsArray indexOfObject:settingBtn];
    switch (index) {
        case 0:
            self.starView.starSpacing += 2;
            break;
        case 1:
            self.starView.starSpacing -= 2;
            break;
        case 2:
            self.starView.starCount += 1;
            self.scoreLb.text = [NSString stringWithFormat:@"%.0lf分",self.starView.starScore];//刷新label显示
            break;
        case 3:
            self.starView.starCount -= 1;
            self.scoreLb.text = [NSString stringWithFormat:@"%.0lf分",self.starView.starScore];//刷新label显示
            break;
        case 4:{
            CGSize size = self.starView.starSize;
            if (size.width == 0 && size.height == 0) {
                size = CGSizeMake(40, 40);
            }
            
            CGSize newSize = CGSizeMake(size.width + 2, size.height + 2);
            self.starView.starSize = newSize;
        }
            break;
        case 5:{
            CGSize size = self.starView.starSize;
            if (size.width == 0 && size.height == 0) {
                size = CGSizeMake(40, 40);
            }
            
            CGSize newSize = CGSizeMake(size.width - 2, size.height - 2);
            self.starView.starSize = newSize;
        }
            break;
        case 6:
            self.starView.starScore += 1;
            self.scoreLb.text = [NSString stringWithFormat:@"%.0lf分",self.starView.starScore];//刷新label显示
            break;
        case 7:
            self.starView.starScore -= 1;
            self.scoreLb.text = [NSString stringWithFormat:@"%.0lf分",self.starView.starScore];//刷新label显示
            break;
        case 8:
            self.starView.starBrightImageName = @"star_bright";
            self.starView.starDarkImageName = @"star_dark";
            break;
        case 9:
            self.starView.starBrightImageName = @"yy_star_bright";
            self.starView.starDarkImageName = @"yy_star_dark";
            break;
        default:
            break;
    }
}


@end
