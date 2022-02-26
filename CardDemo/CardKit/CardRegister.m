//
//  CardRegister.m
//  111111
//
 

#import "CardRegister.h"
#import "Card1ViewModel.h"

static NSMutableDictionary * cardDic = nil;

@interface CardRegister ()


@end
@implementation CardRegister
+ (void)initialize{
    [self registerCardView];
}
+ (void)registerCardView
{
    cardDic = @{
        @"1":@"Card1ViewModel",
        @"2":@"Card2ViewModel",
        @"3":@"Card3ViewModel",
        @"4":@"Card4ViewModel",
        @"5":@"Card5ViewModel",
        @"6":@"Card6ViewModel",
        @"7":@"Card7ViewModel",
    }.mutableCopy;
}

+ (Class)getCardViewWithCardId:(NSString *)cardId
{
    NSString *cls = cardDic[cardId];
    
    return cls.length ? NSClassFromString(cls) : nil;
}


@end
