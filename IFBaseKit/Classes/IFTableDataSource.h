//
//  IFTableDataSource.h
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IFTableDataSource : NSObject<UITableViewDelegate, UITableViewDataSource>

- (void)resetSectionDatas:(NSArray *)sectionDatas;
- (void)resetCellDatas:(NSArray *)cellDatas inSection:(NSInteger)section;

- (id)itemInSection:(NSInteger)section;
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)insertItem:(id)aObject atIndexPath:(NSIndexPath *)indexPath;

- (NSString *)reusedIdentifierAtIndexPath:(NSIndexPath *)indexPath;
- (void)configureCell:(UITableViewCell *)cell withObject:(id)cellObject;

@end

NS_ASSUME_NONNULL_END
