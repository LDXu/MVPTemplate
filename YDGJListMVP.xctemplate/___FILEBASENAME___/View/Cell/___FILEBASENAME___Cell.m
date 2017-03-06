//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___FILEBASENAME___Cell.h"
#import "___FILEBASENAME___Model.h"
@interface ___FILEBASENAMEASIDENTIFIER___Cell ()
@property (assign, nonatomic) NSInteger cellTag;
@property (weak, nonatomic)id<___FILEBASENAMEASIDENTIFIER___CellProtocol> delegate;
#pragma mark - 创建cell xib关联的控件
@end

@implementation ___FILEBASENAMEASIDENTIFIER___Cell

#pragma mark - 初始化
- (void)awakeFromNib {
    
    [super awakeFromNib];
    
}

#pragma mark - 解决复用时问题
- (void)prepareForReuse {
    [super prepareForReuse];
    
}

#pragma mark - cell代理和tag
- (void)binDingWithProtocol:(id <___FILEBASENAMEASIDENTIFIER___CellProtocol>)delegate withTag:(NSInteger)cellTag {
    _delegate = delegate;
    _cellTag = cellTag;
}

#pragma mark - cell赋值显示
- (void)setData:(___FILEBASENAME___Model *)data callBack:(objWithBlock)callback {
    
    [super setData:data callBack:callback];
    
}

- (void)setData:(___FILEBASENAME___Model *)data {
    
    [super setData:data];
    
}

#pragma mark - cell控件的动作



#pragma mark - set/get方法  改变状态

@end
