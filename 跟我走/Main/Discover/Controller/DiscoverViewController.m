//
//  DiscoverViewController.m
//  My微博
//
//  Created by mac on 15/10/8.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverCollectionView.h"
#import "DataXMLService.h"
#import "DiscoverModel.h"
@interface DiscoverViewController ()
{
    
    DiscoverCollectionView *_discoverCV;
}
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createView];
    [self _loadData];
}

- (void)_createView
{
    
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(KScreenWidth-20 , 220);
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    _discoverCV = [[DiscoverCollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _discoverCV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_discoverCV];
    
}

- (void)_loadData
{
    [self showHUD:@"正在加载..."];
    
    NSString *str =@"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><RequestServiceData xmlns=\"http://tempuri.org/\"><requestMessage>{\"RCode\":\"fengjing@#*!2014\",\"ClientType\":0,\"Module\":\"scenic\",\"Method\":\"discover\",\"Data\":{\"PageIndex\":1,\"PageSize\":20,\"RecordCount\":0,\"Orderby\":{\"ScenicId\":\"\"},\"QueryDict\":{\"Dist\":\"20\",\"Lat\":\"30.322\",\"Lon\":\"120.347\",\"cityName\":\"杭州\"},\"Query\":[]}}</requestMessage></RequestServiceData></soap:Body></soap:Envelope>";
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    
    [DataXMLService requestUrl:str block:^(id result) {
//        NSLog(@"-------------%@",result);
        NSArray *array = [[NSArray alloc]init];
        array = [result objectForKey:@"Data"];
        NSLog(@"-------------%@",array);

        for (NSDictionary *dic in array) {
            DiscoverModel *model = [[DiscoverModel alloc]initWithDataDic:dic];
            [mArray addObject:model];
            
        }
        _discoverCV.array = mArray;
        
        [_discoverCV reloadData];
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
