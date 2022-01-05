//
//  IFTabbarController.m
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import "IFTabbarController.h"

@interface IFTabbarController ()

@end

@implementation IFTabbarController

#pragma mark - Private Methods

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}

@end
