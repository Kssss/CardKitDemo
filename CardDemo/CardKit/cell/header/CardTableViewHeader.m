//
//  CardTableViewHeader.m
//  111111
//
 

#import "CardTableViewHeader.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "UIView+Add.h"
@interface CardTableViewHeader ()
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

@end
@implementation CardTableViewHeader
- (IBAction)moreClick:(id)sender {
    !_moreClick?:_moreClick();
}
- (void)setTitle:(NSString *)title
{
    _titlelabel.text = title;
}

@end
