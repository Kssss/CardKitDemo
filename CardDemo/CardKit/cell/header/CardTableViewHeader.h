//
//  CardTableViewHeader.h
//  111111
//
 
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^MoreClickHandle)(void);
@interface CardTableViewHeader : UIView
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) MoreClickHandle moreClick;



@end

NS_ASSUME_NONNULL_END
