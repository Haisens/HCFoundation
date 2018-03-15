//
//  UIView+HCCut.m
//  HCFoundation
//
//  Created by yinhaichao on 2018/3/15.
//

#import "UIView+HCExtension.h"

@implementation UIView (HCExtension)

/**
 UIView及子类切圆角
 
 @param corners 自定义需要切的角：(HCRectCornerLeftTop)左上角、(HCRectCornerRightTop)右上角、(HCRectCornerLeftBottom)左下角、(HCRectCornerLeftBottom)右下角、(HCRectCornerAllCorners)全部,多个角使用'|',如需要切和左上角和左下角：HCRectCornerLeftTop | HCRectCornerLeftBottom
 
 @param cornerRadius 圆角半径
 */
- (void)cutCornerWithRoundingCorners:(HCRectCorner)corners cornerRadius:(CGFloat)cornerRadius {
    
    UIRectCorner rectCorners = (UIRectCorner)corners;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
