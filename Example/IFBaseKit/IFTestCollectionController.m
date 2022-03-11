//
//  IFTestCollectionController.m
//  IFBaseKit_Example
//
//  Created by MrGLZh on 2022/3/11.
//  Copyright © 2022 张高磊. All rights reserved.
//
#import <IFKit.h>
#import "IFTestCollectionController.h"

@interface IFTestCollectionController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation IFTestCollectionController


- (void)setRefreshHeaderAndFooterType:(IFTestRefreshType)type {
    if (type == IFTestRefreshTypeGif) {
        [[IFRefreshManager sharedRefreshManager] registerDefaultRefreshFooter:[MJRefreshBackGifFooter class]];
        [[IFRefreshManager sharedRefreshManager] registerDefaultRefreshHeader:[MJRefreshGifHeader class]];
    }else{
        [[IFRefreshManager sharedRefreshManager] registerDefaultRefreshFooter:[MJRefreshBackNormalFooter class]];
        [[IFRefreshManager sharedRefreshManager] registerDefaultRefreshHeader:[MJRefreshNormalHeader class]];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark --------------------------- refreshHeader/refreshFooter ---------------------------

- (NSString *)refreshFooterKey {
    return @"footer";
}

- (NSString *)refreshHeaderKey {
    return @"header";
}

- (void)refreshFooterAction {
    NSLog(@"refreshFooterAction");
    sleep(2);
    [self endRefreshFooter];
}

- (void)refreshHeaderAction {
    NSLog(@"refreshHeaderAction");
    sleep(2);
    [self endRefreshHeader];
}

- (void)configureRefreshHeader:(IFRefreshHeaderView *)refreshHeader {
    if ([refreshHeader isKindOfClass:[MJRefreshGifHeader class]]) {
        MJRefreshGifHeader *gifHeader = (MJRefreshGifHeader *)refreshHeader;
        // 设置普通状态的动画图片
        [gifHeader setImages:@[[UIImage imageNamed:@"refresh_header1"]] duration:0.5 forState:MJRefreshStateIdle];
        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
        [gifHeader setImages:@[[UIImage imageNamed:@"refresh_header2"]] duration:0.5 forState:MJRefreshStatePulling];
        // 设置正在刷新状态的动画图片
        [gifHeader setImages:@[[UIImage imageNamed:@"refresh_header1"],[UIImage imageNamed:@"refresh_header2"]] duration:0.5 forState:MJRefreshStateRefreshing];
        //gifHeader.stateLabel.hidden = YES;
        //gifHeader.lastUpdatedTimeLabel.hidden = YES;
    }
}

- (void)configureRefreshFooter:(IFRefreshFooterView *)refreshFooter {
    NSArray *images = @[[UIImage imageNamed:@"refresh_footer1"],[UIImage imageNamed:@"refresh_footer2"],[UIImage imageNamed:@"refresh_footer3"]];
    if ([refreshFooter isKindOfClass:[MJRefreshBackGifFooter class]]) {
        MJRefreshBackGifFooter *gifFooter= (MJRefreshBackGifFooter *)refreshFooter;
        // 设置普通状态的动画图片
        [gifFooter setImages:images duration:0.8 forState:MJRefreshStateIdle];
        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
        [gifFooter setImages:images duration:0.8 forState:MJRefreshStatePulling];
        // 设置正在刷新状态的动画图片
        [gifFooter setImages:images duration:0.8 forState:MJRefreshStateRefreshing];
        gifFooter.stateLabel.hidden = YES;
    }
}

#pragma mark --------------------------- UICollectionView ---------------------------

- (void)configureCollectionView {
    self.collectionView.frame = CGRectMake(0, self.navigationController.navigationBar.if_bottom, self.view.if_width,
                                           self.view.if_height - self.navigationController.navigationBar.if_bottom);
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"defaultCell"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"defaultCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc] init];
    }
    cell.contentView.backgroundColor = [UIColor yellowColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.if_width, 200);
}

@end
