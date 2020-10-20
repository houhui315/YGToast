//
//  YGMessageToastView.m
//  DailyYoga
//
//  Created by hou hui on 2019/1/3.
//  Copyright © 2019 Daily Yoga. All rights reserved.
//

#import "YGMessageToastView.h"

@interface YGMessageToastView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation YGMessageToastView

- (instancetype)initWithFrame:(CGRect)frame
                      message:(NSString *)message {
    
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.text = message;
        [self.titleLabel jk_resizeLabelHeight];
        
        NSArray * words = [message componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        self.showDuration = MAX(((double)[words count]*60.0/200.0), 1);
        self.height = self.titleLabel.bottom + 16;
    }
    return self;
}

- (NSString *)toastMessage {
    
    return self.titleLabel.text;
}


#pragma mark - lazy

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 16, self.width - 25 * 2, 20)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.numberOfLines = 0;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

@end
