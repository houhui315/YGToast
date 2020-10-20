//
//  YGToastView.m
//  DailyYoga
//
//  Created by hou hui on 2019/1/3.
//  Copyright © 2019 Daily Yoga. All rights reserved.
//

#import "YGToastView.h"

@implementation YGToastView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:frame]) {
        self.backgroundColor = COLOR_RGBA(0x505050, 0.68);
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10.f;
        self.showDuration = 1;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
