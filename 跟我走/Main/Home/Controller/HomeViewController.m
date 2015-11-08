//
//  HomeViewController.m
//  跟我走
//
//  Created by mac on 15/10/13.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "HolidayViewController.h"
#import "HomeCollectionView.h"
#import "DataService.h"
#import "HomeModel.h"
#import "TicketController.h"
#import "GideViewController.h"
#import "RecController.h"
@interface HomeViewController ()
{
    HomeCollectionView *_homeCollectionView;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavItem];
    [self _createSubViews];
    [self _loadData];
    
    
}

- (void)_createSubViews
{

    CGFloat width = (KScreenWidth/4);

    NSArray *homeName = @[@"主题",@"推荐",@"游记",@"门票"];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, 35)];
    view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:view];
    for (int i = 0; i<4; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(width*i,0, width,30)];
        button.tag = i;

        [button setTitle:homeName[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor colorWithRed:100/255.0 green:150/255.0 blue:200/255.0 alpha:.8]];
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
    }
    
    
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(KScreenWidth-20, 164);
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    _homeCollectionView = [[HomeCollectionView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-view.height-64-40) collectionViewLayout:layout];
    
    _homeCollectionView.backgroundColor = [UIColor whiteColor];
    _homeCollectionView.top = view.bottom;
    [self.view addSubview:_homeCollectionView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonAction:(UIButton *)button
{
    
    
    if (button.tag == 0) {
        GideViewController *VC = [[GideViewController alloc]init];
        VC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:VC animated:YES];
        NSLog(@"%li",button.tag);
    }else if (button.tag ==1){
        
        RecController *VC = [[RecController alloc]init];
        VC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:VC animated:YES];
        NSLog(@"%li",button.tag);
    }else if (button.tag ==2){
        HolidayViewController *VC = [[HolidayViewController alloc]init];
        VC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:VC animated:YES];
        NSLog(@"%li",button.tag);
    }else{
        TicketController *VC = [[TicketController alloc]init];
        VC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:VC animated:YES];
        NSLog(@"%li",button.tag);
    }
    
}

- (void)_loadData
{
    [self showHUD:@"正在加载..."];
    
    NSString *urlStr = @"http://apis.baidu.com/qunartravel/travellist/travellist";
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setObject:@"%22%22" forKey:@"query"];
    [params setObject:@"1" forKey:@"page"];
    NSString* apikey = @"3e62f4aee7432d5e27ca6b6336a6f901";

    [DataService requestUrl:urlStr httpMethod:@"GET"apiKey:apikey params:params block:^(id result) {
//        NSLog(@"result = %@",result);
        NSDictionary *dic = result[@"data"];
        
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        NSArray *array = [[NSArray alloc]init];
        array = dic[@"books"];
        for (NSDictionary *dic2 in array) {
//            NSLog(@"-------------%@",dic2);
            HomeModel *homeModel = [[HomeModel alloc]initWithDataDic:dic2];
            [mArray addObject:homeModel];
        }
        _homeCollectionView.homeArray = mArray;
        [_homeCollectionView reloadData];
        [self completeHUD:@"加载完成"];

    }];
    
}

@end
