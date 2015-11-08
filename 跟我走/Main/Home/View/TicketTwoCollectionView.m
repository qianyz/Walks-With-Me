//
//  TicketTwoCollectionView.m
//  跟我走
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "TicketTwoCollectionView.h"
#import "TicketTwoModel.h"
#import "UIImageView+WebCache.h"
#import "UIView+ViewController.h"
#import "DiscoverModel.h"
#import "DataXMLService.h"
#import "DiscoverDetailController.h"

@interface TicketTwoCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    TicketTwoModel *model;
}
@end

@implementation TicketTwoCollectionView

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
    
    UIImageView *imageView= [[UIImageView alloc]initWithFrame:cell.bounds];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:model.ImageUrl] placeholderImage:[UIImage imageNamed:@"bgnodata.png"]];
    [cell.contentView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, cell.size.height-20, cell.size.width, 20)];
    label.backgroundColor = [UIColor colorWithRed:1/255.0 green:1/255.0 blue:1/255.0 alpha:0.6];
    label.text = model.Title;
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor whiteColor];
    [cell.contentView addSubview:label];
    return cell;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    DiscoverDetailController *discDC = [[DiscoverDetailController alloc]init];
    
    model = _array[indexPath.item];
    NSString  *indexArray = model.ScSpId;
    
    NSString *string = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><RequestServiceData xmlns=\"http://tempuri.org/\"><requestMessage>{\"RCode\":\"fengjing@#*!2014\",\"ClientType\":0,\"Module\":\"scenic\",\"Method\":\"getscenicofsingle\",\"Data\":{\"scenicId\":\"%@\",\"comments\":\"5\",\"CommentType\":\"1\",\"userId\":\"\"}}</requestMessage></RequestServiceData></soap:Body></soap:Envelope>",indexArray];
    DiscoverDetailController *discDC = [[DiscoverDetailController alloc]init];
    [DataXMLService requestUrl:string block:^(id result) {
        
        NSDictionary *data = result[@"Data"];
//        NSLog(@"=======================%@",data);
        
        DiscoverModel *discoverModel = [[DiscoverModel alloc]initWithDataDic:data];
        discDC.model = discoverModel;
        
    }];
    [self.viewController.navigationController pushViewController:discDC animated:YES];
    
}

@end
