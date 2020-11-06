//
//  YGToastCenter.m
//  DailyYoga
//
//  Created by hou hui on 2019/1/3.
//  Copyright © 2019 Daily Yoga. All rights reserved.
//

#import "YGToastCenter.h"
#import "YGMessageToastView.h"

@interface YGToastCenter (){
    
    YGToastView *alertView;
    BOOL active;
    NSMutableArray *alerts;
    NSString *lastAddMessage;
    BOOL canAddSameMessageToast;
}

@end

@implementation YGToastCenter

+ (YGToastCenter *)defaultCenter {
    static YGToastCenter *defaultCenter = nil;
    if (!defaultCenter) {
        defaultCenter = [[YGToastCenter alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:defaultCenter selector:@selector(statusBarOrientationChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    }
    return defaultCenter;
}


- (instancetype) init{
    if(!(self=[super init])) return nil;
    
    alerts = [NSMutableArray array];
    active = NO;
    canAddSameMessageToast = YES;
    
    return self;
}

- (void)statusBarOrientationChange:(NSNotification *)noti {
    
    alertView.center = [self lastWindow].center;
}

- (BOOL)checkCanShow {
    
    return YES;
}

- (void) showAlerts{
    
    if (![self checkCanShow]) {
        [self removeAllAlerts];
        return;
    }
    if(!alerts.count) {
        active = NO;
        return;
    }
    active = YES;
    alertView = [alerts firstObject];
    
    alertView.transform = CGAffineTransformIdentity;
    alertView.alpha = 0;
    [[self lastWindow] addSubview:alertView];
    
    alertView.center = [UIApplication sharedApplication].keyWindow.center;
    alertView.transform = CGAffineTransformScale(alertView.transform, 2, 2);
    
    [UIView animateWithDuration:0.15 animations:^{
        
        alertView.transform = CGAffineTransformScale(alertView.transform, 0.5, 0.5);
        alertView.alpha = 1;
    } completion:^(BOOL finished) {
        
        [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:alertView.showDuration];
    }];
}

- (UIWindow *)lastWindow{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for (UIWindow *window in [windows reverseObjectEnumerator]) {
        if ([window isKindOfClass:[UIWindow class]] && CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds)) {
            return window;
        }
    }
    return [UIApplication sharedApplication].keyWindow;
}

- (void)hideAnimation {
    
    [UIView animateWithDuration:0.15 animations:^{
        
        alertView.transform = CGAffineTransformScale(alertView.transform, 0.5, 0.5);
        alertView.alpha = 0;
    } completion:^(BOOL finished) {
        
        [self performSelector:@selector(removeAnimate) withObject:nil afterDelay:0.15];
    }];
}

- (void)removeAnimate {
    
    [alertView removeFromSuperview];
    alertView = nil;
    if(alerts && alerts.count){
        [alerts removeObjectAtIndex:0];
    }
    [self showAlerts];
}

- (void)removeAllAlerts {
    
    [alertView removeFromSuperview];
    alertView = nil;
    if(alerts && alerts.count){
        [alerts removeAllObjects];
    }
    active = NO;
}

- (BOOL)canShowToast:(YGToastView *)toastView {
    
    //处理一秒内出现同样的toast的问题
    if ([toastView isKindOfClass:[YGMessageToastView class]]) {
        
        YGMessageToastView *messageToast = (YGMessageToastView *)toastView;
        if (lastAddMessage.length && [[messageToast toastMessage] isEqualToString:lastAddMessage]) {
            if (!canAddSameMessageToast) {
                
                return NO;
            }
        }
        canAddSameMessageToast = NO;
        lastAddMessage = [messageToast toastMessage];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            canAddSameMessageToast = YES;
        });
        return YES;
    }
    return YES;
}

- (void)showToastView:(YGToastView *)toastView {
    
    if (toastView && [toastView isKindOfClass:[YGToastView class]]) {
        
        if ([self canShowToast:toastView]) {
            [alerts addObject:toastView];
            if (!active) {
                [self showAlerts];
            }
        }
    }
}

@end
