//
//  CardTableViewCell.m
//  111111
//
 

#import "CardTableViewCell.h"
#import "Masonry.h"
#import "CardTableViewHeader.h"
#import "CardTableViewFooter.h"
#import "UIView+Add.h"
#import "CardKitDefine.h"
#import "UIColor+Hex.h"
@interface CardTableViewCell ()
@property (nonatomic, strong) UIView *stackContainerView;
@property (nonatomic, strong) CardTableViewHeader * header;
@property (nonatomic, weak) UIView * firstView;
@end
@implementation CardTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.stackContainerView];
        self.contentView.backgroundColor = [UIColor mj_colorWithHexString:@"0xe5e5e5"];
    }
    return self;
}

- (void)setItemModel:(CardItemModel *)itemModel
{
    NSAssert([itemModel isKindOfClass:CardItemModel.class], @"CardItemModel");
    _itemModel = itemModel;
    
    [self setupConfig];
    [self addSubViews];
    [self calcuationHeight];
    
    __weak CardTableViewCell * weakSelf = self;
    itemModel.updateHBlock = ^{
        [weakSelf updateH];
    };
    
}
- (void)setupConfig
{
    if (self.itemModel.isNeedRoundConner) {
        self.stackContainerView.layer.cornerRadius = 8;
        self.stackContainerView.layer.masksToBounds = YES;
    }else{
        self.stackContainerView.layer.cornerRadius = 0;
        self.stackContainerView.layer.masksToBounds = NO;
    }
    
    if (self.itemModel.cardHeadTitle) {
        self.header.title = self.itemModel.cardHeadTitle;
        __weak CardTableViewCell * Weakself = self;
        [self.header setMoreClick:^{
            NSLog(@"%@",Weakself.itemModel.cardHeadJumpUrl);
        }];
    }
}
- (void)addSubViews
{
    [self.stackContainerView mj_removeAllSubviews];
    self.firstView = nil;

    if (self.itemModel.isNeedTitleHeader) {
        
        [self.stackContainerView addSubview:self.header];
        [self.header mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(kCardHeaderH);
        }];
        self.firstView = self.header;
    }
    
    if (self.itemModel.cards.count > 0){
        __weak CardTableViewCell * weakSelf = self;
        [self.itemModel.cards enumerateObjectsUsingBlock:^(CardItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [weakSelf addCards:obj];
            obj.updateHBlock = ^{
                [weakSelf updateH];
            };
        }];
    }else{
        [self addCards:self.itemModel];
    }
        
}

- (void)addCards:(CardItemModel *)itemModel
{
    UIView *containerView = [itemModel.cellViewModel containerView];
    CGFloat containerViewH = [itemModel.cellViewModel subCardHeight];
    [self.stackContainerView addSubview:containerView];
    [containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (self.firstView  != nil) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.firstView .mas_bottom);
        }else{
            make.top.left.right.mas_equalTo(0);
        }
        make.height.mas_equalTo(containerViewH);
    }];
    self.firstView = containerView;
}

- (void)updateH
{
    NSLog(@"cell updateH");
    if (self.itemModel.cards.count > 0){
        [self.itemModel.cards enumerateObjectsUsingBlock:^(CardItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIView *containerView = obj.cellViewModel.containerView;
            CGFloat containerViewH = obj.cellViewModel.subCardHeight;
            [containerView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(containerViewH);
            }];
        }];
    }else{
        UIView *containerView = self.itemModel.cellViewModel.containerView;
        CGFloat containerViewH = self.itemModel.cellViewModel.subCardHeight;
        [containerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(containerViewH);
        }];
    }
}

- (void)calcuationHeight
{
    self.itemModel.cardHight = 0;
    if (self.itemModel.isNeedTitleHeader) {
        self.itemModel.cardHight += kCardHeaderH;
    }
    
    if (self.itemModel.cards.count > 0){
        [self.itemModel.cards enumerateObjectsUsingBlock:^(CardItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGFloat containerViewH = obj.cellViewModel.subCardHeight;
            self.itemModel.cardHight += containerViewH;
        }];
    }else{
        CGFloat containerViewH = self.itemModel.cellViewModel.subCardHeight;
        self.itemModel.cardHight += containerViewH;
    }
    
}
 
- (CardTableViewHeader *)header
{
    if (_header == nil) {
        CardTableViewHeader * header = [CardTableViewHeader mj_viewFromXib];
        _header = header;
    }
    return _header;
}
- (UIView *)stackContainerView
{
    if (_stackContainerView == nil) {
        _stackContainerView = [[UIView alloc] init];
        _stackContainerView.backgroundColor = [UIColor whiteColor];
    }
    return _stackContainerView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.stackContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 12, 0, 12));
    }];
    
}
@end
