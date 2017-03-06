//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//
#import "UIViewDone.h"
#import "WeChatStylePlaceHolder.h"
#import "___FILEBASENAME___ViewController.h"
#import "___FILEBASENAME___Model.h"
#import "___FILEBASENAME___Presenter.h"
#import "___FILEBASENAME___Cell.h"
@interface ___FILEBASENAME___ViewController ()<UISearchBarDelegate, WeChatStylePlaceHolderDelegate,___FILEBASENAMEASIDENTIFIER___Protocol,UITableViewDataSource,UITableViewDelegate,___FILEBASENAMEASIDENTIFIER___CellProtocol>
{
    NSString* identStrId;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageChoose;
@property (weak, nonatomic) IBOutlet UIButton *allSelectBtn;
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
- (IBAction)allSelect:(id)sender {
    [self.presenter allSelect];
}
#pragma mark 1 target-action

#pragma mark 2 delegate dataSource protocol

-(void)pbatchSelectedArr:(NSArray *)selectedArr{
    NSLog(@"个数%ld", selectedArr.count);
}

- (void)loadSuccessResult:(NSArray *)arr {
    
    [self.mutableArray removeAllObjects];
    self.mutableArray = [arr mutableCopy];
    [self refreshTable];
    
}

- (void)loadFailResult:(NSObject *)obj {
    
    [self refreshTable];
    
}

- (void)loadSelectState {
    [self.tableView reloadData];
}

- (void)loadSelectBtnState{
    _imageChoose.image =  [UIImage imageNamed:!self.presenter.isSelectAll?@"select":@"全选点击后"];
    [_allSelectBtn setTitle:self.presenter.isSelectAll?@"全不选":@"全选" forState:UIControlStateNormal];
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
    if (Mode.isModelSelected) {
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
    [cell setData:Model];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.tableView.editing) {
        ___FILEBASENAME___Model *Model = [self.mutableArray safeObjectAtIndex: indexPath.row];
        Model.isModelSelected = YES;
        [self.presenter isAllSelectStaste];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableView.editing) {
        ___FILEBASENAME___Model *Model = [self.mutableArray safeObjectAtIndex: indexPath.row];
        Model.isModelSelected = NO;
        [self.presenter isAllSelectStaste];
    }
}
#pragma mark - private

- (void)refreshTable {
    
    if ([_tableView.mj_header isRefreshing]) {
        [_tableView.mj_header endRefreshing];
    }else if ([_tableView.mj_footer isRefreshing]){
        [_tableView.mj_footer endRefreshing];
    }
    [_tableView reloadData];
    
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
    [_tableView setEditing:YES];

    
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

//- (UITableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
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
- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 50)];
        _searchBar.delegate = self;
        _searchBar.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
        _searchBar.backgroundImage = [UIImage new];
        _searchBar.placeholder = @"搜索";
    }
    return _searchBar;
}

#pragma mark - CYLTableViewPlaceHolderDelegate Method

- (UIView *)makePlaceHolderView {
    UIView *weChatStyle = [self weChatStylePlaceHolder];
    return weChatStyle;
}

- (UIView *)weChatStylePlaceHolder {
    WeChatStylePlaceHolder *weChatStylePlaceHolder = [[WeChatStylePlaceHolder alloc] initWithFrame:self.tableView.frame];
    weChatStylePlaceHolder.placeText = @"您还没有相关充值";
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
