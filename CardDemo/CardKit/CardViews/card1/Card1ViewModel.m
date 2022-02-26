//
//  CardViewModel1.m
//  111111
//
 

#import "Card1ViewModel.h"
#import "Card1View.h"
@interface Card1ViewModel ()

@property (nonatomic, strong) Card1View * cardView;

@end
@implementation Card1ViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.viewH = 0;
    }
    return self;
}

//请求网络
- (void)requestUrl:(NSString * )requestUrl
{
    NSLog(@"requestUrl = %@",requestUrl);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.viewH = 110;
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
- (Card1View *)cardView
{
    if (_cardView == nil) {
        _cardView = [[Card1View alloc] init];
    }
    return _cardView;
}
@end
