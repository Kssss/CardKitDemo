//
//  CardViewBaseModel.h
//  111111
//
 

#import <Foundation/Foundation.h>
#import "CardViewModelProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface CardViewBaseModel : NSObject <CardViewModelProtocol>

@property (nonatomic,assign) CGFloat viewH;

@property (nonatomic,copy) UpdateHeightBlock updateHblock;


@end

NS_ASSUME_NONNULL_END
