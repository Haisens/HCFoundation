//
//  NSObject+HCMethodSwizzling.h
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/12.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (HCMethodSwizzling)

/**
 交换实例方法与IMP
 */
+ (IMP)hook_swizzleSelector:(SEL)origSelector
                    withIMP:(IMP)newIMP;

/**
 交换实例方法
 */
+ (void)hook_swizzleSelector:(SEL)origSelector
                withSelector:(SEL)newSelector;

/**
 交换类方法
 */
+ (void)hook_swizzleClassSelector:(SEL)origSelector
                     withSelector:(SEL)newSelector;

@end
