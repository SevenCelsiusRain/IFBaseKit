//
//  IFBaseCollectionController.m
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import "IFBaseCollectionController.h"

@interface IFBaseCollectionController ()

@end

@implementation IFBaseCollectionController

@synthesize refreshContainerView = _refreshContainerView;

#pragma mark - Life Cycle

- (void)if_setupViews {
    [super if_setupViews];
    [self configureCollectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - Public Methods

- (void)configureCollectionView {}

#pragma mark - Getters and Setters

- (UIScrollView *)refreshContainerView {
    if (!_refreshContainerView) {
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                                collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        _refreshContainerView = collectionView;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _refreshContainerView;
}

- (UICollectionView *)collectionView {
    return (UICollectionView *)self.refreshContainerView;
}

@end
