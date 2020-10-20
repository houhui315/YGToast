//
//  YGToastCenter.h
//  DailyYoga
//
//  Created by hou hui on 2019/1/3.
//  Copyright © 2019 Daily Yoga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YGToastView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGToastCenter : NSObject

+ (YGToastCenter *)defaultCenter;

- (void)showToastView:(YGToastView *)toastView;

@end

NS_ASSUME_NONNULL_END
