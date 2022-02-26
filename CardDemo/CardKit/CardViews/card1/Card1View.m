//
//  Card1View.m
//  111111
 

#import "Card1View.h"
#import "Masonry.h"
@implementation Card1View

- (instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}
- (void)setup
{
    UILabel * label = [[UILabel alloc] init];
    label.text = NSStringFromClass(self.class);
    label.textColor = [UIColor blackColor];
    label.font = [UIFont boldSystemFontOfSize:36];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
 
@end
