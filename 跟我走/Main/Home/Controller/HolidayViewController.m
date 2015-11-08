//
//  HolidayViewController.m
//  跟我走
//
//  Created by mac on 15/10/21.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HolidayViewController.h"
#import "DataXMLService.h"
#import "HolidayCollectionView.h"
#import "HolidayModel.h"

@interface HolidayViewController ()
{
    HolidayCollectionView *_holidayCV;
}
@end

@implementation HolidayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createView];
    [self _loadData];
}

- (void)_createView
{
    
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(KScreenWidth, 220);
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
    
    _holidayCV = [[HolidayCollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) collectionViewLayout:layout];
    
    _holidayCV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_holidayCV];

}

- (void)_loadData
{
    [self showHUD:@"正在加载..."];
    
    NSString *str1 =@"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><RequestServiceData xmlns=\"http://tempuri.org/\"><requestMessage>{\"RCode\":\"fengjing@#*!2014\",\"ClientType\":0,\"Module\":\"tongcheng\",\"Method\":\"getabroadlinehot\",\"Data\":{\"PageIndex\":1,\"PageSize\":20,\"RecordCount\":0,\"Orderby\":null,\"QueryDict\":null,\"Query\":[]}}</requestMessage></RequestServiceData></soap:Body></soap:Envelope>";
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    
    [DataXMLService requestUrl:str1 block:^(id result) {
        //        NSLog(@"-------------%@",result);
        NSArray *array = [[NSArray alloc]init];
        array = [result objectForKey:@"Data"];
//        NSDictionary *dic = result[@"Data"];
        for (NSDictionary *dic in array) {
            HolidayModel *model = [[HolidayModel alloc]initWithDataDic:dic];
            [mArray addObject:model];
            
        }
        _holidayCV.array = mArray;
        dispatch_async(dispatch_get_main_queue(), ^{
            [_holidayCV reloadData];
        });
        
        [self completeHUD:@"加载完成"];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
