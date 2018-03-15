//
//  NSString+HCExtension.h
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/13.
//

#import <Foundation/Foundation.h>

@interface NSString (HCExtension)

#pragma mark
#pragma mark --SHA256

/**
 解密SHA256数据
 */
- (NSString *)hc_sha256;

#pragma mark
#pragma mark --MD5

/**
 获取MD5编码后字符串
 
 @param str 待编码
 @return 编码字符串
 */
+(NSString *)hc_md5:(NSString *)str;

#pragma mark
#pragma mark --Base64

/**
 将base64格式字符串转换为文本
 
 @param base64 带转换文字
 @return 转换后
 */
+ (NSString *)hc_textFromBase64String:(NSString *)base64;

#pragma mark
#pragma mark --工具方法
/**
 字典型转String
 */
+(NSString *)hc_dictToString:(NSDictionary*)dict;

@end
