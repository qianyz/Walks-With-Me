//
//  HomeCollectionView.m
//  跟我走
//
//  Created by mac on 15/10/23.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HomeCollectionView.h"
#import "HomeCell.h"
#import "DetailViewController.h"
#import "UIView+ViewController.h"

@interface HomeCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation HomeCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.pagingEnabled = YES;
        self.showsVerticalScrollIndicator = NO;
        [self registerClass:[HomeCell class] forCellWithReuseIdentifier:@"HomeCell"];
    }
    return self;
}

#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _homeArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCell" forIndexPath:indexPath];
    
    UIImageView *bgImageView = [[UIImageView alloc]init];
    UIImage *bgImage = [UIImage imageNamed:@"imgTableCellWithLine@2x.png"];
    bgImageView.image = bgImage;
    cell.backgroundView = bgImageView;
    
    cell.model = _homeArray[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    detailVC.hidesBottomBarWhenPushed = YES;
    detailVC.model = _homeArray[indexPath.row];
    [self.viewController.navigationController pushViewController:detailVC animated:YES];
    
}

@end
