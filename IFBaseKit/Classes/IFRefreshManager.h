//
//  IFRefreshManager.h
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import <Foundation/Foundation.h>
#import "UIScrollView+IFRefreshAddition.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^IFRefreshConfigurationBlock)(id refreshComponenet);
@interface IFRefreshManager : NSObject

+ (IFRefreshManager *)sharedRefreshManager;

- (void)registerDefaultRefreshHeader:(Class)refreshHeaderClass;
- (void)registerDefaultRefreshFooter:(Class)refreshFooterClass;

- (void)registerRefreshHeader:(Class)refreshHeaderClass forKey:(NSString *)key;
- (void)registerRefreshFooter:(Class)refreshFooterClass forKey:(NSString *)key;

- (IFRefreshHeaderView *)defaultRefreshHeader:(IFRefreshConfigurationBlock)configuration;
- (IFRefreshFooterView *)defaultRefreshFooter:(IFRefreshConfigurationBlock)configuration;

- (IFRefreshHeaderView *)refreshHeaderForKey:(NSString *)key configuration:(IFRefreshConfigurationBlock)configuration;
- (IFRefreshFooterView *)refreshFooterForKey:(NSString *)key configuration:(IFRefreshConfigurationBlock)configuration;

@end

NS_ASSUME_NONNULL_END
