//
//  NSData+HCExtension.m
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/13.
//

#import "NSData+HCExtension.h"
#import "CommonCrypto/CommonDigest.h"

#define HEXDIGEST_LENGTH(x)  (x * 2)

typedef unsigned char* (*CC_DIGEST)(const void*, CC_LONG, unsigned char*);

static NSData* hc_digest(NSData *data, CC_DIGEST digest, CC_LONG digestLength) {
    
    unsigned char md[digestLength];
    (void)digest([data bytes], (CC_LONG)[data length], md);
    return [NSData dataWithBytes:md length:digestLength];
}

@implementation NSData (HCExtension)

#pragma mark =========================SHA加密=========================

/**
 SHA加密数据
 */
+ (NSData *)hc_sha256:(NSData *)data {
    
    return hc_digest(data, CC_SHA256, CC_SHA256_DIGEST_LENGTH);
}

/**
 SHA加密数据
 */
- (NSData *)hc_sha256 {
    
    return hc_digest(self, CC_SHA256, CC_SHA256_DIGEST_LENGTH);
};

/**
 SHA解密数据转为字符串
 */
+ (NSString *)hc_hex:(NSData *)data {
    
    NSInteger len = [data length];
    char hex[HEXDIGEST_LENGTH(len) + 1];
    unsigned char *buf = (unsigned char *)[data bytes];
    
    for (int i = 0; i < len; i++) {
        sprintf(hex + i * 2, "%02x", buf[i]);
    }
    hex[HEXDIGEST_LENGTH(len)] = '\0';
    return [NSString stringWithCString:hex encoding:NSASCIIStringEncoding];
}

/**
 SHA解密数据转为字符串
 */
- (NSString *)hc_hex {
    
    return [NSData hc_hex:self];
}

#pragma mark =========================MD5=========================

/**
 将数据MD5加密
 */
+(NSData *)hc_MD5Digest:(NSData *)data {
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(data.bytes, (unsigned int)data.length, result);
    return [NSData dataWithBytes:result length:CC_MD5_DIGEST_LENGTH];
}

/**
 将数据MD5加密
 */
-(NSData *)hc_MD5Digest {
    
    return [NSData hc_MD5Digest:self];
}

/**
 将MD5数据解密
 */
+(NSString *)hc_MD5HexDigest:(NSData *)data {
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(data.bytes, (unsigned int)data.length, result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    return ret;
}

/**
 将MD5数据解密
 */
-(NSString *)hc_MD5HexDigest {
    
    return [NSData hc_MD5HexDigest:self];
}

#pragma mark =========================Base64=========================

static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
/**
 将字符串加密为Base64数据
 */
+ (NSData*)hc_dataWithBase64EncodedString:(NSString*)string {
    
    if (string == nil)
#pragma clang diagnostic push
        
#pragma clang diagnostic ignored"-Wnonnull"
       
        [NSException raise:NSInvalidArgumentException format:nil];
    
#pragma clang diagnostic pop
    
    if ([string length] == 0) {
        return [NSData data];
    }
    
    static char *decodingTable = NULL;
    if (decodingTable == NULL) {
        decodingTable = malloc(256);
        if (decodingTable == NULL) {
            return nil;
        }
        memset(decodingTable, CHAR_MAX, 256);
        NSUInteger i;
        for (i = 0; i < 64; i++) {
            decodingTable[(short)encodingTable[i]] = i;
        }
    }
    
    const char *characters = [string cStringUsingEncoding:NSASCIIStringEncoding];
    if (characters == NULL) {
        return nil;
    }
    char *bytes = malloc((([string length] + 3) / 4) * 3);
    if (bytes == NULL) {
        return nil;
    }
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    while (YES) {
        char buffer[4];
        short bufferLength;
        for (bufferLength = 0; bufferLength < 4; i++) {
            if (characters[i] == '\0') {
                break;
            }
            if (isspace(characters[i]) || characters[i] == '=') {
                continue;
            }
            buffer[bufferLength] = decodingTable[(short)characters[i]];
            if (buffer[bufferLength++] == CHAR_MAX)      //  Illegal character!
            {
                free(bytes);
                return nil;
            }
        }
        
        if (bufferLength == 0)
            break;
        if (bufferLength == 1)      //  At least two characters are needed to produce one byte!
        {
            free(bytes);
            return nil;
        }
        
        //  Decode the characters in the buffer to bytes.
        bytes[length++] = (buffer[0] << 2) | (buffer[1] >> 4);
        if (bufferLength > 2)
            bytes[length++] = (buffer[1] << 4) | (buffer[2] >> 2);
        if (bufferLength > 3)
            bytes[length++] = (buffer[2] << 6) | buffer[3];
    }
    
    bytes = realloc(bytes, length);
    return [NSData dataWithBytesNoCopy:bytes length:length];
}

#pragma mark =========================数据判定=========================

/**
 获取图片数据格式
 */
+ (NSString *)hc_detectImageSuffix:(NSData *)data {
    uint8_t c;
    NSString *imageFormat = @"";
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            imageFormat = @".jpg";
            break;
        case 0x89:
            imageFormat = @".png";
            break;
        case 0x47:
            imageFormat = @".gif";
            break;
        case 0x49:
        case 0x4D:
            imageFormat = @".tiff";
            break;
        case 0x42:
            imageFormat = @".bmp";
            break;
        default:
            break;
    }
    return imageFormat;
}

/**
 获取图片数据格式
 */
- (NSString *)hc_detectImageSuffix {
    return [NSData hc_detectImageSuffix:self];
}

@end
