//
//  FilterBar.m
//  滤镜分屏特效
//
//  Created by 图图 on 2020/8/11.
//  Copyright © 2020 图图. All rights reserved.
//

#import "FilterBar.h"
#import "CollectionViewCell.h"

static NSString * const kCellID = @"CollectionViewCellId";

@interface FilterBar()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)UICollectionViewFlowLayout *collectionViewLayout;

@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation FilterBar

-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self createCollection];
    }
    return self;
}
- (void)createCollection{
    self.dataSource = [NSArray array];
    self.collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];

    self.collectionViewLayout.minimumLineSpacing = 0;
    self.collectionViewLayout.minimumInteritemSpacing = 0;

    CGFloat itemW = 100;
    CGFloat itemH = CGRectGetHeight(self.frame);
    self.collectionViewLayout.itemSize = CGSizeMake(itemW, itemH);
    
    self.collectionViewLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:[self bounds] collectionViewLayout:_collectionViewLayout];
    [self addSubview:_collectionView];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:kCellID];
}
- (void)selectIndex:(NSIndexPath *)indexPath {
    
    _currentIndex = indexPath.row;
    [_collectionView reloadData];
    
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectBar:didScrollToIndex:)]) {
        [self.delegate selectBar:self didScrollToIndex:indexPath.row];
    }
}
#pragma mark - setter
-(void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    [self.collectionView reloadData];
}
#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    cell.title = self.dataSource[indexPath.row];
    cell.isSelect = indexPath.row == _currentIndex;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self selectIndex:indexPath];
}
@end
