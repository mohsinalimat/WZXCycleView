//
//  ViewController.m
//  WZXCycleView
//
//  Created by WzxJiang on 16/5/23.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "ViewController.h"
#import "WZXCycleView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WZXCycleView * view = [WZXCycleView WZXCycleViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) imgArr:@[@"1.jpg",@"2.jpg",@"3.jpg"] TitleArr:@[@"冰与火之歌(1)",@"冰与火之歌(2)",@"冰与火之歌(3)"] pageType:WZXPageTypeRight];
    [view startWithTimeInterval:2];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
