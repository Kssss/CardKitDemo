//
//  Card4Viewmodel.m
//  111111
//
 

#import "Card4ViewModel.h"
#import "Card4View.h"
@interface Card4ViewModel ()

@property (nonatomic, strong) Card4View * cardView;

@end


@implementation Card4ViewModel


//请求网络
- (void)requestUrl:(NSString * )requestUrl
{
    NSLog(@"requestUrl = %@",requestUrl);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.viewH = 40;
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
- (Card4View *)cardView
{
    if (_cardView == nil) {
        _cardView = [[Card4View alloc] init];
//        _cardView.backgroundColor = [UIColor blueColor];
    }
    return _cardView;
}
@end
