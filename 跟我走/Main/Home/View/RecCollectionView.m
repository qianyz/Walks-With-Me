//
//  RecCollectionView.m
//  跟我走
//
//  Created by mac on 15/10/29.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "RecCollectionView.h"
#import "RecCell.h"
@implementation RecCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        
        UINib *nib = [UINib nibWithNibName:@"RecCell" bundle:nil];
        [self registerNib:nib forCellWithReuseIdentifier:@"cell"];
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RecCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = _array[indexPath.item];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

@end
