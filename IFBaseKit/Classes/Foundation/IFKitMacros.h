//
//  IFKitMacros.h
//  IFBaseKit
//
//  Created by MrGLZh on 2021/12/29.
//

#ifndef IFKitMacros_h
#define IFKitMacros_h

#ifndef if_weakify
    #define if_weakify(object) __weak typeof(object) weak##_##object = object;
#endif

#ifndef if_strongify
    #define if_strongify(object) typeof(object) object = weak##_##object;
#endif

#pragma mark - 尺寸相关
/// 屏幕宽度
#define kIFScreenWidth          [[UIScreen mainScreen] bounds].size.width
/// 屏幕高度
#define kIFScreenHeight         [[UIScreen mainScreen] bounds].size.height
/// 分辨率系数
#define kIFScreenScale          [UIScreen mainScreen].scale
/// 状态栏高度
#define kIFStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
/// 导航栏高度
#define kIFNaviBarHeight (44 + kIFStatusBarHeight)

/**
 底部安全高度
 */
#define kIFBtmSafeAreaHeight  (IF_IS_IPHONEX ? 34 : 0)
///底部tabbar高度
#define kIFTabbarHeight (IF_IS_IPHONEX ? 83.0f : 49.0f)


//适配iphoneX系列 X XR XS XS_MAX
#define IF_IS_IPHONEX getIphoneType()
//判断是否为iphoneX系列,安全区域大于0
#define getIphoneType \
^(){ \
if(@available(iOS 11.0, *)) { \
UIWindow *window = [[[UIApplication sharedApplication] delegate] window]; \
if (window.safeAreaInsets.bottom > 0.0) { \
return YES; \
}else{ \
return NO; \
} \
}else{ \
return NO; \
} \
}


#pragma mark - 字体
//定义公共字体
#define IFFontRegular(A) [UIFont fontWithName:@"PingFangTC-Regular" size:A]
#define IFFontMedium(A) [UIFont fontWithName:@"PingFangTC-Medium" size:A]
#define IFFontBold(A) [UIFont fontWithName:@"PingFangTC-Semibold" size:A]

#endif /* IFKitMacros_h */
