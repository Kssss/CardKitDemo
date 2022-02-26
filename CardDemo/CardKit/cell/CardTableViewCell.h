//
//  CardTableViewCell.h
//  111111
//
 

#import <UIKit/UIKit.h>
#import "CardItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardTableViewCell : UITableViewCell

@property (nonatomic, strong) CardItemModel *itemModel;

@end

NS_ASSUME_NONNULL_END

