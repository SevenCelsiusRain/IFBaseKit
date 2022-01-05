//
//  UIScrollView+IFRefreshAddition.h
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

@class MJRefreshHeader, MJRefreshFooter;

typedef MJRefreshHeader IFRefreshHeaderView;
typedef MJRefreshFooter IFRefreshFooterView;
NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (IFRefreshAddition)
@property (nonatomic, strong) IFRefreshHeaderView *if_refreshHeader;
@property (nonatomic, strong) IFRefreshFooterView *if_refreshFooter;

@end

NS_ASSUME_NONNULL_END
