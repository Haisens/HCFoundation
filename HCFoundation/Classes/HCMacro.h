//
//  HCMacro.h
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/13.
//

#ifndef HCMacro_h
#define HCMacro_h

//RGB颜色十进制
#define UIColorFromRGB(R, G, B, a)          [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
//RGB颜色十六进制
#define UIColorFromRGB16(RGBValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//默认字体
#define Default_Font(num)                [UIFont systemFontOfSize:(num)]
#define Default_Bold_Font(num)           [UIFont boldSystemFontOfSize:(num)]

//是否为iOS7及以上系统
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
//是否为iOS8及以上系统
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
//是否为iOS9及以上系统
#define iOS9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)
//是否为iOS10及以上系统
#define iOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)

//屏幕宽度
#define ScreenWidth           [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define ScreenHeight          [UIScreen mainScreen].bounds.size.height
//导航栏高度
#define NavigationHeight      44.0f
//tab栏高度
#define TabbarHeight          49.0f
//状态栏高度
#define StatusBarHeight       (iOS7 ? 20 : 0)

#define HCURL(urlString)       [NSURL URLWithString:urlString]

//Debug模式打印Log信息
#ifdef  DEBUG
#define debug_NSLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define debug_NSLog(format, ...)
#endif

#ifdef DEBUG
#define HCLog(...) NSLog(@"\n%s 第%d行: \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define HCLog(...)
#endif


/**
 weak对象
 */
#define BlockSelf(blockSelf) __weak __typeof(&*self)blockSelf = self

#endif /* HCMacro_h */
