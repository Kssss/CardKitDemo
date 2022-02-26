//
//  CardItemViewModel.h
//  cardKit
//
 
#import <Foundation/Foundation.h>
#import "CardItemModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^CompletBlock)(NSArray <CardItemModel *>* datasource);
typedef void(^UpdateHeightBlock)(void);

@interface CardItemViewModel : NSObject

///需要刷新高度回调
@property (nonatomic,copy) UpdateHeightBlock updateHblock;

//获取page的页面card数据
- (void)loadDataWithPageName:(NSString *)pageName completionBlockWithResult:(nullable CompletBlock)result;

///獲取卡片高度
- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
