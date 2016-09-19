//
//  ViewController.m
//  WYSplitViewControllerDemo
//
//  Created by lwy1218 on 16/9/19.
//  Copyright © 2016年 lwy1218. All rights reserved.
//

#import "ViewController.h"
#import "WYLeftTableViewController.h"
#import "WYRightViewController.h"
@interface ViewController ()<UISplitViewControllerDelegate>
@property (nonatomic , strong) WYLeftTableViewController *leftVc;
@property (nonatomic , strong) UISplitViewController *splistVc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UISplitViewController *splitVc = [[UISplitViewController alloc] init];
    [self addChildViewController:splitVc];
    [self.view addSubview:splitVc.view];
    
    WYLeftTableViewController *left = [[WYLeftTableViewController alloc] init];
    WYRightViewController *right = [[WYRightViewController alloc] init];
    
    UINavigationController *navLeft = [[UINavigationController alloc] initWithRootViewController:left];
    
    splitVc.viewControllers = @[navLeft , right];//navLeft就是splistVc的masterVc/PrimaryVc  right就是detailVc
    //设置显示样式
    
//    UISplitViewControllerDisplayModeAutomatic,//横屏时两个都显示 竖屏时隐藏左边的vc
//    UISplitViewControllerDisplayModePrimaryHidden,//隐藏主控制器 即左边的控制器
//    UISplitViewControllerDisplayModeAllVisible,//横竖屏都显示左右两边的控制器
//    UISplitViewControllerDisplayModePrimaryOverlay,//显示右边的控制器 但通过滑动手势可以显示左边的vc
    splitVc.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    splitVc.presentsWithGesture = YES;//是否可以通过滑动手势显示左边的vc 默认为YES 如果不想通过手势滑动设置为NO 对UISplitViewControllerDisplayModeAllVisible无效 对UISplitViewControllerDisplayModePrimaryOverlay UISplitViewControllerDisplayModePrimaryHidden 模式横竖屏都有效 对UISplitViewControllerDisplayModeAutomatic模式横屏无效 竖屏有效
    //
    splitVc.maximumPrimaryColumnWidth = 300;
    splitVc.minimumPrimaryColumnWidth = 150;
    
    [left setDidSelectRowBlock:^(NSInteger index) {
        //切换右边的控制器
        [right changeChildVcWirhIndex:index];
    }];
    _splistVc = splitVc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
