//
//  CustomTransition.h
//  bleDemo22
//
//  Created by 罗凯微 on 2018/12/5.
//  Copyright © 2018 ble. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, KWTransitionType) {
    KWTransitionTypePush = 0,
    KWTransitionTypePop,
    
};

@interface CustomTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)initWithType:(KWTransitionType)type;

@end

NS_ASSUME_NONNULL_END
