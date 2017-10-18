//
//  NSBundle+HCExtension.m
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/18.
//

#import "NSBundle+HCExtension.h"

@implementation NSBundle (HCExtension)

+ (NSBundle *)hc_myLibraryBundle: (NSString *)bundleName forClass: (Class)bundleClass{
    NSURL *bundleURL = [self hc_LibraryBundleURL: bundleName forClass: bundleClass];
    if (bundleURL) {
        return [self bundleWithURL:bundleURL];
    }
    return nil;
}

+ (NSURL *)hc_LibraryBundleURL: (NSString *)bundleName forClass: (Class)bundleClass{
    NSBundle *bundle = [NSBundle bundleForClass:bundleClass];
    return [bundle URLForResource: bundleName withExtension:@"bundle"];
}

@end
