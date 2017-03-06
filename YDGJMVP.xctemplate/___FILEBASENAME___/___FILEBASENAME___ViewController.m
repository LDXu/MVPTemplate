//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___ViewController.h"
#import "___FILEBASENAME___Model.h"
#import "___FILEBASENAME___Presenter.h"
@interface ___FILEBASENAME___ViewController ()<___FILEBASENAMEASIDENTIFIER___Protocol>
@property (nonatomic, strong) ___FILEBASENAMEASIDENTIFIER___Presenter *presenter;
@end

@implementation ___FILEBASENAME___ViewController

#pragma mark - def

#pragma mark - override
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.title = @"新模块";

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

#pragma mark - private

#pragma mark - getter / setter

- (void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key {
    
}

- (___FILEBASENAME___Presenter *)presenter {
    if (!_presenter) {
        _presenter = [[___FILEBASENAME___Presenter alloc] initWithPresenter:self];
    }
    return _presenter;
}

@end
