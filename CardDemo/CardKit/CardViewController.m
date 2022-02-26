//
//  CardViewController.m
//  cardKit
//
 

#import "CardViewController.h"
#import "CardTableViewCell.h"
#import "CardViewModelProtocol.h"
#import "CardTableViewFooter.h"
#import "MJRefresh.h"
#import "CardKitDefine.h"
#import "UIColor+Hex.h"
#import "CardItemViewModel.h"

@interface CardViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic,copy) NSArray <CardItemModel *>* datasource;

@property (nonatomic, strong) CardItemViewModel * cardItemViewModel;

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self loadPageData];
}

- (void)loadPageData
{
    [self.cardItemViewModel loadDataWithPageName:self.pageId completionBlockWithResult:^(NSArray<CardItemModel *> * _Nonnull datasource) {
        [self.tableView.mj_header endRefreshing];
        self.datasource = datasource;
        [self.tableView reloadData];
    }];
}

- (void)updateH
{
    NSLog(@"tableView updateH");
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (CardItemViewModel *)cardItemViewModel
{
    if (_cardItemViewModel == nil) {
        _cardItemViewModel = [[CardItemViewModel alloc] init];
        __weak CardViewController * weak = self;
        [_cardItemViewModel setUpdateHblock:^{
            [weak updateH];
        }];
    }
    return _cardItemViewModel;
}
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.sectionHeaderHeight = 0.1;
        _tableView.sectionFooterHeight = 0.1;
        _tableView.backgroundColor = UIColor.clearColor;
        if (@available(iOS 12.0, *)) {
            _tableView.estimatedSectionHeaderHeight = 0.1;
            _tableView.estimatedSectionFooterHeight = 0.1;
        } else {
            _tableView.estimatedSectionHeaderHeight = 1.1;
            _tableView.estimatedSectionFooterHeight = 1.1;
        }
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = YES;
        
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
        }
        _tableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadPageData)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor mj_colorWithHexString:@"0xe5e5e5"];

    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.datasource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CardItemModel *cardItem = self.datasource[section];
    return cardItem ? 1 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CardTableViewCell * cell= [[CardTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"UITableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    CardItemModel *cardItem = self.datasource[indexPath.section];
    cell.itemModel = cardItem;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat h = [self.cardItemViewModel heightForRowAtIndexPath:indexPath];
    return h;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CardTableViewFooter *footer = [[CardTableViewFooter alloc] init];
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CardItemModel *itemModel = self.datasource[section];
    if (itemModel.isNeedSectionFooter) {
        return kCardfooterH;
    }
    return 0;
}

@end
