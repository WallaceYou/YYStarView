# YYStarView
* 非常简单好用，功能强大的星级评价或者展示的框架，类似于淘宝App评论时的打星

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
    make.left.mas_equalTo(10);//只需设置位置即可
    make.top.mas_equalTo(100);
}];
```
* 效果
