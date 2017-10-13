//
//  HCView.m
//  HCFoundation_Example
//
//  Created by yinhaichao on 2017/10/13.
//  Copyright © 2017年 haisens@163.com. All rights reserved.
//

#import "HCView.h"

@implementation HCView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[self getCurrentViewController] presentViewController:[UIViewController new] animated:YES completion:nil];
}

- (UIViewController *)getCurrentViewController {
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)next;
            
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
