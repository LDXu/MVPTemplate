//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "WeChatStylePlaceHolder.h"
#import "UIViewDone.h"
#import "___FILEBASENAME___ViewController.h"
#import "___FILEBASENAME___Model.h"
#import "___FILEBASENAME___Presenter.h"
#import "___FILEBASENAME___Cell.h"
@interface ___FILEBASENAME___ViewController ()<___FILEBASENAMEASIDENTIFIER___Protocol,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,WeChatStylePlaceHolderDelegate,___FILEBASENAMEASIDENTIFIER___CellProtocol>
{
    NSString* identStrId;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)  NSMutableArray *mutableArray;
@property (nonatomic, strong) ___FILEBASENAMEASIDENTIFIER___Presenter *presenter;
@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation ___FILEBASENAME___ViewController

#pragma mark - def

#pragma mark - override
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.title = @"新模块";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addListView];
    [self network_loadNewList];
    
}

#pragma mark - api

#pragma mark - model event

#pragma mark 1 notification
- (void)addNotification{

}
#pragma mark 2 KVO
- (void)addKVO{
    
}

#pragma mark - view event

#pragma mark 1 target-action

#pragma mark 2 delegate dataSource protocol

- (void)loadSuccessResult:(NSArray *)arr {
    
    [self.mutableArray removeAllObjects];
    self.mutableArray = [arr mutableCopy];
    [self refreshTable];
    
}

- (void)loadFailResult:(NSObject *)obj {
    
    [self refreshTable];
    
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.mutableArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.0000001;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.0000001;
    
}

-(void)tableView:(UITableView*)tableView willDisplayCell:(UITableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];//不需要选中时
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ___FILEBASENAME___Model *Model = [self.mutableArray safeObjectAtIndex: indexPath.row];
    ___FILEBASENAME___Cell *cell = [self.tableView dequeueReusableCellWithIdentifier:identStrId];
    cell.tintColor = RGBACOLOR(253, 102, 84, 1);
    cell.selectionStyle = UITableViewCellStyleSubtitle ;
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:CGRectZero];
    [cell binDingWithProtocol:self withTag:indexPath.row];
    [cell setData:Model];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

#pragma mark - private

- (void)refreshTable {
    
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    [_tableView cyl_reloadData];
    
}

-(void)addListView {
    
    _tableView.backgroundColor = kUIColorFromHex(0xEDEDED);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView = [UIView new];
    self.tableView.estimatedRowHeight = 100;
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(network_loadNewList)];
    _tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(network_loadNextList)];
    identStrId = NSStringFromClass([___FILEBASENAME___Cell class]);
    [_tableView registerClass:[___FILEBASENAME___Cell class] forCellReuseIdentifier:identStrId];
    [self.view addSubview:self.searchBar];
    UIViewDone* viewDone = [[UIViewDone alloc]init];
    [viewDone.buttonDone addTarget:self action:@selector(doneEdit) forControlEvents:UIControlEventTouchUpInside];
    _searchBar.inputAccessoryView = viewDone;
    
}

-(void)doneEdit{
    
    [self searchBarSearchButtonClicked:_searchBar];
    
}

#pragma mark - 搜索
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    self.presenter.searchText = _searchBar.text;
    [_searchBar resignFirstResponder];
    
}


//第一次请求网络数据或上拉刷新
- (void)network_loadNewList {
    
    [self.presenter network_loadNewList];
    
}

//下拉加载更多
- (void)network_loadNextList {

    [self.presenter network_loadNextList];
    
}

#pragma mark - getter / setter

- (void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key {
    
}

- (NSMutableArray *)mutableArray {
    if (!_mutableArray) {
        _mutableArray = [[NSMutableArray alloc] init];
    }
    return _mutableArray;
}

- (___FILEBASENAME___Presenter *)presenter {
    if (!_presenter) {
        _presenter = [[___FILEBASENAME___Presenter alloc] initWithPresenter:self];
    }
    return _presenter;
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        _searchBar.delegate = self;
        _searchBar.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
        _searchBar.backgroundImage = [UIImage new];
        _searchBar.placeholder = @"搜索";
    }
    return _searchBar;
}

//- (UITableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight - 50) style:UITableViewStylePlain];
//        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//        _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//        _tableView.delegate  = self;
//        _tableView.dataSource = self;
//        _tableView.backgroundColor = kUIColorFromHex(0xEDEDED);
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.tableFooterView = [UIView new];
//    }
//    return _tableView;
//}

#pragma mark - CYLTableViewPlaceHolderDelegate Method

- (UIView *)makePlaceHolderView {
    UIView *weChatStyle = [self weChatStylePlaceHolder];
    return weChatStyle;
}

- (UIView *)weChatStylePlaceHolder {
    WeChatStylePlaceHolder *weChatStylePlaceHolder = [[WeChatStylePlaceHolder alloc] initWithFrame:self.tableView.frame];
    weChatStylePlaceHolder.placeText = @"您还没有相关订单";
    weChatStylePlaceHolder.imagename = @"没有订单";
    [weChatStylePlaceHolder addUIemptyOverlayImageView];
    [weChatStylePlaceHolder addUIemptyOverlayLabel];
    weChatStylePlaceHolder.delegate = self;
    return weChatStylePlaceHolder;
}

-(void)emptyOverlayClicked:(id)sender{
    [self network_loadNewList];
}


@end
