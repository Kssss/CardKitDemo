//
//  CardTableViewFooter.m
//  111111
//
 

#import "CardTableViewFooter.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
@implementation CardTableViewFooter


- (instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}
- (void)setup
{
    self.backgroundColor = [UIColor mj_colorWithHexString:@"0xe5e5e5"];
}
@end
