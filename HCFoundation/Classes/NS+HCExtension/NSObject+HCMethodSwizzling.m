//
//  NSObject+HCMethodSwizzling.m
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/12.
//

#import "NSObject+HCMethodSwizzling.h"

@implementation NSObject (HCMethodSwizzling)

+ (IMP)hook_swizzleSelector:(SEL)origSelector withIMP:(IMP)newIMP {
    Class class = [self class];
    Method origMethod = class_getInstanceMethod(class, origSelector);
    
    IMP origIMP = method_getImplementation(origMethod);
    if (!class_addMethod(self, origSelector, newIMP, method_getTypeEncoding(origMethod))) {
        method_setImplementation(origMethod, newIMP);
    }
    return origIMP;
}

+ (void)hook_swizzleSelector:(SEL)origSelector withSelector:(SEL)newSelector {
    Class class = [self class];
    
    Method origMethod = class_getInstanceMethod(class, origSelector);
    Method newMethod = class_getInstanceMethod(class, newSelector);
    
    method_exchangeImplementations(origMethod, newMethod);
}

+ (void)hook_swizzleClassSelector:(SEL)origSelector withSelector:(SEL)newSelector {
    Class class = [self class];
    
    Method origMethod = class_getClassMethod(class, origSelector);
    Method newMethod = class_getClassMethod(class, newSelector);
    
    method_exchangeImplementations(origMethod, newMethod);
}

@end
