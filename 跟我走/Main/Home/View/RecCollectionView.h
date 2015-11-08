//
//  RecCollectionView.h
//  跟我走
//
//  Created by mac on 15/10/29.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,copy)NSArray *array;
@end
