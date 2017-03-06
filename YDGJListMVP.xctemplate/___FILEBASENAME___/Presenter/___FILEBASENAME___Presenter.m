//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//


#import "___FILEBASENAME___Model.h"
#import "___FILEBASENAME___Presenter.h"
@interface ___FILEBASENAMEASIDENTIFIER___Presenter ()
#pragma mark - 私有属性
{
    BOOL hasMore;//下拉更多
    NSInteger page_index;//页码
}
@property (nonatomic, strong) NSMutableArray *array;//网络数据的数组
@property (nonatomic, weak) id<___FILEBASENAMEASIDENTIFIER___Protocol> delegate;
@end

@implementation ___FILEBASENAMEASIDENTIFIER___Presenter

#pragma mark - P暴露的方法
- (instancetype)initWithPresenter:(id <___FILEBASENAMEASIDENTIFIER___Protocol>)delegate {
    
    self = [super init];
    if (self) {
        self.delegate =  delegate;
    }
    return self;
    
}

- (void)network_loadNewList {
    
    [self.array removeAllObjects];
    hasMore = YES;
    page_index = 1;
    [self network_reqeustList];
    
}

- (void)network_loadNextList {
    
    page_index ++;
    [self network_reqeustList];
    
}



#pragma mark - 私有方法
- (void)network_reqeustList {
    
    if (hasMore == 0) {
        [CheckNetwork promptMessageview:@"没有更多了~"];
        [self.delegate loadFailResult:nil];
        return;
    }
   

    
    
}

#pragma mark - 属性set方法



#pragma mark - 懒加载
- (NSMutableArray *)array {
    
    if (!_array) {
        _array = [[NSMutableArray alloc] init];
    }
    return _array;
    
}

@end
