//
//  SecondViewController.m
//  bleDemo22
//
//  Created by 罗凯微 on 2018/12/5.
//  Copyright © 2018 ble. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomTransition.h"
#import "ThirdViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveTransition;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
//    [self.view addGestureRecognizer:pan];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(30, 80, 100, 50);
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)push{
    
    [self.navigationController pushViewController:[ThirdViewController new] animated:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    self.navigationController.delegate = self;
}


//- (void)pan:(UIPanGestureRecognizer *)pan{
//    //产生百分比
//    CGFloat process = [pan translationInView:self.view].x / ([UIScreen mainScreen].bounds.size.width);
//    CGFloat xStart = [pan locationInView:self.view].x;
//    BOOL shouldPop = xStart < 50 ? YES : NO;
//    process = MIN(1.0,(MAX(0.0, process)));
//    if (pan.state == UIGestureRecognizerStateBegan) {
//        self.interactiveTransition = [UIPercentDrivenInteractiveTransition new];
//        shouldPop ? [self.navigationController popViewControllerAnimated:YES] : nil;
//    }
//    else if (pan.state == UIGestureRecognizerStateChanged){
//        [self.interactiveTransition updateInteractiveTransition:process];
//    }
//    else if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled){
//        process > 0.4 ? [self.interactiveTransition finishInteractiveTransition] : [self.interactiveTransition cancelInteractiveTransition];
//        self.interactiveTransition = nil;
//
//    }
//}
//
//- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
//
//    return self.interactiveTransition;
//
//}


//- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
//
//    if (operation == UINavigationControllerOperationPop) {
//        return [CustomTransition initWithType:KWTransitionTypePop];
//    }
//
//    return nil;
//}


@end
