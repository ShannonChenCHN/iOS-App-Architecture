//
//  SCCollectionViewAdapter.m
//  Example
//
//  Created by ShannonChen on 2017/11/17.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCCollectionViewAdapter.h"
#import "SCCollectionViewCell.h"
#import "SCCollectionViewSectionHeaderFooter.h"
#import "UIDevice+SCExtension.h"
#import "MessageInterceptor.h"


/// Generate a string representation of a reusable view class when registering with a UICollectionView.
NS_INLINE NSString *SCReusableViewIdentifier(Class viewClass, NSString * _Nullable nibName, NSString * _Nullable kind) {
    return [NSString stringWithFormat:@"%@%@%@", kind ?: @"", nibName ?: @"", NSStringFromClass(viewClass)];
}

@interface SCCollectionViewAdapter ()

// https://stackoverflow.com/a/13410537
@property (strong, nonatomic) NSMutableDictionary <NSNumber *, UICollectionReusableView *> *sectionHeaderMap;
@property (nonatomic, strong) NSMutableSet<Class> *registeredCellClasses;
@property (nonatomic, strong) NSMutableSet<NSString *> *registeredSupplementaryViewIdentifiers;


@property (strong, nonatomic) MessageInterceptor *delegateInterceptor;

@end

@implementation SCCollectionViewAdapter

- (void)setCollectionView:(UICollectionView *)collectionView {
    _collectionView = collectionView;
    
    collectionView.delegate = (id <UICollectionViewDelegate>)self.delegateInterceptor;
    collectionView.dataSource = self;
}

- (void)setCollectionViewDelegate:(id<UICollectionViewDelegate>)collectionViewDelegate {
    _collectionViewDelegate = collectionViewDelegate;
    
    self.delegateInterceptor.receiver = collectionViewDelegate;
}

#pragma mark - Public
- (SCCollectionViewSectionModel *)collectionView:(UICollectionView *)collectionView viewModelForSection:(NSInteger)section {
    if (self.sectionModels.count > section) {
        return self.sectionModels[section];
    }
    
    return nil;
}

- (SCCollectionViewCellModel *)collectionView:(UICollectionView *)collectionView cellModelForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.sectionModels.count > indexPath.section &&
        self.sectionModels[indexPath.section].cellModels.count > indexPath.row) {
        
        return self.sectionModels[indexPath.section].cellModels[indexPath.row];
    }
    
    return nil;
}

// https://stackoverflow.com/a/13410537
- (UICollectionReusableView *)sectionHeaderForSection:(NSInteger)section {
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0")) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
        return [self.collectionView supplementaryViewForElementKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
    } else {
        return self.sectionHeaderMap[@(section)];
    }
}

#pragma mark -  <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    self.collectionView = collectionView;
    
    [self p_setupCellCountAndSectionCountForModels];
    
    return self.sectionModels.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.sectionModels.count > section) {
        return self.sectionModels[section].cellModels.count;
    }
    return 0;
}

// cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    SCCollectionViewCellModel *cellModel = [self collectionView:collectionView cellModelForItemAtIndexPath:indexPath];
    Class cellClass = cellModel.cellClass;
    
    if (cellClass) {
        
        NSString *identifier = SCReusableViewIdentifier(cellClass, nil, nil);
        if (![self.registeredCellClasses containsObject:cellClass]) {
            [self.registeredCellClasses addObject:cellClass];
            [collectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
        }
        
        UICollectionViewCell <SCCollectionViewCell> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        
        if ([cell conformsToProtocol:@protocol(SCCollectionViewCell)]) {
            cell.cellModel = cellModel;
        }
        
        return cell;
    }
    
    return [[UICollectionViewCell alloc] init];
}

// section header & footer
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    
    SCCollectionViewSectionModel *model = [self collectionView:collectionView viewModelForSection:indexPath.section];
    Class headerClass = model.headerClass;
    Class footerClass = model.footerClass;
    Class viewClass = (kind == UICollectionElementKindSectionHeader) ? headerClass : footerClass;
    
    NSString *identifier = SCReusableViewIdentifier(viewClass, nil, kind);
    if (![self.registeredSupplementaryViewIdentifiers containsObject:identifier]) {
        [self.registeredSupplementaryViewIdentifiers addObject:identifier];
        [collectionView registerClass:viewClass forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
    }
    
    
    if (kind == UICollectionElementKindSectionHeader && headerClass) {
        
        UICollectionReusableView <SCCollectionViewSectionHeaderFooter> *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier forIndexPath:indexPath];
        
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0") == NO) {
            [self.sectionHeaderMap setObject:header forKey:@(indexPath.section)];
        }
        
        if ([header respondsToSelector:@selector(setSectionModel:)]) {
            [header setSectionModel:model];
        }
        
        return header;
        
    } else if (kind == UICollectionElementKindSectionFooter && model.footerClass) {
        
        UICollectionReusableView <SCCollectionViewSectionHeaderFooter> *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier forIndexPath:indexPath];
        if ([footer respondsToSelector:@selector(setSectionModel:)]) {
            [footer setSectionModel:model];
        }
        
        return footer;
    }
    
    return [[UICollectionReusableView alloc] init];
}


