//
//  YGMessageToastView.h
//  DailyYoga
//
//  Created by hou hui on 2019/1/3.
//  Copyright © 2019 Daily Yoga. All rights reserved.
//

#import "YGToastView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGMessageToastView : YGToastView

- (instancetype)initWithFrame:(CGRect)frame
                      message:(NSString *)message;

- (NSString *)toastMessage;

@end

NS_ASSUME_NONNULL_END
