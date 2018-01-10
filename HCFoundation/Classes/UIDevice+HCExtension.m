//
//  UIDevice+HCExtension.m
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/23.
//

#import "UIDevice+HCExtension.h"
#include <sys/param.h>
#include <sys/mount.h>

@implementation UIDevice (HCExtension)

+ (void)getDeviceSpace:(HCDeviceSpaceBlock)deviceBlock {
    //可用大小
    struct statfs buf;
    long long freeSpace = -1;
    if(statfs("/var", &buf) >= 0){
        freeSpace = (long long)(buf.f_bsize * buf.f_bfree);
    }
    //总大小
    struct statfs buf1;
    long long totalSpace = 0;
    if (statfs("/", &buf1) >= 0) {
        totalSpace = (long long)buf1.f_bsize * buf1.f_blocks;
    }
    if (statfs("/private/var", &buf1) >= 0) {
        totalSpace += (long long)buf1.f_bsize * buf1.f_blocks;
    }
    deviceBlock(freeSpace, totalSpace);
}
@end
