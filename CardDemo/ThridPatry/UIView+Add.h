 

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// UIView 一些拓展功能分类
@interface UIView (Add)
/// 拾取view某像素点颜色
- (UIColor *)mj_colorAtPoint:(CGPoint)point;

/// 从MainBundle加载同类名Xib
+ (instancetype)mj_viewFromXib;

/// 移除子视图
- (void)mj_removeAllSubviews;

/// 寻找子视图
- (UIView *)mj_findSubviewRecursively:(BOOL(^)(UIView *subview, BOOL *stop))recurse;

@end

NS_ASSUME_NONNULL_END