#pragma mark - <UICollectionViewDelegateFlowLayout>
// 计算 cell 尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SCCollectionViewCellModel *cellModel = [self collectionView:collectionView cellModelForItemAtIndexPath:indexPath];
    Class cellClass = cellModel.cellClass;
    
    if (cellModel.cellHeight == CGFLOAT_MAX) { // 高度没有缓存
        
        if ([cellClass respondsToSelector:@selector(cellHeightWithModel:)]) {
            cellModel.cellHeight = [cellClass cellHeightWithModel:cellModel];
        } else {
            cellModel.cellHeight = 0.0;
        }
        
    }
    
    if (cellModel.cellWidth == CGFLOAT_MAX) { // 宽度没有缓存
        
        if ([cellClass respondsToSelector:@selector(cellWidthWithModel:)]) {
            cellModel.cellWidth = [cellClass cellWidthWithModel:cellModel];
        } else {
            cellModel.cellWidth = collectionView.bounds.size.width; // 默认跟 collection view  一样宽
        }
    }
    
    return CGSizeMake(cellModel.cellWidth, cellModel.cellHeight);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

// 计算 section header 尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    SCCollectionViewSectionModel *sectionModel = [self collectionView:collectionView viewModelForSection:section];
    
    if (sectionModel.headerHeight != CGFLOAT_MAX) {
        return CGSizeMake(collectionView.bounds.size.width, sectionModel.headerHeight);
    }
    
    return CGSizeZero;
}

// 计算 section footer 尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    SCCollectionViewSectionModel *sectionModel = [self collectionView:collectionView viewModelForSection:section];
    
    if (sectionModel.footerHeight != CGFLOAT_MAX) {
        return CGSizeMake(collectionView.bounds.size.width, sectionModel.footerHeight);
    }
    
    return CGSizeZero;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SCCollectionViewCellModel *cellModel = [self collectionView:collectionView cellModelForItemAtIndexPath:indexPath];
    [cellModel collectionViewDidSelectItem:collectionView];
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0") == NO) {
        [self.sectionHeaderMap removeObjectForKey:@(indexPath.section)];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.collectionViewDelegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.collectionViewDelegate scrollViewDidScroll:scrollView];
    }
}

#pragma mark - Private
- (void)p_setupCellCountAndSectionCountForModels {
    [self.sectionModels enumerateObjectsUsingBlock:^(SCCollectionViewSectionModel * sectionModel, NSUInteger section, BOOL * _Nonnull stop) {
        sectionModel.numberOfSectionsInCollectionView = self.sectionModels.count;
        sectionModel.section = section;
        
        [sectionModel.cellModels enumerateObjectsUsingBlock:^(SCCollectionViewCellModel * cellModel, NSUInteger item, BOOL * _Nonnull stop) {
            cellModel.numberOfItemsInSection = sectionModel.cellModels.count;
            cellModel.indexPath = [NSIndexPath indexPathForItem:item inSection:section];
        }];
        
    }];
    
}

#pragma mark - Getter
- (NSMutableDictionary *)sectionHeaderMap {
    if (_sectionHeaderMap == nil) {
        _sectionHeaderMap = [[NSMutableDictionary alloc] init];
    }
    return _sectionHeaderMap;
}

- (NSMutableSet<Class> *)registeredCellClasses {
    if (_registeredCellClasses == nil) {
        _registeredCellClasses = [[NSMutableSet alloc] init];
    }
    return _registeredCellClasses;
}

- (NSMutableSet<NSString *> *)registeredSupplementaryViewIdentifiers {
    if (_registeredSupplementaryViewIdentifiers == nil) {
        _registeredSupplementaryViewIdentifiers = [[NSMutableSet alloc] init];
    }
    return _registeredSupplementaryViewIdentifiers;
}

- (MessageInterceptor *)delegateInterceptor {
    if (_delegateInterceptor == nil) {
        _delegateInterceptor = [[MessageInterceptor alloc] init];
        _delegateInterceptor.middleMan = self;
        _delegateInterceptor.receiver = self.collectionViewDelegate;
    }
    return _delegateInterceptor;
}


@end
