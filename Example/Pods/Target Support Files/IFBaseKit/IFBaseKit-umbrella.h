#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "IFBaseCollectionController.h"
#import "IFBaseController.h"
#import "IFBaseNavigationController.h"
#import "IFControllers.h"
#import "IFRefresh.h"
#import "IFRefreshController.h"
#import "IFRefreshManager.h"
#import "IFTabbarController.h"
#import "IFTableDataSource.h"
#import "IFTableViewController.h"
#import "UIScrollView+IFRefreshAddition.h"

FOUNDATION_EXPORT double IFBaseKitVersionNumber;
FOUNDATION_EXPORT const unsigned char IFBaseKitVersionString[];

