//
//  CardViewModel2.m
//  111111
//
 

#import "Card2ViewModel.h"
#import "Card2View.h"
@interface Card2ViewModel ()

@property (nonatomic, strong) Card2View * cardView;

@end
@implementation Card2ViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.viewH = 40;
    }
    return self;
}
//请求网络
- (void)requestUrl:(NSString * )requestUrl
{
    NSLog(@"requestUrl = %@",requestUrl);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.viewH = 120;
        !self.updateHblock?:self.updateHblock();;
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
- (Card2View *)cardView
{
    if (_cardView == nil) {
        _cardView = [[Card2View alloc] init];
    }
    return _cardView;
}
@end
