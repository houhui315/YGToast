//
//  YGToastCenter+YG.m
//  DailyYoga
//
//  Created by hou hui on 2019/1/3.
//  Copyright © 2019 Daily Yoga. All rights reserved.
//

#import "YGToastCenter+YG.h"
#import "YGMessageToastView.h"

@implementation YGToastCenter (YG)

+ (void)showMessageToastWithMessage:(NSString *)message {
    
    if (!message.length) {
        return;
    }
    YGMessageToastView *messageToast = [[YGMessageToastView alloc] initWithFrame:CGRectMake(0, 0, 252, 20) message:message];
    [[YGToastCenter defaultCenter] showToastView:messageToast];
}

- (void) postAlertWithMessage:(NSString*)message {
    
    [[self class] showMessageToastWithMessage:message];
}

@end
