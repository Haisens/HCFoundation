//
//  NSData+HCExtension.h
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/13.
//

#import <Foundation/Foundation.h>

@interface NSData (HCExtension)

#pragma mark =========================SHA加密=========================

/**
 SHA加密数据
 */
+ (NSData *)hc_sha256:(NSData *)data;

/**
 SHA加密数据
 */
- (NSData *)hc_sha256;

/**
 SHA解密数据转为字符串
 */
+ (NSString *)hc_hex:(NSData *)data;

/**
 SHA解密数据转为字符串
 */
- (NSString *)hc_hex;

#pragma mark =========================MD5=========================

/**
 将数据MD5加密
 */
+(NSData *)hc_MD5Digest:(NSData *)data;
/**
 将数据MD5加密
 */
-(NSData *)hc_MD5Digest;

/**
 将MD5数据解密
 */
+(NSString *)hc_MD5HexDigest:(NSData *)data;
/**
 将MD5数据解密
 */
-(NSString *)hc_MD5HexDigest;

#pragma mark =========================Base64=========================

/**
 将字符串加密为Base64数据
 */
+ (NSData*)hc_dataWithBase64EncodedString:(NSString*)string;

#pragma mark =========================数据判定=========================

/**
 获取图片数据格式
 */
+ (NSString *)hc_detectImageSuffix:(NSData *)data;

/**
 获取图片数据格式
 */
- (NSString *)hc_detectImageSuffix;

@end
