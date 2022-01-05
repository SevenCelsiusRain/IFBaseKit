//
//  IFRefreshController.h
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import "IFBaseController.h"
#import "IFRefresh.h"

typedef NS_ENUM(NSUInteger, IFRefreshType) {
    IFRefreshTypeNone = 0,
    IFRefreshTypeHeader,
    IFRefreshTypeFooter,
    IFRefreshTypeHeaderAndFooter
};

NS_ASSUME_NONNULL_BEGIN

@interface IFRefreshController : IFBaseController<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (nonatomic, strong) UIScrollView *refreshContainerView;

/////////////////////上拉下拉刷新//////////////////////////////
@property (nonatomic, assign) IFRefreshType refreshType;

@property (nonatomic, strong, readonly) NSString *refreshHeaderKey;
@property (nonatomic, strong, readonly) NSString *refreshFooterKey;

- (void)configureRefreshHeader:(IFRefreshHeaderView *)refreshHeader;
- (void)configureRefreshFooter:(IFRefreshFooterView *)refreshFooter;
- (void)refreshHeaderAction;
- (void)refreshFooterAction;

- (void)showRefreshHeader:(BOOL)shouldShow;
- (void)showRefreshFooter:(BOOL)shouldShow;

- (void)beginRefreshHeader;
- (void)beginRefreshFooter;
- (void)endRefreshHeader;
- (void)endRefreshFooter;

/////////////////////空数据配置//////////////////////////////
@property (nonatomic, assign) BOOL supportEmptyDataView;

@end

NS_ASSUME_NONNULL_END
