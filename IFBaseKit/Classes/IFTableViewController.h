//
//  IFTableViewController.h
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import "IFRefreshController.h"

NS_ASSUME_NONNULL_BEGIN

@interface IFTableViewController : IFRefreshController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign, readonly) UITableViewStyle tableViewStyle;
@property (nonatomic, strong, readonly) UITableView *tableView;

- (void)configureTableView;

/**
 如果该值返回为nil，则默认设置当前Controller为DataSource和Delegate
 
 @return UITableView的DataSource和Delegate实现类
 */
- (Class)tableDataSourceClass;

@end

NS_ASSUME_NONNULL_END
