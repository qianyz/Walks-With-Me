//
//  TicketController.m
//  跟我走
//
//  Created by mac on 15/10/24.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "TicketController.h"
#import "DataService.h"
#import "TicketModel.h"
#import "TicketOneCollectionView.h"
#import "TicketTwoCollectionView.h"
#import "DataXMLService.h"
#import "TicketTwoModel.h"

@interface TicketController ()
{
    NSNumber *_num;
    TicketOneCollectionView *ticketOneView;
    TicketTwoCollectionView *ticketTwoView;
    
}
@end

@implementation TicketController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"门票";

    [self _createViews];
    [self _loadData];
    // Do any additional setup after loading the view.
}

- (void)_createViews
{
    _mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 104, 120, 120)];
    [self.view addSubview:_mapView];
    
    
    UICollectionViewFlowLayout *layout1 =[[UICollectionViewFlowLayout alloc]init];
    layout1.itemSize = CGSizeMake(50, 30);
    layout1.minimumLineSpacing = 10;
    layout1.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout1.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    ticketOneView = [[TicketOneCollectionView alloc]initWithFrame:CGRectMake(130, 40+64, KScreenWidth-130 ,130+64 ) collectionViewLayout:layout1];
    ticketOneView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:ticketOneView];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, 40)];
    UIImageView *imageView= [[UIImageView alloc]initWithFrame:CGRectMake(3,2, KScreenWidth-6, 35)];
    imageView.image = [UIImage imageNamed:@"imgHolidaySearchBarBack.png"];
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:view.bounds];
    imageView2.image = [UIImage imageNamed:@"hotelBookingTextFeildBG.png"];
    [imageView2 addSubview:imageView];
    
    UITextField *textF = [[UITextField alloc]initWithFrame:CGRectMake(50, 0, imageView.width-50, 35)];
    textF.placeholder = @"请输入景点名、城市名...";
    [imageView addSubview:textF];
    [view addSubview:imageView2];
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth/2-75, 230, 150, 40)];
    label.text = @"全国热门景区";
    label.textColor = [UIColor darkGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:18 weight:2];
    [self.view addSubview:label];

    
    UICollectionViewFlowLayout *layout2 =[[UICollectionViewFlowLayout alloc]init];
    layout2.itemSize = CGSizeMake(90, 90);
    layout2.minimumLineSpacing = 10;
    layout2.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout2.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    ticketTwoView = [[TicketTwoCollectionView alloc]initWithFrame:CGRectMake(0, 200+64, KScreenWidth ,KScreenHeight-200-64 ) collectionViewLayout:layout2];
    ticketTwoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:ticketTwoView];
    
}

- (void)_loadData
{
    [self showHUD:@"正在加载..."];
    
    
    NSString *str =@"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><RequestServiceData xmlns=\"http://tempuri.org/\"><requestMessage>{\"RCode\":\"fengjing@#*!2014\",\"ClientType\":0,\"Module\":\"scenic\",\"Method\":\"GetTicketHome\",\"Data\":\"杭州\"}</requestMessage></RequestServiceData></soap:Body></soap:Envelope>";
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    NSMutableArray *mArray2 = [[NSMutableArray alloc]init];

    [DataXMLService requestUrl:str block:^(id result) {
                NSLog(@"-------------%@",result);
        NSArray *array1 = [[NSArray alloc]init];
        NSArray *array2 = [[NSArray alloc]init];

        NSDictionary *dic = [result objectForKey:@"Data"];
        array1 = [dic objectForKey:@"hotcitylist"];
        array2 = [dic objectForKey:@"hotsceniclist"];

        for (NSDictionary *dic1 in array1) {
            TicketModel *model = [[TicketModel alloc]initWithDataDic:dic1];
            [mArray addObject:model];
            
        }
        for (NSDictionary *dic2 in array2) {
            TicketTwoModel *model = [[TicketTwoModel alloc]initWithDataDic:dic2];
            [mArray2 addObject:model];
            
        }
        ticketOneView.array = mArray;
        ticketTwoView.array = mArray2;

        [ticketOneView reloadData];
        [ticketTwoView reloadData];

        [self completeHUD:@"加载完成"];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
