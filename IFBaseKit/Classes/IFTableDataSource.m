//
//  IFTableDataSource.m
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import "IFTableDataSource.h"

@interface IFTableDataSource ()
@property (nonatomic, strong) NSMutableArray      *sectionDatas;
@property (nonatomic, strong) NSMutableDictionary *cellDatas;

@end

@implementation IFTableDataSource

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger sectionAmount = [self.sectionDatas count];
    if (sectionAmount < 1) {
        sectionAmount = 1;
    }
    return sectionAmount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self cellDatasInSection:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:[self reusedIdentifierAtIndexPath:indexPath]
                                                             forIndexPath:indexPath];
    [self configureCell:aCell withObject:[self itemAtIndexPath:indexPath]];
    return aCell;
}

#pragma mark - Private Methods

- (NSMutableArray *)cellDatasInSection:(NSInteger)section {
    return self.cellDatas[@(section)];
}

#pragma mark - Public Methods

- (void)resetSectionDatas:(NSArray *)sectionDatas {
    self.sectionDatas = [NSMutableArray arrayWithArray:sectionDatas];
}

- (void)resetCellDatas:(NSArray *)cellDatas inSection:(NSInteger)section {
    if (cellDatas) {
        [self.cellDatas setObject:[NSMutableArray arrayWithArray:cellDatas] forKey:@(section)];
    } else {
        [self.cellDatas removeObjectForKey:@(section)];
    }
}

- (id)itemInSection:(NSInteger)section {
    NSInteger sectionCount = [self.sectionDatas count];
    if (section >= 0 && section < sectionCount) {
        return self.sectionDatas[section];
    }
    return nil;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *items = [self cellDatasInSection:indexPath.section];
    if (indexPath.row >= 0 && indexPath.row < [items count]) {
        return items[indexPath.row];
    }
    return nil;
}

- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *items = [self cellDatasInSection:indexPath.section];
    if (indexPath.row >= 0 && indexPath.row < [items count]) {
        [items removeObjectAtIndex:indexPath.row];
    }
}

- (void)insertItem:(id)aObject atIndexPath:(NSIndexPath *)indexPath {
    if (aObject) {
        NSMutableArray *items = [self cellDatasInSection:indexPath.section];
        if (!items) {
            items = [NSMutableArray arrayWithObjects:aObject, nil];
            [self resetCellDatas:items inSection:indexPath.section];
        }
        [items insertObject:aObject atIndex:indexPath.row];
    }
}

- (NSString *)reusedIdentifierAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)configureCell:(UITableViewCell *)cell withObject:(id)cellObject {}

#pragma mark - Getters and Setters

- (NSMutableArray *)sectionDatas {
    if (!_sectionDatas) {
        _sectionDatas = [[NSMutableArray alloc] init];
    }
    return _sectionDatas;
}

- (NSMutableDictionary *)cellDatas {
    if (!_cellDatas) {
        _cellDatas = [[NSMutableDictionary alloc] init];
    }
    return _cellDatas;
}

@end
