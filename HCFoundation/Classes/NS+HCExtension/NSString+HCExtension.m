//
//  NSString+HCExtension.m
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/13.
//

#import "NSString+HCExtension.h"
#import "NSData+HCExtension.h"
#import "CommonCrypto/CommonDigest.h"

@implementation NSString (HCExtension)

#pragma mark
#pragma mark --SHA256
- (NSString *)hc_sha256
{
    NSData * data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    return [[data hc_sha256] hc_hex];
}

#pragma mark
#pragma mark --MD5

/**
 *  获取MD5编码后字符串
 *
 *  @param str 待编码
 *
 *  @return 编码字符串
 */
+(NSString *)hc_md5:(NSString *)str {
    
    const char *cStr = [str UTF8String];//转换成utf-8
    
    unsigned char result[16];//开辟一个16字节（128位：md5加密出来就是128位/bit）的空间（一个字节=8字位=8个二进制数）
    
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result);
    
    /*
     
     extern unsigned char *CC_MD5(const void *data, CC_LONG len, unsigned char *md)官方封装好的加密方法
     
     把cStr字符串转换成了32位的16进制数列（这个过程不可逆转） 存储到了result这个空间中
     
     */
    
    return [NSString stringWithFormat:
            
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            
            result[0], result[1], result[2], result[3],
            
            result[4], result[5], result[6], result[7],
            
            result[8], result[9], result[10], result[11],
            
            result[12], result[13], result[14], result[15]
            
            ];
    
    /*
     
     x表示十六进制，%02X  意思是不足两位将用0补齐，如果多余两位则不影响
     
     debug_NSLog("%02X", 0x888);  //888
     
     debug_NSLog("%02X", 0x4); //04
     
     */
    
}

#pragma mark
#pragma mark --Base64
/**
 *  将base64格式字符串转换为文本
 *
 *  @param base64 带转换文字
 *
 *  @return 转换后
 */
+ (NSString *)hc_textFromBase64String:(NSString *)base64{
    
    if (base64 && ![base64 isEqualToString:@""]) {
        //取项目的bundleIdentifier作为KEY   改动了此处
        //NSString *key = [[NSBundle mainBundle] bundleIdentifier];
        NSData *data = [NSData hc_dataWithBase64EncodedString:base64];
        //IOS 自带DES解密 Begin    改动了此处
        //data = [self DESDecrypt:data WithKey:key];
        //IOS 自带DES加密 End
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    else {
        return @"";
    }
}

#pragma mark
#pragma mark --工具方法
/**
 *  字典型转String
 */
+(NSString *)hc_dictToString:(NSDictionary*)dict{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
