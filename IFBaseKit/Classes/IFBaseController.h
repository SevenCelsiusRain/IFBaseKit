//
//  IFBaseController.h
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 1. 支持自动监测导航栏的显示和隐藏
 2. 细化ViewController的生命周期
 
    -> viewDidLoad （从上到下依次执行）
        - if_configureBeforeSetupViews 前置行为操作，例如一些属性的设置
        - if_setupViews 初始化视图信息
        - if_configureConstraints 设置约束条件
        - if_configureAfterSetupViews 其他行为操作
 
    -> viewWillAppear （二选一）
        - if_viewWillAppearForTheFirstTime: 仅第一次执行
        - if_viewWillAppearForOtherTimes:
 
    -> viewDidAppear （二选一）
        - if_viewDidAppearForTheFirstTime: 仅第一次执行
        - if_viewDidAppearForOtherTimes:
 */

@interface IFBaseController : UIViewController

/**
 默认YES, 是否要自动监听导航栏的状态
 */
@property (nonatomic, assign, readonly) BOOL if_autoDetectNavBar;

/**
 默认YES，设置当前VC是否有导航栏
 */
@property (nonatomic, assign, readonly) BOOL if_hasNavBar;

/**
 默认YES，显示和隐藏导航栏是是否要用动画
 */
@property (nonatomic, assign, readonly) BOOL if_hideNavBarAnimated;


#pragma mark - 细化VC生命周期

- (void)if_viewWillAppearForTheFirstTime:(BOOL)animated;
- (void)if_viewWillAppearForOtherTimes:(BOOL)animated;
- (void)if_viewDidAppearForTheFirstTime:(BOOL)animated;
- (void)if_viewDidAppearForOtherTimes:(BOOL)animated;

- (void)if_configureBeforeSetupViews;
- (void)if_setupViews;
- (void)if_configureConstraints;
- (void)if_configureAfterSetupViews;

@end

NS_ASSUME_NONNULL_END
