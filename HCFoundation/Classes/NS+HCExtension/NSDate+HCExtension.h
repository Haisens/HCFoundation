//
//  NSDate+HCExtension.h
//  HCFoundation
//
//  Created by yinhaichao on 2018/3/15.
//

#import <Foundation/Foundation.h>

@interface NSDate (HCExtension)

/**
 获取时间段
 
 @return @"早上好"/@"上午好"/@"下午好"/@"晚上好"
 */
-(NSString *)getTheTimeBucket;

/**
 获取当前时间戳
 
 @return 时间戳(以秒为单位)
 */
+ (NSTimeInterval)getCurrentTimeStamp;

@end
