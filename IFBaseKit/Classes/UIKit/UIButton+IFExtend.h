//
//  UIButton+IFExtend.h
//  IFBaseKit
//
//  Created by MrGLZh on 2021/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM (NSUInteger, IFButtonAlignmentStyle) {
    IFButtonAlignmentStyleTop,//图片在上，文字在下
    IFButtonAlignmentStyleLeft,//图片在左，文字在右
    IFButtonAlignmentStyleBottom,//图片在下，文字在上
    IFButtonAlignmentStyleRight//图片在右，文字在左
};

@interface UIButton (IFExtend)

/**
 扩大点击范围
 */
- (void)if_enlargeClickInsets:(UIEdgeInsets)insets;

/**
 设置按钮图片和文字的布局样式和间距
 @param style 布局样式
 @param padding 文字和图片的间距

 */
- (void)if_setButtonAlignmentStyle:(IFButtonAlignmentStyle)style padding:(CGFloat)padding;

/**
 设置背景色
 */
- (void)if_setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
