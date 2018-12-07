//
//  ViewController.m
//  CustomTransitionDemo
//
//  Created by 罗凯微 on 2018/12/7.
//  Copyright © 2018 meiya. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(30, 80, 100, 50);
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)push{
    SecondViewController *sec = [SecondViewController new];
    [self.navigationController pushViewController:sec animated:YES];
}


@end
