# YYStarView
* 非常简单好用，功能强大的星级评价或者星级展示的框架，类似于淘宝App评论时的打星

----

# Installation
### CocoaPods
1、Profile文件添加 `pod 'YYStarView'`。  
2、执行 `pod install` 或 `pod update`。  
3、`import <YYStarView.h>`
### Manually  
1、选择`Download ZIP` 下载YYStarView。  
2、将YYStarView中源文件拖入工程中。  
3、`import "YYStarView"`。

---

# Feature
* **简单易用**：一句 `[YYStarView new]` 即可满足大多数需求。
* **自定义性强**：可设置星与星间隙，星的大小、个数、图片、展示或可选择等。
* **自适应大小**：不需要设置视图的size，根据图片自适应。
* **独立**：采用VFL布局，不依赖其他框架。

---

# How to use

* 全部使用默认：
```objc
YYStarView *starView = [YYStarView new];
starView.starClick = ^{
    //通过属性starScore设置评分
    label.text = starView.starScore;//伪代码
};
[self.view addSubview:starView];
[starView mas_makeConstraints:^(MASConstraintMaker *make) {
    //只需设置位置即可，当然，如果你就想设置size也可以，或者不用masonry直接设置frame也可以，需要自己根据图片大小，间距算好size，不然图片会变形哦
    make.left.mas_equalTo(10);
    make.top.mas_equalTo(100);
}];
```
* 效果

![图片](https://github.com/WallaceYou/YYStarView/blob/master/ShowImage/YYStarView-Show1.gif)


* 自定义：
```objc
YYStarView *starView = [YYStarView new];

//星的个数，如果不设置，则默认为5颗
starView.starCount = 7;

//StarView的类型，如果不设置，默认为Select类型
starView.type = StarViewTypeShow;

//星级评分，如果不设置，默认为0分（一般只有在展示时会设置这个属性）
starView.starScore = 2;

//星与星之间的间距，如果不设置，则默认为0
starView.starSpacing = 15;

//每颗星的大小，如果不设置，则按照图片大小自适应
starView.starSize = CGSizeMake(25, 25);

//亮色星图片名称，如果不设置，则使用默认图片
starView.starBrightImageName = @"star_bright";

//暗色星图片名称，如果不设置，则使用默认图片
//如果你需要设置亮星与暗星的高亮图片，也是支持的，你只需要将高亮图片名改为正常图片加后缀"_highlighted"即可
starView.starDarkImageName = @"star_dark";

//通过属性starScore设置评分
label.text = starView.starScore;//伪代码

[self.view addSubview:starView];
[starView mas_makeConstraints:^(MASConstraintMaker *make) {
    //只需设置位置即可，当然，如果你就想设置size也可以，或者不用masonry直接设置frame也可以，需要自己根据图片大小，间距算好size，不然图片会变形哦
    make.left.mas_equalTo(10);
    make.top.mas_equalTo(100);
}];
```

* 效果

![图片](https://github.com/WallaceYou/YYStarView/blob/master/ShowImage/YYStarView-Show2.png)


* 另外，YYStarView还支持反复设置，效果：

![图片](https://github.com/WallaceYou/YYStarView/blob/master/ShowImage/YYStarView-Show3.gif)


