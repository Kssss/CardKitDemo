 

#import "UIView+Add.h"

@implementation UIView (Add)

- (UIColor *)mj_colorAtPoint:(CGPoint)point {
    UIGraphicsBeginImageContext(self.frame.size);//全屏截图，包括window
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, viewImage.size.width, viewImage.size.height), point)) {
        return nil;
    }
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = viewImage.CGImage;
    NSUInteger width = viewImage.size.width;
    NSUInteger height = viewImage.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData, 1, 1, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    // Draw the pixel we are interested in onto the bitmap context
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    // Convert color values [0..255] to floats [0.0..1.0]
    CGFloat red = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (instancetype)mj_viewFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)mj_removeAllSubviews {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

/// 寻找子视图
- (UIView*)mj_findSubviewRecursively:(BOOL(^)(UIView *subview, BOOL *stop))recurse{
    for (UIView *view in self.subviews) {
        BOOL stop = NO;
        if(recurse(view, &stop)) {
            return [view mj_findSubviewRecursively:recurse];
        }else if(stop) {
            return view;
        }
    }
    return nil;
}

@end
