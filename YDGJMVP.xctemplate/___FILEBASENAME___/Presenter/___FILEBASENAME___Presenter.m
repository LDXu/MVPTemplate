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


@end
