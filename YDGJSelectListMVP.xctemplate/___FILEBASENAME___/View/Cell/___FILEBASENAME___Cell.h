//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "BaseTableViewCell.h"

@protocol ___FILEBASENAMEASIDENTIFIER___CellProtocol <NSObject>
@required;
@optional
- (IBAction)action:(NSInteger)cellTag;
@end

@interface ___FILEBASENAMEASIDENTIFIER___Cell :  BaseTableViewCell
- (void)binDingWithProtocol:(id <___FILEBASENAMEASIDENTIFIER___CellProtocol>)delegate withTag:(NSInteger)cellTag;
@end
