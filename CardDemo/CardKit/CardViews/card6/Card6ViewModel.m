//
//  Card6ViewModel.m
//  111111
//
 

#import "Card6ViewModel.h"

#import "Card6View.h"
@interface Card6ViewModel ()

@property (nonatomic, strong) Card6View * cardView;


@end
@implementation Card6ViewModel


//请求网络
- (void)requestUrl:(NSString * )requestUrl
{
    NSLog(@"requestUrl = %@",requestUrl);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.viewH = 100;
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
- (Card6View *)cardView
{
    if (_cardView == nil) {
        _cardView = [[Card6View alloc] init];
//        _cardView.backgroundColor = [UIColor redColor];
    }
    return _cardView;
}
@end
