 

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 16进制颜色转换分类
@interface UIColor (Hex)
/// RGB red值
@property (nonatomic, assign, readonly) CGFloat mjred;

/// RGB green值
@property (nonatomic, assign, readonly) CGFloat mjgreen;

/// RGB blue值
@property (nonatomic, assign, readonly) CGFloat mjblue;

/// RGB alpha值
@property (nonatomic, assign, readonly) CGFloat mjalpha;

/// 颜色hex字符串
@property (nonatomic, copy, readonly) NSString *mjhexString;

/// 根据16进制值生成Color对象
+ (UIColor *)mj_colorWithHex:(UInt32)hex;

/// 根据颜色16进制值和alpha值生成Color对象
+ (UIColor *)mj_colorWithHex:(UInt32)hex alpha:(CGFloat)alpha;

/// 根据颜色16进制字符串生成生成Color对象
+ (UIColor *)mj_colorWithHexString:(NSString *)hexString;

/// 根据颜色16进制字符串和alpha值生成生成Color对象
+ (UIColor *)mjcolorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/// 根据Red、Green、Blue值生成生成Color对象，RGB取值范围0~255
+ (UIColor *)mjcolorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

/// 根据Red、Green、Blue值和alpha值生成生成Color对象
+ (UIColor *)mjcolorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;

/// 生成随机色
+ (UIColor *)mjrandomColor;

@end

NS_ASSUME_NONNULL_END
