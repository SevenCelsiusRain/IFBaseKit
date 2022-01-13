//
//  IFRefreshController.m
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import "IFRefreshController.h"
#import "IFRefreshManager.h"
#import <Masonry/Masonry.h>


#ifndef if_weakify
    #define if_weakify(object) __weak typeof(object) weak##_##object = object;
#endif

#ifndef if_strongify
    #define if_strongify(object) typeof(object) object = weak##_##object;
#endif

@interface IFRefreshController ()

@end

@implementation IFRefreshController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _refreshType = IFRefreshTypeHeader;
        _supportEmptyDataView = NO;
    }
    return self;
}

#pragma mark - Life Cycle
- (void)if_setupViews {
    [self.view addSubview:self.refreshContainerView];
    [self configureRefreshHeaderAndFooter];
    [self configureEmptyDataViews];
}

- (void)if_configureConstraints {
    if_weakify(self)
    [self.refreshContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        if_strongify(self)
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
}

#pragma mark - Private Methods

- (void)configureRefreshHeaderAndFooter {
    
    if (self.refreshType == IFRefreshTypeHeader || self.refreshType == IFRefreshTypeHeaderAndFooter) {
        [self addRefreshHeader];
    }
    
    if (self.refreshType == IFRefreshTypeFooter || self.refreshType == IFRefreshTypeHeaderAndFooter) {
        [self addRefreshFooter];
    }
}

- (void)addRefreshHeader {
    if_weakify(self)
    IFRefreshManager *refreshMgr = [IFRefreshManager sharedRefreshManager];
    IFRefreshHeaderView *refreshHeader = [refreshMgr refreshHeaderForKey:self.refreshHeaderKey
                                                     configuration:^(id refreshComponenet) {
                                                         if_strongify(self)
                                                         [self configureRefreshHeader:refreshComponenet];
                                                         if_weakify(self)
                                                     [(IFRefreshHeaderView *)refreshComponenet setRefreshingBlock:^{
                                                         if_strongify(self)
                                                         [self refreshHeaderAction];
                                                               }];
                                                           }];
    self.refreshContainerView.if_refreshHeader = refreshHeader;
}

- (void)addRefreshFooter {
    if_weakify(self)
    IFRefreshManager *refreshMgr = [IFRefreshManager sharedRefreshManager];
    IFRefreshFooterView *refreshFooter = [refreshMgr refreshFooterForKey:self.refreshFooterKey
                                                     configuration:^(id refreshComponenet) {
                                                         if_strongify(self)
                                                         [self configureRefreshFooter:refreshComponenet];
                                                         if_weakify(self)
                                                     [(IFRefreshFooterView *)refreshComponenet setRefreshingBlock:^{
                                                         if_strongify(self)
                                                         [self refreshFooterAction];
                                                               }];
                                                           }];
    self.refreshContainerView.if_refreshFooter = refreshFooter;
}

- (void)configureEmptyDataViews {
    if (self.supportEmptyDataView) {
        self.refreshContainerView.emptyDataSetSource   = self;
        self.refreshContainerView.emptyDataSetDelegate = self;
    }
}

#pragma mark - Public Methods

- (void)configureRefreshHeader:(IFRefreshHeaderView *)refreshHeader {}
- (void)configureRefreshFooter:(IFRefreshFooterView *)refreshFooter {}
- (void)refreshHeaderAction {}
- (void)refreshFooterAction {}

- (void)showRefreshHeader:(BOOL)shouldShow {
    if (self.refreshType == IFRefreshTypeHeader || self.refreshType == IFRefreshTypeHeaderAndFooter) {
        self.refreshContainerView.if_refreshHeader.hidden = !shouldShow;
    }
}

- (void)showRefreshFooter:(BOOL)shouldShow {
    if (self.refreshType == IFRefreshTypeFooter || self.refreshType == IFRefreshTypeHeaderAndFooter) {
        self.refreshContainerView.if_refreshFooter.hidden = !shouldShow;
    }
}

- (void)beginRefreshHeader {
    [self.refreshContainerView.if_refreshHeader beginRefreshing];
}

- (void)beginRefreshFooter {
    [self.refreshContainerView.if_refreshFooter beginRefreshing];
}

- (void)endRefreshHeader {
    [self.refreshContainerView.if_refreshHeader endRefreshing];
}

- (void)endRefreshFooter {
    [self.refreshContainerView.if_refreshFooter endRefreshing];
}

#pragma mark - Getters and Setters

- (UIScrollView *)refreshContainerView {
    if (!_refreshContainerView) {
        _refreshContainerView = [[UIScrollView alloc] init];
        _refreshContainerView.showsVerticalScrollIndicator = NO;
        _refreshContainerView.showsHorizontalScrollIndicator = NO;
    }
    return _refreshContainerView;
}

@end
