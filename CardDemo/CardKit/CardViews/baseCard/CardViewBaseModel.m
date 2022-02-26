//
//  CardViewBaseModel.m
//  111111
//
 

#import "CardViewBaseModel.h"

@implementation CardViewBaseModel
//请求网络
- (void)requestUrl:(NSString * )requestUrl
{
    NSAssert(NO, @"subClass override");
}
///高度
- (CGFloat)subCardHeight
{
    NSAssert(NO, @"subClass override");
    return 0;
}

//返回containerView
- (UIView *)containerView
{
    NSAssert(NO, @"subClass override");
    return nil;
}
///需要刷新高度回调
- (void)updateHeightCallback:(UpdateHeightBlock) updateHblock
{
    self.updateHblock = updateHblock;
}

@end
