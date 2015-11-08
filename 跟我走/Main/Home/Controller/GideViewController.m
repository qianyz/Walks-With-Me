//
//  GideViewController.m
//  跟我走
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "GideViewController.h"
#import "GideTableView.h"
#import "DataXMLService.h"
#import "GideModel.h"
#import "DataService.h"
#import "GideCollectionView.h"
@interface GideViewController ()
{
    GideTableView *_gideTableView;
    GideCollectionView *_gideCV;
    
}
@end

@implementation GideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"主题游";
    [self _createView2];
    
    [self _loadData2];
    
}

- (void)_createView
{
    _gideTableView = [[GideTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:_gideTableView];
    
}

- (void)_createView2
{
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(90, 150);
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    _gideCV = [[GideCollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _gideCV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_gideCV];

}

- (void)_loadData2
{
    [self showHUD:@"正在加载..."];
    NSString *str = @"http://mapi.mafengwo.cn/travelguide/discovery/topics?o_lat=30.326142&oauth_version=1.0&oauth_nonce=c55ea36a-f814-4465-8201-7cab0f681929&oauth_consumer_key=5&screen_scale=3.0&device_type=android&hardware_model=MI+3&mfwsdk_ver=20140507&screen_width=1080&device_id=68%3Adf%3Add%3A91%3Af1%3A7b&sys_ver=4.4.4&channel_id=WanDouJia&id=1141&oauth_signature=V%2BJnxq2wdrnTxwshuZU6%2FTeDXCI%3D&x_auth_mode=client_auth&o_lng=120.341071&style=squares&start=0&oauth_signature_method=HMAC-SHA1&oauth_token=0_0969044fd4edf59957f4a39bce9200c6&open_udid=68%3Adf%3Add%3A91%3Af1%3A7b&app_ver=6.1.0&app_code=com.mfw.roadbook&oauth_timestamp=1445753135&screen_height=1920";
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];

    [DataService requestUrl:str httpMethod:@"GET" block:^(id result) {
//        NSLog(@"%@",result);
        NSDictionary *dic = result[@"data"];
        NSArray *array = [[NSArray alloc]init];
        array = [dic objectForKey:@"list"];
        for (NSDictionary *dic2 in array) {
            GideModel *model = [[GideModel alloc]initWithDataDic:dic2];
            [mArray addObject:model];
        }
        _gideCV.Array = mArray;
        
        [_gideCV reloadData];

        [self completeHUD:@"加载完成"];

    }];

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
        for (NSDictionary *dic in array) {
            GideModel *model = [[GideModel alloc]initWithDataDic:dic];
            [mArray addObject:model];
        }
        _gideTableView.Array = mArray;
        
        [_gideTableView reloadData];
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
