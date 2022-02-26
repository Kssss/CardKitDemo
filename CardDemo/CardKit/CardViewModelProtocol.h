//
//  CellViewModelProtocol.h
//  111111
//
 
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^UpdateHeightBlock)(void);

@protocol CardViewModelProtocol <NSObject>
@required
///请求网络
- (void)requestUrl:(NSString * )requestUrl;
///高度
- (CGFloat)subCardHeight;

///返回containerView
- (UIView *)containerView;

///需要刷新高度回调
- (void)updateHeightCallback:(UpdateHeightBlock) updateHblock;

@end

NS_ASSUME_NONNULL_END
