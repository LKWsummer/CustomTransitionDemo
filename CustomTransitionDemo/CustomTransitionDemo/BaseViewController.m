//
//  BaseViewController.m
//  bleDemo22
//
//  Created by 罗凯微 on 2018/12/6.
//  Copyright © 2018 ble. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomTransition.h"

@interface BaseViewController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveTransition;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.delegate = nil;
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    //产生百分比
    CGFloat process = [pan translationInView:self.view].x / ([UIScreen mainScreen].bounds.size.width);
    CGFloat xStart = [pan locationInView:self.view].x;
    // 触摸起点在50以内，才触发pop事件
    BOOL shouldPop = xStart < 50 ? YES : NO;
    if (!shouldPop) return;
    
    process = MIN(1.0,(MAX(0.0, process)));
    if (pan.state == UIGestureRecognizerStateBegan) {
        self.interactiveTransition = [UIPercentDrivenInteractiveTransition new];
        shouldPop ? [self.navigationController popViewControllerAnimated:YES] : nil;
    }
    else if (pan.state == UIGestureRecognizerStateChanged){
        [self.interactiveTransition updateInteractiveTransition:process];
    }
    else if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled){
        process > 0.4 ? [self.interactiveTransition finishInteractiveTransition] : [self.interactiveTransition cancelInteractiveTransition];
        self.interactiveTransition = nil;
        
    }
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    
    return self.interactiveTransition;
    
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush)
    {
        return [CustomTransition initWithType:KWTransitionTypePush];
    }
    else if (operation == UINavigationControllerOperationPop){
        return [CustomTransition initWithType:KWTransitionTypePop];
    }
    return nil;
}

@end
