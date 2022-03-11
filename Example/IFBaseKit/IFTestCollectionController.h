//
//  IFTestCollectionController.h
//  IFBaseKit_Example
//
//  Created by MrGLZh on 2022/3/11.
//  Copyright © 2022 张高磊. All rights reserved.
//

#import <IFBaseKit/IFBaseKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, IFTestRefreshType) {
    IFTestRefreshTypeCommon,
    IFTestRefreshTypeGif,
};

@interface IFTestCollectionController : IFBaseCollectionController

- (void)setRefreshHeaderAndFooterType:(IFTestRefreshType)type;

@end

NS_ASSUME_NONNULL_END
