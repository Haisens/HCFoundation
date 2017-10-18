//
//  UIImage+HCExtension.h
//  HCFoundation
//
//  Created by yinhaichao on 2017/10/18.
//

#import <UIKit/UIKit.h>

typedef enum HCDottedLineType {
    HCDottedLineTypeLeft                    = 0x1,
    HCDottedLineTypeRight                   = 0x1<<1,
    HCDottedLineTypeTop                     = 0x1<<2,
    HCDottedLineTypeBottom                  = 0x1<<3,
    HCDottedLineTypeAll                     = 0x1<<4
} HCDottedLineType;


typedef enum HCPlaceholderImagePosition {
    HCPlaceholderImagePositionTop           = 0x1,
    HCPlaceholderImagePositionLeft          = 0x1<<1,
    HCPlaceholderImagePositionBottom        = 0x1<<2,
    HCPlaceholderImagePositionRight         = 0x1<<3,
    HCPlaceholderImagePositionCenter        = 0x1<<4,
} HCPlaceholderImagePosition;

@interface UIImage (HCExtension)

/**
 获取指定大小的压缩图片
 
 @param image             原图片
 @param size              大小
 */
+ (UIImage *)hc_imageWithOriginImage:(UIImage *)image scaleToSize:(CGSize)size;

/**
 *  获取颜色图片，默认大小50*50
 *
 *  @param color 颜色
 */
+ (UIImage *)hc_ImageWithColor: (UIColor *)color;

/**
 *  获取颜色图片
 *
 *  @param color 颜色
 *  @param size  大小
 */
+ (UIImage *)hc_ImageWithColor: (UIColor *)color size:(CGSize)size;

/**
 *  获取指定文字图片，文字默认80%高度
 *
 *  @param word 文字
 *  @param size 大小
 */
+ (UIImage *)hc_ImageWithWord:(NSString *)word size: (CGSize) size;
/**
 *  获取指定大小文字图片
 *
 *  @param word     文字
 *  @param size     大小
 *  @param fontSize 字体大小
 */
+ (UIImage *)hc_ImageWithWord:(NSString *)word size: (CGSize) size fontSize: (CGFloat) fontSize;
/**
 *  获取指定大小文字图片
 *
 *  @param word         文字
 *  @param wordColor    文字颜色
 *  @param size         大小
 *  @param fontSize     字体大小
 *  @param imageColor   背景颜色
 */
+ (UIImage *)hc_ImageWithWord:(NSString *)word wordColor: (UIColor *)wordColor size:(CGSize)size fontSize:(CGFloat)fontSize imageColor: (UIColor *)imageColor;

/**
 *  画一条虚线
 *
 *  @param size        大小
 *  @param color       颜色
 *  @param borderWidth 宽度
 *  @param type        类型
 *
 *  @return 虚线图片
 */
+ (UIImage*)hc_dottedLineWithSize:(CGSize)size borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth Type:(HCDottedLineType)type;
/**
 裁剪图片为圆形
 
 @param sourceImage 原图片
 
 */
+ (UIImage *)hc_circleImageWithImage:(UIImage *)sourceImage;

/**
 裁剪图片为圆形
 
 @param sourceImage 原图片
 @param borderWidth 边框
 @param borderColor 边框颜色
 
 */
+ (UIImage *)hc_circleImageWithImage:(UIImage *)sourceImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
/**
 绘制圆点
 
 @param pointColor 圆点颜色
 @param pointSize  圆点大小
 
 @return 圆点
 */
+ (UIImage *)hc_circlePointImageWithColor: (UIColor *)pointColor size: (CGSize)pointSize;

/**
 绘制圆点
 
 @param pointColor 圆点颜色
 @param pointSize  圆点大小
 
 @return 圆点
 */
+ (UIView *)hc_circlePointViewWithColor: (UIColor *)pointColor size: (CGSize)pointSize;


/**
 处理图片添加半透明遮罩
 
 @param image 图片
 @param alpha 遮罩透明渡
 */
+ (UIImage *)hc_addHalfAlphaCover:(UIImage *)image alpha: (CGFloat)alpha;

/**
 生成渐变图片
 
 @param startColor 开始颜色
 @param endColor 结束颜色
 @param size 大小
 @param startPoint 开始位置
 @param endPoint 结束位置
 @return 渐变图片
 */
+ (UIImage *)hc_GraduallyImageWithstartColor:(UIColor *)startColor
                                        endColor:(UIColor *)endColor
                                            size:(CGSize)size
                                      startPoint:(CGPoint)startPoint
                                        endPoint:(CGPoint)endPoint;

/**
 异步处理图片添加半透明遮罩
 
 @param image 图片
 @param alpha 透明度
 @param completion 处理完成事件
 */
+ (void)hc_addHalfAlphaCover:(UIImage *)image alpha: (CGFloat)alpha completion: (void (^)(UIImage *sourceImage, UIImage *resultImage))completion;

/**
 获取指定Bundle的图片
 */
+ (UIImage *)hc_bundleImageNamed:(NSString *)name bundleName: (NSString *)bundleName forClass: (Class)bundleClass;
+ (UIImage *)hc_imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;

/**
 获取指定图标的占位图
 
 @param originImage 指定图
 @param backgroundColor 背景色
 @param size 大小
 @param point 位置
 @return 占位图
 */
+ (UIImage *)hc_placeholderImageWithOriginImage:(UIImage *)originImage backgroundColor:(UIColor *)backgroundColor size:(CGSize)size point:(CGPoint)point;


/**
 获取指定图标的占位图
 
 @param originImage 指定图
 @param backgroundColor 背景色
 @param size 大小
 @param position 位置
 @return 占位图
 */
+ (UIImage *)hc_placeholderImageWithOriginImage:(UIImage *)originImage backgroundColor:(UIColor *)backgroundColor size:(CGSize)size position:(HCPlaceholderImagePosition)position;

/**
 获取指定图标的占位图，默认位置居中
 
 @param originImage 指定图
 @param backgroundColor 背景色
 @param size 大小
 @return 占位图
 */
+ (UIImage *)hc_placeholderImageWithOriginImage:(UIImage *)originImage backgroundColor:(UIColor *)backgroundColor size:(CGSize)size;

@end
