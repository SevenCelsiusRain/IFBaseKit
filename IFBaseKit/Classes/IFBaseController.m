//
//  IFBaseController.m
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import "IFBaseController.h"

@interface IFBaseController (){
    BOOL _if_firstWillAppear;
    BOOL _if_firstDidAppear;
    BOOL _if_sourceHasNavBar;
}

@end

@implementation IFBaseController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _if_firstWillAppear = YES;
        _if_firstDidAppear  = YES;
    }
    return self;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.navigationController) {
        _if_sourceHasNavBar = !self.navigationController.navigationBarHidden;
    }
    [self if_configureBeforeSetupViews];
    [self if_setupViews];
    [self if_configureConstraints];
    [self if_configureAfterSetupViews];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.navigationController) {
        _if_sourceHasNavBar = !self.navigationController.navigationBarHidden;
        
        if (self.if_autoDetectNavBar) {
            BOOL hideNavBarAnimated = [self if_shouldHideNavBarAnimated];
            if ([self if_hasNavBar]) {
                if (!_if_sourceHasNavBar) {
                    [self.navigationController setNavigationBarHidden:NO animated:hideNavBarAnimated];
                }
            } else {
                if (_if_sourceHasNavBar) {
                    [self.navigationController setNavigationBarHidden:YES animated:hideNavBarAnimated];
                }
            }
        }
    }
    
    if (_if_firstWillAppear) {
        _if_firstWillAppear = NO;
        [self if_viewWillAppearForTheFirstTime:animated];
    } else {
        [self if_viewWillAppearForOtherTimes:animated];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (_if_firstDidAppear) {
        _if_firstDidAppear = NO;
        [self if_viewDidAppearForTheFirstTime:animated];
    } else {
        [self if_viewDidAppearForOtherTimes:animated];
    }
}

#pragma mark - Private Methods

- (BOOL)if_shouldHideNavBarAnimated {
    BOOL hideNavBarAnimated = [self if_hideNavBarAnimated];
    UITabBarController *tabController = (UITabBarController *)self.navigationController.topViewController;
    if ([tabController isKindOfClass:[UITabBarController class]]
        && [tabController.viewControllers containsObject:self]
        && tabController.selectedViewController != self) {
        hideNavBarAnimated = NO;
    }
    return hideNavBarAnimated;
}

- (BOOL)if_autoDetectNavBar {
    return YES;
}

- (BOOL)if_hasNavBar {
    return YES;
}

- (BOOL)if_hideNavBarAnimated {
    return YES;
}

#pragma mark - Public Methods

- (void)if_viewWillAppearForTheFirstTime:(BOOL)animated {}
- (void)if_viewWillAppearForOtherTimes:(BOOL)animated {}
- (void)if_viewDidAppearForTheFirstTime:(BOOL)animated {}
- (void)if_viewDidAppearForOtherTimes:(BOOL)animated {}

- (void)if_configureBeforeSetupViews {}
- (void)if_setupViews {}
- (void)if_configureConstraints {}
- (void)if_configureAfterSetupViews {}

@end
