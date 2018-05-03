//
//  ViewController.m
//  YYStarViewDemo
//
//  Created by youyu on 2018/5/2.
//  Copyright © 2018年 youyu. All rights reserved.
//

#import "ViewController.h"
#import "YYStarView.h"
#import "Masonry.h"
#import "StarViewController.h"

static NSString *cellIndentifier = @"cellIndentifier";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *titleArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.hidden = NO;//启动懒加载
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    }
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    StarViewControllerType type;
    
    if (indexPath.row == 0) {
        type = StarViewControllerTypeNoSetting;
    } else if (indexPath.row == 1) {
        type = StarViewControllerTypeOneTimeSetting;
    } else {
        type = StarViewControllerTypeReversalSetting;
    }
    
    StarViewController *vc = [[StarViewController alloc] initWithType:type];
    [self.navigationController pushViewController:vc animated:YES];
}



#pragma mark - Lazy

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"不设置",@"一次性设置",@"反复设置"];
    }
    return _titleArray;
}


@end
