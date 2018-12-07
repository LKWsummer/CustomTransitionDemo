//
//  CustomTransition.m
//  bleDemo22
//
//  Created by 罗凯微 on 2018/12/5.
//  Copyright © 2018 ble. All rights reserved.
//

#import "CustomTransition.h"

@interface CustomTransition()

@property (assign, nonatomic) KWTransitionType type; // <#des#>

@end

@implementation CustomTransition

+(instancetype)initWithType:(KWTransitionType)type{
    CustomTransition *custom = [[CustomTransition alloc] init];
    custom.type = type;
    return custom;
}

#pragma mark - UIViewControllerAnimatedTransitioning

/**
 转场动画时长
 */
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

/**
 执行动画
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (self.type) {
        case KWTransitionTypePush:
            [self push:transitionContext];
            break;
        case KWTransitionTypePop:
            [self pop:transitionContext];
            break;
            
        default:
            break;
    }
    
}

#pragma mark - private method

- (void)push:(id<UIViewControllerContextTransitioning>)transitionContext{
    // 获取目标视图
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    // 将目标视图添加到容器containerView内
    UIView *contentView = [transitionContext containerView];
    [contentView addSubview:fromView];
    [contentView addSubview:toView];
    
    CGFloat width = contentView.frame.size.width;
    toView.transform = CGAffineTransformMakeTranslation(width, 0);
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        fromView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        fromView.transform = CGAffineTransformIdentity;
        // 标记是否成功，否则系统会认为转场失败，造成无法交互
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (void)pop:(id<UIViewControllerContextTransitioning>)transitionContext{
    // 获取目标视图
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    // 将目标视图添加到容器containerView内
    UIView *contentView = [transitionContext containerView];
    // 先将目标视图缩放
    toView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    [contentView addSubview:toView];
    [contentView addSubview:fromView];
    
    CGFloat width = contentView.frame.size.width;
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        toView.transform = CGAffineTransformIdentity;
        fromView.transform = CGAffineTransformMakeTranslation(width, 0);
    } completion:^(BOOL finished) {
        
        toView.transform = CGAffineTransformIdentity;
        // 标记是否成功，否则系统会认为转场失败，造成无法交互
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
