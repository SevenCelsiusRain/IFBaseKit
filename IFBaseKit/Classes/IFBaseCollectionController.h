//
//  IFBaseCollectionController.h
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import "IFRefreshController.h"

NS_ASSUME_NONNULL_BEGIN
@interface IFBaseCollectionController : IFRefreshController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong, readonly) UICollectionView *collectionView;

- (void)configureCollectionView;

@end

NS_ASSUME_NONNULL_END
