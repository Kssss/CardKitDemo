//
//  Card3ViewModel.m
//  111111
//
 
#import "Card3ViewModel.h"

#import "Card3View.h"

@interface Card3ViewModel ()

@property (nonatomic, strong) Card3View * cardView;
@property (nonatomic,assign) CGFloat viewH;



@end
@implementation Card3ViewModel
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.viewH = 50;
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
- (Card3View *)cardView
{
    if (_cardView == nil) {
        _cardView = [[Card3View alloc] init];
//        _cardView.backgroundColor = [UIColor grayColor];
    }
    return _cardView;
}
@end
