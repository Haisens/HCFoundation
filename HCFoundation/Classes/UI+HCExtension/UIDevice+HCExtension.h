//
//  UIDevice+HCExtension.h
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/23.
//

#import <UIKit/UIKit.h>

typedef void (^HCDeviceSpaceBlock)(long long freeSpace, long long totalSpace);

@interface UIDevice (HCExtension)
/**
 获取当前手机存储（剩余空间，总空间）
 
 */
+ (void)getDeviceSpace:(HCDeviceSpaceBlock)deviceBlock;

/**
 获取手机型号

 @return 手机型号
 */
+ (NSString *)getDeviceModel;
@end
