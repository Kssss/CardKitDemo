//
//  CardItemViewModel.m
//  cardKit
//
 

#import "CardItemViewModel.h"
#import "CardItemModel.h"
#import "MJExtension.h"
#import "CardRegister.h"
#import "CardKitDefine.h"
#import "CardViewModelProtocol.h"
@interface CardItemViewModel ()

@property (nonatomic, strong) NSArray <CardItemModel *> * cardItems;

@end
@implementation CardItemViewModel
- (void)loadDataWithPageName:(NSString *)pageName completionBlockWithResult:(nullable CompletBlock)result
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray * items = @[
                            @{
                                @"cards":@[@{
                                        @"subCardId":@"1",
                                        @"subCardUrl":@"url = 1111",
                                    },@{
                                               @"subCardId":@"1",
                                               @"subCardUrl":@"url = 1111",
                                           },
                                    @{
                                        @"subCardId":@"1",
                                        @"subCardUrl":@"url = 1111",
                                }],
                                @"isNeedRoundConner":@"1",
                                @"isNeedTitleHeader":@"1",
                                @"isNeedSectionFooter":@"1",
                                @"cardHeadJumpUrl":@"aaaa",
                                @"cardHeadTitle":@"第一行功能",
                            },
                            @{
                                                            @"cards" : @[@{
                                                                            @"subCardId":@"2",
                                                                            @"subCardUrl":@"url = 2222",
                                                                        },
                                                                         @{
                                                                            @"subCardId":@"2",
                                                                            @"subCardUrl":@"url = 2222",
                                                                         },
                                                                         @{
                                                                            @"subCardId":@"2",
                                                                            @"subCardUrl":@"url = 2222",
                                                                         }
                                                                        ],
                                                            @"isNeedRoundConner":@"1",
                                                            @"isNeedTitleHeader":@"1",
                                                            @"isNeedMoreButton":@"1",
                                                            @"isNeedSectionFooter":@"1",
                                                            @"cardHeadJumpUrl":@"bbb",
                                                            @"cardHeadTitle":@"第二行功能",
                                                        },
                            @{
                                @"cards" : @[@{
                                                @"subCardId":@"3",
                                                @"subCardUrl":@"url = 3333",
                                            },
                                            ],
                                @"isNeedRoundConner":@"1",
                                @"isNeedTitleHeader":@"1",
                                @"isNeedMoreButton":@"1",
                                @"isNeedSectionFooter":@"1",
                                @"cardHeadJumpUrl":@"bbb",
                                @"cardHeadTitle":@"第三行功能",
                            },
                            @{
                                @"cards" : @[@{
                                                @"subCardId":@"4",
                                                @"subCardUrl":@"url = 4444",
                                            },
                                            ],
                                @"isNeedRoundConner":@"1",
                                @"isNeedTitleHeader":@"1",
                                @"isNeedMoreButton":@"1",
                                @"isNeedSectionFooter":@"1",
                                @"cardHeadJumpUrl":@"bbb",
                                @"cardHeadTitle":@"第四行功能",
                            },
                            @{
                                @"cards" : @[@{
                                                @"subCardId":@"4",
                                                @"subCardUrl":@"url = 4444",
                                            },
                                             @{
                                                @"subCardId":@"5",
                                                @"subCardUrl":@"url = 5555",
                                             },
                                            
                                            ],
                                @"isNeedRoundConner":@"1",
                                @"isNeedTitleHeader":@"1",
                                @"isNeedMoreButton":@"1",
                                @"isNeedSectionFooter":@"1",
                                @"cardHeadJumpUrl":@"bbb",
                                @"cardHeadTitle":@"第四行功能",
                            },
                            @{
                                @"subCardId":@"5",
                                @"subCardUrl":@"url = 5555",
                                @"isNeedRoundConner":@"1",
                                @"isNeedTitleHeader":@"1",
                                @"isNeedMoreButton":@"1",
                                @"isNeedSectionFooter":@"1",
                                @"cardHeadJumpUrl":@"bbb",
                                @"cardHeadTitle":@"第五行功能",
                            },
                            @{
                                @"cards" : @[@{
                                                @"subCardId":@"1",
                                                @"subCardUrl":@"url = 4444",
                                            },
                                             @{
                                                @"subCardId":@"2",
                                                @"subCardUrl":@"url = 5555",
                                             },
                                             @{
                                                @"subCardId":@"3",
                                                @"subCardUrl":@"url = 5555",
                                             },
                                             @{
                                                @"subCardId":@"4",
                                                @"subCardUrl":@"url = 5555",
                                             },
                                             @{
                                                @"subCardId":@"5",
                                                @"subCardUrl":@"url = 6666",
                                             },
                                             @{
                                                @"subCardId":@"6",
                                                @"subCardUrl":@"url = 6666",
                                             },
                                             @{
                                                @"subCardId":@"7",
                                                @"subCardUrl":@"url = 777",
                                             }
                                            ],
                                @"isNeedRoundConner":@"1",
                                @"isNeedTitleHeader":@"1",
                                @"isNeedMoreButton":@"1",
                                @"isNeedSectionFooter":@"1",
                                @"cardHeadJumpUrl":@"bbb",
                                @"cardHeadTitle":@"第六行功能",
                            }
                            
        ];
      
                
        self.cardItems = [CardItemModel mj_objectArrayWithKeyValuesArray:items];
                        
        [self.cardItems enumerateObjectsUsingBlock:^(CardItemModel  * cardItem, NSUInteger idx, BOOL * _Nonnull stop) {
            if(cardItem.cards.count){
                [cardItem.cards enumerateObjectsUsingBlock:^(CardItemModel * _Nonnull subCardItem, NSUInteger idx, BOOL * _Nonnull stop) {
                    [self  configCellViewModel:subCardItem];
                }];
            }else{
                [self  configCellViewModel:cardItem];
            }
        }];
        !result?:result(self.cardItems);
    });
  
}

- (void)configCellViewModel:(CardItemModel *) cardItem
{
    Class class = [CardRegister getCardViewWithCardId:cardItem.subCardId];
    if (class) {
        id <CardViewModelProtocol> cellViewModel = [[class alloc] init];
        cardItem.cellViewModel = cellViewModel;
        __weak CardItemViewModel * weakself = self;
        [cellViewModel updateHeightCallback:^{
            !cardItem.updateHBlock?:cardItem.updateHBlock();
            !weakself.updateHblock?:weakself.updateHblock();
        }];
        [cellViewModel requestUrl:cardItem.subCardUrl];
    }
}


- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __block CGFloat cardH = 0;
    CardItemModel * itemModel = self.cardItems[indexPath.section];
    if (itemModel.isNeedTitleHeader) {
        cardH += kCardHeaderH;
    }
    if (itemModel.cards.count) {
        [itemModel.cards enumerateObjectsUsingBlock:^(CardItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            id <CardViewModelProtocol> cellViewModel = obj.cellViewModel;
            cardH += cellViewModel.subCardHeight;
        }];
    }else{
        id <CardViewModelProtocol> cellViewModel = itemModel.cellViewModel;
        cardH += cellViewModel.subCardHeight;
    }
    
    return cardH;
}
@end
