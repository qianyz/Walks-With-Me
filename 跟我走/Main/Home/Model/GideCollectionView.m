//
//  GideCollectionView.m
//  跟我走
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "GideCollectionView.h"
#import "GideCell.h"
#import "WebController.h"
#import "UIView+ViewController.h"
@interface GideCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation GideCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        UINib *nib = [UINib nibWithNibName:@"GideCell" bundle:nil];
        [self registerNib:nib forCellWithReuseIdentifier:@"gideCell"];
        
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _Array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    GideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"gideCell" forIndexPath:indexPath];

    cell.model = _Array[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    WebController *web = [[WebController alloc]init];
    
    web.hidesBottomBarWhenPushed = YES;
    web.model = _Array[indexPath.row];
    [self.viewController.navigationController pushViewController:web animated:YES];

}

@end
