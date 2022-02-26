//
//  Card7ViewModel.m
//  cardKit
//
 
#import "Card7ViewModel.h"
#import "Card7View.h"
@interface Card7ViewModel ()
@property (nonatomic, strong) Card7View * cardView;
@end
@implementation Card7ViewModel

///请求网络
- (void)requestUrl:(NSString * )requestUrl
{
    NSLog(@"requestUrl %@",requestUrl);
    self.viewH = 50;
    if (self.updateHblock) {
        self.updateHblock();
    }
}
///高度
- (CGFloat)subCardHeight
{
    return self.viewH;
}

///返回containerView
- (UIView *)containerView
{
    return self.cardView;
}

- (Card7View *)cardView
{
    if (_cardView == nil) {
        _cardView = [[Card7View alloc] init];
        _cardView.backgroundColor = [UIColor greenColor];
    }
    return _cardView;
}




@end
