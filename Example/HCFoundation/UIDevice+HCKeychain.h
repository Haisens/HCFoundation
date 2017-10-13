//
//  UIDevice+HCKeychain.h
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/13.
//

#import <UIKit/UIKit.h>

@interface UIDevice (HCKeychain)

/**
 从keychain获取唯一标识符

 @param username 用户名
 @param serviceName serviceName 最好使用bundle ID
 @param error 错误信息
 @return 唯一标识符
 */
+ (NSString *) getPasswordForUsername: (NSString *) username andServiceName: (NSString *) serviceName error: (NSError **) error;

/**
 往keychain保存数据

 @param username 用户名
 @param password 密码
 @param serviceName serviceName 最好使用bundle ID
 @param updateExisting 默认为1
 @param error 错误信息
 @return 保存是否成功
 */
+ (BOOL) storeUsername: (NSString *) username andPassword: (NSString *) password forServiceName: (NSString *) serviceName updateExisting: (BOOL) updateExisting error: (NSError **) error;

/**
 删除keychain保存的数据

 @return 删除成功状态
 */
+ (BOOL) deleteItemForUsername: (NSString *) username andServiceName: (NSString *) serviceName error: (NSError **) error;

@end
