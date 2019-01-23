//
//  ViewController.m
//  UIScrollViewWithMasonoryDemo
//
//  Created by 萨缪 on 2019/1/23.
//  Copyright © 2019年 萨缪. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(15, 15, 15, 15));
    }];
    
    UIView * container = [[UIView alloc] init];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        //下面这句话至关重要 为什么不加上就显示不出来 container这个UIView了？？？
        make.width.equalTo(scrollView);
    }];
    
    UIView * topLabel = [[UIView alloc] init];
    topLabel.backgroundColor = [UIColor blueColor];
    [container addSubview:topLabel];
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(container);
        make.height.mas_equalTo(60);
        make.top.mas_equalTo(container.mas_top);
    }];
    
    UIView * bottomLabel = [[UIView alloc] init];
    bottomLabel.backgroundColor = [UIColor yellowColor];
    [container addSubview:bottomLabel];
    [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(container);
        make.height.mas_equalTo(60);
        make.top.mas_equalTo(topLabel.mas_bottom).offset(1600);
    }];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(bottomLabel.mas_bottom);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
