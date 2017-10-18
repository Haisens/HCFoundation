//
//  NSBundle+HCExtension.h
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/18.
//

#import <Foundation/Foundation.h>

@interface NSBundle (HCExtension)

/**
 获取指定的Bundle包
 
 @param bundleName Bundle名称
 @param bundleClass 同framework的Class
 */
+ (NSBundle *)hc_myLibraryBundle: (NSString *)bundleName forClass: (Class)bundleClass;


/**
 获取指定Bundle的URL
 */
+ (NSURL *)hc_LibraryBundleURL: (NSString *)bundleName forClass: (Class)bundleClass;

@end
