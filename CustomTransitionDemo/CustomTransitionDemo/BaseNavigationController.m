//
//  BaseNavigationController.m
//  bleDemo22
//
//  Created by 罗凯微 on 2018/12/6.
//  Copyright © 2018 ble. All rights reserved.
//

#import "BaseNavigationController.h"
#import "CustomTransition.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];  //返回键颜色
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBar_bg_white"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setBackgroundColor:[UIColor blackColor]];
}


@end
