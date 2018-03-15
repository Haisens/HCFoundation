//
//  NSDate+HCExtension.m
//  HCFoundation
//
//  Created by yinhaichao on 2018/3/15.
//

#import "NSDate+HCExtension.h"

@implementation NSDate (HCExtension)

//将时间点转化成日历形式
- (NSDate *)getCustomDateWithHour:(NSInteger)hour
{
    //获取当前时间
    NSDate * destinationDateNow = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    currentComps = [currentCalendar components:unitFlags fromDate:destinationDateNow];
    
    //设置当前的时间点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}

/**
 获取时间段

 @return @"早上好"/@"上午好"/@"下午好"/@"晚上好"
 */
-(NSString *)getTheTimeBucket
{
    //    NSDate * currentDate = [self getNowDateFromatAnDate:[NSDate date]];
    
    NSDate * currentDate = [NSDate date];
    if ([currentDate compare:[self getCustomDateWithHour:4]] == NSOrderedDescending && [currentDate compare:[self getCustomDateWithHour:9]] == NSOrderedAscending)
    {
        return @"早上好";
    }
    else if ([currentDate compare:[self getCustomDateWithHour:9]] == NSOrderedDescending && [currentDate compare:[self getCustomDateWithHour:12]] == NSOrderedAscending)
    {
        return @"上午好";
    }
    else if ([currentDate compare:[self getCustomDateWithHour:12]] == NSOrderedDescending && [currentDate compare:[self getCustomDateWithHour:19]] == NSOrderedAscending)
    {
        return @"下午好";
    }
    else
    {
        return @"晚上好";
    }
}

/**
 获取当前时间戳

 @return 时间戳(以秒为单位)
 */
+ (NSTimeInterval)getCurrentTimeStamp {
    NSDate* currentDate = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval currentTimeStamp = [currentDate timeIntervalSince1970];
    return currentTimeStamp;
}

@end
