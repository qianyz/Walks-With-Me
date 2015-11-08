//
//  DiscoverCollectionView.m
//  跟我走
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DiscoverCollectionView.h"
#import "DiscoverCell.h"
#import "DiscoverDetailController.h"
#import "UIView+ViewController.h"
@interface DiscoverCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation DiscoverCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        UINib *nib = [UINib nibWithNibName:@"DiscoverCell" bundle:nil];
        [self registerNib:nib forCellWithReuseIdentifier:@"DCell"];
        
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    DiscoverCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DCell" forIndexPath:indexPath];
    
    cell.layer.borderWidth = 1;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.layer.shadowOffset = CGSizeMake(1, 1);
//    cell.backgroundColor = [UIColor redColor];
    cell.model = _array[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DiscoverDetailController *discDC = [[DiscoverDetailController alloc]init];
//    discDC.hidesBottomBarWhenPushed = YES;
    discDC.model = _array[indexPath.item];
    [self.viewController.navigationController pushViewController:discDC animated:YES];
    
}

@end
