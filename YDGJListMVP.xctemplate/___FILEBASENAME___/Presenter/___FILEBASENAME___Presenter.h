//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import <Foundation/Foundation.h>

#pragma mark - ViewController遵守协议方法
@protocol ___FILEBASENAMEASIDENTIFIER___Protocol <NSObject>
@required
- (void)loadSuccessResult:(NSArray*)arr;
- (void)loadFailResult:(NSObject*)obj;
@optional
@end

@interface ___FILEBASENAMEASIDENTIFIER___Presenter: NSObject
#pragma mark -  P暴露的属性

#pragma mark - P暴露的方法
//构造方法设置代理者
- (instancetype)initWithPresenter:(id <___FILEBASENAMEASIDENTIFIER___Protocol>)delegate;
//第一次请求网络数据或上拉刷新
- (void)network_loadNewList;
//下拉加载更多
- (void)network_loadNextList;
@end
