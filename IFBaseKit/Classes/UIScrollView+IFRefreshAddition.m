//
//  UIScrollView+IFRefreshAddition.m
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import "UIScrollView+IFRefreshAddition.h"

@implementation UIScrollView (IFRefreshAddition)

- (void)setIf_refreshHeader:(IFRefreshHeaderView *)if_refreshHeader {
    self.mj_header = if_refreshHeader;
}

- (IFRefreshHeaderView *)if_refreshHeader {
    return self.mj_header;
}

- (void)setIf_refreshFooter:(IFRefreshFooterView *)if_refreshFooter {
    self.mj_footer = if_refreshFooter;
}

- (IFRefreshFooterView *)if_refreshFooter {
    return self.mj_footer;
}

@end
