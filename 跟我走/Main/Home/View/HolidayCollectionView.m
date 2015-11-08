//
//  HolidayCollectionView.m
//  跟我走
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HolidayCollectionView.h"
#import "HolidayOneCell.h"
#import "HolidayModel.h"
#import "HolidayDetailViewController.h"
#import "UIView+ViewController.h"
#import "DataXMLService.h"
@interface HolidayCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation HolidayCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        UINib *nib = [UINib nibWithNibName:@"HolidayOneCell" bundle:nil];
        [self registerNib:nib forCellWithReuseIdentifier:@"HCell"];

    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_array.count == 0) {
        return 10;
    }
    return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HolidayOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HCell" forIndexPath:indexPath];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:cell.bounds];
    imageView.image = [UIImage imageNamed:@"imgTableCellWithLine"];
    imageView.contentMode = UIViewContentModeRedraw;
    cell.backgroundView = imageView;
    
    if (_array.count != 0) {
        cell.model = _array[indexPath.row];

        
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    HolidayModel *model = _array[indexPath.item];
    HolidayDetailViewController *holiday = [[HolidayDetailViewController alloc]init];
    NSString *string = [NSString string];
    string = [NSString stringWithFormat:@"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><RequestServiceData xmlns=\"http://tempuri.org/\"><requestMessage>{\"RCode\":\"fengjing@#*!2014\",\"ClientType\":0,\"Module\":\"tongcheng\",\"Method\":\"GetAbroadLineInfo\",\"Data\":{\"lineId\":\"%@\",\"comments\":\"5\"}}</requestMessage></RequestServiceData></soap:Body></soap:Envelope>",model.lineId];
    //网络请求选中的数据
    
   [DataXMLService requestUrl:string block:^(id result) {
       NSDictionary *data = result[@"Data"];

       HolidayModel *homeModel = [[HolidayModel alloc]initWithDataDic:data];
       holiday.model = homeModel;
       
       dispatch_async(dispatch_get_main_queue(), ^{
           [holiday.tableView reloadData];
       });
     
   }];
    
    [self.viewController.navigationController pushViewController:holiday animated:YES];
    
}

@end
