//
//  Card5ViewModel.m
//  111111
//
 
#import "Card5ViewModel.h"

#import "Card5View.h"
@interface Card5ViewModel ()

@property (nonatomic, strong) Card5View * cardView;

@end
@implementation Card5ViewModel


//请求网络
- (void)requestUrl:(NSString * )requestUrl
{
    NSLog(@"requestUrl = %@",requestUrl);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.viewH = 70;
        !self.updateHblock?:self.updateHblock();
    });
}
///高度
- (CGFloat)subCardHeight
{
    return self.viewH;
}


//返回containerView
- (UIView *)containerView
{
    return self.cardView;
}
- (Card5View *)cardView
{
    if (_cardView == nil) {
        _cardView = [[Card5View alloc] init];
//        _cardView.backgroundColor = [UIColor yellowColor];
    }
    return _cardView;
}
@end
