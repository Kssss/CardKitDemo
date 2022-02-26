//
//  CardItemModel.h
//  111111
//
 

#import <Foundation/Foundation.h>
#import "CardViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardItemModel : NSObject

@property (nonatomic,copy) NSString * subCardId;

///
@property (nonatomic,copy) NSString * subCardUrl;

@property (nonatomic,copy) NSArray <CardItemModel *>* cards;

@property (nonatomic,strong) id <CardViewModelProtocol> cellViewModel;

@property (nonatomic,copy) NSString * cardHeadJumpUrl;
@property (nonatomic,copy) NSString * cardHeadTitle;

@property (nonatomic, assign) BOOL isNeedRoundConner;   // 卡片是否需要圆角
@property (nonatomic, assign) BOOL isNeedTitleHeader;   // 卡片是否需要 title header
@property (nonatomic, assign) BOOL isNeedMoreButton;    // 卡片配置是否需要更多按钮
@property (nonatomic, assign) BOOL isNeedSectionFooter; // 卡片是否需要 section Footer 间隔
@property (nonatomic, assign) BOOL isIgnoreCache;       // 卡片是否忽略缓存
/// 卡片的总高度
@property (nonatomic,assign) CGFloat cardHight;

///
@property (nonatomic,copy) UpdateHeightBlock updateHBlock;

@end

NS_ASSUME_NONNULL_END
