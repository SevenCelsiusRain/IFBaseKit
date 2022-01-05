//
//  IFTableViewController.m
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import "IFTableViewController.h"
#import "IFTableDataSource.h"

@interface IFTableViewController ()
@property (nonatomic, strong) IFTableDataSource *tableDataSource;
@end

@implementation IFTableViewController

@synthesize refreshContainerView = _refreshContainerView;

#pragma mark - Life Cycle

- (void)if_setupViews {
    [super if_setupViews];
    [self configureTableView];
}

#pragma mark - UITableViewDataSOurce

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

#pragma mark - Private Methods
- (id<UITableViewDataSource, UITableViewDelegate>)realTableDataSource {
    Class tableDataSourceClass = [self tableDataSourceClass];
    if (tableDataSourceClass) {
        return self.tableDataSource;
    }
    return self;
}

#pragma mark - Public Methods

- (void)configureTableView {
}

- (Class)tableDataSourceClass {
    return nil;
}

#pragma mark - Getters and Setters

- (UIScrollView *)refreshContainerView {
    if (!_refreshContainerView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
        _refreshContainerView  = tableView;
        tableView.dataSource   = [self realTableDataSource];
        tableView.delegate     = [self realTableDataSource];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator   = NO;
        tableView.showsHorizontalScrollIndicator = NO;
        tableView.backgroundColor = [UIColor clearColor];
    }
    return _refreshContainerView;
}

- (UITableViewStyle)tableViewStyle {
    return UITableViewStylePlain;
}

- (UITableView *)tableView {
    return (UITableView *)(self.refreshContainerView);
}

- (IFTableDataSource *)tableDataSource {
    if (!_tableDataSource) {
        _tableDataSource = [[[self tableDataSourceClass] alloc] init];
    }
    return _tableDataSource;
}

@end
