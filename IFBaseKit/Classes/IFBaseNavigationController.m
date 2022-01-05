//
//  IFBaseNavigationController.m
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import "IFBaseNavigationController.h"

@interface IFBaseNavigationController ()

@end

@implementation IFBaseNavigationController

#pragma mark - Private Methods

- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}


@end
