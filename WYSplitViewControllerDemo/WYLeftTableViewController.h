//
//  WYLeftTableViewController.h
//  WYSplitViewControllerDemo
//
//  Created by lwy1218 on 16/9/19.
//  Copyright © 2016年 lwy1218. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYLeftTableViewController : UITableViewController
@property (nonatomic , copy) void (^didSelectRowBlock)(NSInteger row);
@end
