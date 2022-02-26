 

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

- (CGFloat)mjred {
    CGFloat r = 0, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return r;
}

- (CGFloat)mjgreen {
    CGFloat r, g = 0, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return g;
}

- (CGFloat)mjblue {
    CGFloat r , g, b = 0, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return b;
}

- (CGFloat)mjalpha {
    return CGColorGetAlpha(self.CGColor);
}

- (NSString *)mjhexString {
    UIColor* color = self;
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#ffffff"];
    }
    return [NSString stringWithFormat:@"#%02X%02X%02X", (int)((CGColorGetComponents(color.CGColor))[0] * 255.0),
            (int)((CGColorGetComponents(color.CGColor))[1] * 255.0),
            (int)((CGColorGetComponents(color.CGColor))[2] * 255.0)];
}


+ (UIColor *)mjcolorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

+ (UIColor *)mj_colorWithHexString:(NSString *)color {
    return [self mjcolorWithHexString:color alpha:1.0f];
}

+ (UIColor *)mjcolorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [self mjcolorWithRed:red green:green blue:blue alpha:1.0f];
}

+ (UIColor *)mjcolorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:(red)/255.0f
                           green:(green)/255.0f
                            blue:(blue)/255.0f
                           alpha:alpha];
}

+ (UIColor *)mj_colorWithHex:(UInt32)hex{
    return [self mj_colorWithHex:hex alpha:1.0f];
}

+ (UIColor *)mj_colorWithHex:(UInt32)hex alpha:(CGFloat)alpha{
    NSInteger blue = hex & 0xFF;
    NSInteger green = ((hex & 0xFF00) >> 8);
    NSInteger red = ((hex & 0xFF0000) >> 16);
    return [self mjcolorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)mjrandomColor {
    return [UIColor colorWithRed:(CGFloat)arc4random() / (CGFloat)RAND_MAX
                           green:(CGFloat)arc4random() / (CGFloat)RAND_MAX
                            blue:(CGFloat)arc4random() / (CGFloat)RAND_MAX
                           alpha:1.0f];
}
@end
