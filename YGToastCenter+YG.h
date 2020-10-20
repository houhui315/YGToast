//
//  YGToastCenter+YG.h
//  DailyYoga
//
//  Created by hou hui on 2019/1/3.
//  Copyright © 2019 Daily Yoga. All rights reserved.
//

#import "YGToastCenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGToastCenter (YG)

///展示消息toast
+ (void)showMessageToastWithMessage:(NSString *)message;

- (void)postAlertWithMessage:(NSString*)message;

@end

NS_ASSUME_NONNULL_END
