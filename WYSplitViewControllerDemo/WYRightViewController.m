//
//  WYRightViewController.m
//  WYSplitViewControllerDemo
//
//  Created by lwy1218 on 16/9/19.
//  Copyright © 2016年 lwy1218. All rights reserved.
//

#import "WYRightViewController.h"
#import "WYOneViewController.h"
#import "WYTwoViewController.h"
#import "WYThreeViewController.h"
@interface WYRightViewController ()

/** 当前控制器的下标 */
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation WYRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    WYOneViewController *one = [[WYOneViewController alloc] init];
    [self addChildViewController:one];
    [self.view addSubview:one.view];
    
    WYTwoViewController *two = [[WYTwoViewController alloc] init];
    [self addChildViewController:two];
    
    WYThreeViewController *three = [[WYThreeViewController alloc] init];
    [self addChildViewController:three];
    
}
- (void)moveVcFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
    // 1.取出旧控制器的View,移除掉
    UIViewController *oldVc = self.childViewControllers[fromIndex];
    [oldVc.view removeFromSuperview];
    
    UIViewController *newVc = self.childViewControllers[toIndex];
    newVc.view.frame = self.view.bounds;
    [self.view addSubview:newVc.view];
    
    // 3.记录当前下标
    self.currentIndex = toIndex;
}
- (void)changeChildVcWirhIndex:(NSInteger)index
{
    [self moveVcFromIndex:self.currentIndex toIndex:index];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
