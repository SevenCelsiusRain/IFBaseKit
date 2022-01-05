//
//  IFRefreshManager.m
//  IFBaseKit
//
//  Created by MrGLZh on 2022/1/5.
//

#import "IFRefreshManager.h"

@interface IFRefreshManager ()
@property (nonatomic, strong) Class defaultHeaderClass;
@property (nonatomic, strong) Class defaultFooterClass;

@property (nonatomic, strong) NSMutableDictionary *cachedHeaders;
@property (nonatomic, strong) NSMutableDictionary *cachedFooters;
@end

@implementation IFRefreshManager

+ (IFRefreshManager *)sharedRefreshManager {
    static IFRefreshManager *_sharedRefreshManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedRefreshManager = [[IFRefreshManager alloc] init];
    });
    return _sharedRefreshManager;
}


#pragma mark - Private Methods

- (void)cacheRefreshClass:(Class)refreshClass forKey:(NSString *)key isHeader:(BOOL)isHeader {
    if (key.length > 0) {
        NSMutableDictionary *cachedDict = nil;
        if (isHeader) {
            cachedDict = self.cachedHeaders;
        } else {
            cachedDict = self.cachedFooters;
        }
        
        if (refreshClass) {
            cachedDict[key] = refreshClass;
        } else {
            [cachedDict removeObjectForKey:key];
        }
    }
}

- (id)refreshObjectForClass:(Class)refreshClass configuration:(IFRefreshConfigurationBlock)configuration {
    id refreshObject = [[refreshClass alloc] init];
    return [self refreshObject:refreshObject configuration:configuration];
}

- (id)refreshObjectForKey:(NSString *)key
                 isHeader:(BOOL)isHeader
            configuration:(IFRefreshConfigurationBlock)configuration {
    
    id refreshObject   = nil;
    Class refreshClass = [self refreshClassForKey:key isHeader:isHeader];
    
//    if (key.length > 0) {
//        NSMutableDictionary *cachedDict = nil;
//        cachedDict = isHeader ? self.cachedHeaders : self.cachedFooters;
//        refreshClass = cachedDict[key];
//    }
//
//    if (!refreshClass) {
//        if (isHeader) {
//            NSAssert(self.defaultHeaderClass, @"必须注册默认的defaultHeaderClass");
//            refreshClass = self.defaultHeaderClass;
//        } else {
//            NSAssert(self.defaultFooterClass, @"必须注册默认的defaultFooterClass");
//            refreshClass = self.defaultFooterClass;
//        }
//    }
    
    refreshObject = [[refreshClass alloc] init];
    return [self refreshObject:refreshObject configuration:configuration];
}

- (Class)refreshClassForKey:(NSString *)key isHeader:(BOOL)isHeader {
    Class refreshClass = nil;
    if (key.length > 0) {
        NSMutableDictionary *cachedDict = nil;
        cachedDict = isHeader ? self.cachedHeaders : self.cachedFooters;
        refreshClass = cachedDict[key];
    }
    
    if (!refreshClass) {
        refreshClass = isHeader ? self.defaultHeaderClass : self.defaultFooterClass;
    }
    
    return refreshClass;
}

- (id)refreshObject:(id)refreshObject configuration:(IFRefreshConfigurationBlock)configuration {
    if (configuration != NULL) {
        configuration(refreshObject);
    }
    return refreshObject;
}

#pragma mark - Public Methods

- (void)registerDefaultRefreshHeader:(Class)refreshHeaderClass {
    self.defaultHeaderClass = refreshHeaderClass;
}

- (void)registerDefaultRefreshFooter:(Class)refreshFooterClass {
    self.defaultFooterClass = refreshFooterClass;
}

- (void)registerRefreshHeader:(Class)refreshHeaderClass forKey:(NSString *)key {
    [self cacheRefreshClass:refreshHeaderClass forKey:key isHeader:YES];
}

- (void)registerRefreshFooter:(Class)refreshFooterClass forKey:(NSString *)key {
    [self cacheRefreshClass:refreshFooterClass forKey:key isHeader:NO];
}

- (IFRefreshHeaderView *)defaultRefreshHeader:(IFRefreshConfigurationBlock)configuration {
    return [self refreshObjectForClass:self.defaultHeaderClass configuration:configuration];
}

- (IFRefreshFooterView *)defaultRefreshFooter:(IFRefreshConfigurationBlock)configuration {
    return [self refreshObjectForClass:self.defaultFooterClass configuration:configuration];
}

- (IFRefreshHeaderView *)refreshHeaderForKey:(NSString *)key configuration:(IFRefreshConfigurationBlock)configuration {
    return [self refreshObjectForKey:key isHeader:YES configuration:configuration];
}

- (IFRefreshFooterView *)refreshFooterForKey:(NSString *)key configuration:(IFRefreshConfigurationBlock)configuration {
    return [self refreshObjectForKey:key isHeader:NO configuration:configuration];
}

#pragma mark - Getters and Setters

- (NSMutableDictionary *)cachedHeaders {
    if (!_cachedHeaders) {
        _cachedHeaders = [[NSMutableDictionary alloc] init];
    }
    return _cachedHeaders;
}

- (NSMutableDictionary *)cachedFooters {
    if (!_cachedFooters) {
        _cachedFooters = [[NSMutableDictionary alloc] init];
    }
    return _cachedFooters;
}


@end
