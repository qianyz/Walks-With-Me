//
//  TicketOneCollectionView.m
//  跟我走
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "TicketOneCollectionView.h"
#import "TicketModel.h"
@interface TicketOneCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    TicketModel *model;
}
@end

@implementation TicketOneCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _array.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    model = _array[indexPath.item];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    label.text = model.CityName;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    [cell.contentView addSubview:label];
    cell.layer.borderWidth = 1;
    cell.layer.borderColor = [UIColor grayColor].CGColor;
    cell.layer.cornerRadius = 10;
    return cell;
    
    
    
}

@end
