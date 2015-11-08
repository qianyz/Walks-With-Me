//
//  RecController.m
//  跟我走
//
//  Created by mac on 15/10/29.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "RecController.h"
#import "RecCollectionView.h"
#import "DataService.h"
#import "RecModel.h"
#import "UIImageView+WebCache.h"
@interface RecController ()
{
    RecCollectionView *_recCV;
    NSMutableArray *_tabArray;
    NSMutableArray *btnArray;
    NSInteger j;

}
@end

@implementation RecController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tabArray = [[NSMutableArray alloc]init];
    [_tabArray addObject:@"1"];
    [_tabArray addObject:@"1"];
    [_tabArray addObject:@"1"];
    [_tabArray addObject:@"1"];
//    _tabArray = @[@"1",@"1",@"1",@"1"];
    [self _createView];
    [self _loadData];

    
}

- (void)_createView
{
    btnArray = [[NSMutableArray alloc]initWithCapacity:4];

    NSArray *btnUnImage = @[@"1",
                            @"2",
                            @"3",
                            @"4"];
    
    NSArray *btnImage = @[@"1L",
                          @"2L",
                          @"3L",
                          @"4L"];
    CGFloat width = KScreenWidth/5;
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, 50)];
    
    for (int i = 0; i<4; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*(width+10)+20, 0, 50, 50 )];
        [btn setBackgroundImage:[UIImage imageNamed:btnUnImage[i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:btnImage[i]] forState:UIControlStateSelected];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [topView addSubview:btn];
        [btnArray addObject:btn];

    }
    topView.backgroundColor = [UIColor whiteColor];
    
    j = 0;
    UIButton *btn = btnArray[j];
    btn.selected = YES;
    
    
    [self.view addSubview:topView];
    
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(KScreenWidth-20, 150);
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    _recCV = [[RecCollectionView alloc]initWithFrame:CGRectMake(0, 64+50, KScreenWidth, KScreenHeight-64-50) collectionViewLayout:layout];
    _recCV.backgroundColor = [UIColor colorWithWhite:.9 alpha:1];
    [self.view addSubview:_recCV];
 
}

- (void)_loadData
{
    [self showHUD:@"正在加载..."];
    NSString *str1 = @"http://m.tuniu.com/api/home/product/list/c/%7B%22v%22%3A%227.0.4%22%2C%22ct%22%3A20%2C%22dt%22%3A1%2C%22p%22%3A10718%2C%22cc%22%3A3402%7D/d/%7B%22currentPage%22%3A1%2C%22pageLimit%22%3A10%2C%22typeIndex%22%3A1%2C%22width%22%3A1080%7D";
    
    
    [DataService requestUrl:str1 httpMethod:@"GET" block:^(id result) {
        NSLog(@"----------------%@",result);
        NSMutableArray *mArray = [[NSMutableArray alloc]init];

        NSDictionary *dic = result[@"data"];
        NSArray *array = [[NSArray alloc]init];
        array = [dic objectForKey:@"products"];
        for (NSDictionary *dic2 in array) {
            RecModel *model = [[RecModel alloc]initWithDataDic:dic2];
            [mArray addObject:model];
        }
        
        _recCV.array = mArray;
        [_recCV reloadData];
        [_tabArray replaceObjectAtIndex:0 withObject:mArray];
        [self completeHUD:@"加载完成"];
        
    }];
    
    
    NSString *str2 = @"http://m.tuniu.com/api/home/product/list/c/%7B%22v%22%3A%227.0.4%22%2C%22ct%22%3A20%2C%22dt%22%3A1%2C%22p%22%3A10718%2C%22cc%22%3A3402%7D/d/%7B%22currentPage%22%3A1%2C%22pageLimit%22%3A10%2C%22typeIndex%22%3A2%2C%22width%22%3A1080%7D";
    [DataService requestUrl:str2 httpMethod:@"GET" block:^(id result) {
        NSLog(@"----------------%@",result);
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        
        NSDictionary *dic = result[@"data"];
        NSArray *array = [[NSArray alloc]init];
        array = [dic objectForKey:@"products"];
        for (NSDictionary *dic2 in array) {
            RecModel *model = [[RecModel alloc]initWithDataDic:dic2];
            [mArray addObject:model];
        }
        [_tabArray replaceObjectAtIndex:1 withObject:mArray];
        
    }];

    NSString *str3 = @"http://m.tuniu.com/api/home/product/list/c/%7B%22v%22%3A%227.0.4%22%2C%22ct%22%3A20%2C%22dt%22%3A1%2C%22p%22%3A10718%2C%22cc%22%3A3402%7D/d/%7B%22currentPage%22%3A1%2C%22pageLimit%22%3A10%2C%22typeIndex%22%3A3%2C%22width%22%3A1080%7D";
    [DataService requestUrl:str3 httpMethod:@"GET" block:^(id result) {
        NSLog(@"----------------%@",result);
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        
        NSDictionary *dic = result[@"data"];
        NSArray *array = [[NSArray alloc]init];
        array = [dic objectForKey:@"products"];
        for (NSDictionary *dic2 in array) {
            RecModel *model = [[RecModel alloc]initWithDataDic:dic2];
            [mArray addObject:model];
        }
        [_tabArray replaceObjectAtIndex:2 withObject:mArray];
        
    }];
    NSString *str4 = @"http://m.tuniu.com/api/home/product/list/c/%7B%22v%22%3A%227.0.4%22%2C%22ct%22%3A20%2C%22dt%22%3A1%2C%22p%22%3A10718%2C%22cc%22%3A3402%7D/d/%7B%22currentPage%22%3A1%2C%22pageLimit%22%3A10%2C%22typeIndex%22%3A4%2C%22width%22%3A1080%7D";
    [DataService requestUrl:str4 httpMethod:@"GET" block:^(id result) {
        NSLog(@"----------------%@",result);
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        
        NSDictionary *dic = result[@"data"];
        NSArray *array = [[NSArray alloc]init];
        array = [dic objectForKey:@"products"];
        for (NSDictionary *dic2 in array) {
            RecModel *model = [[RecModel alloc]initWithDataDic:dic2];
            [mArray addObject:model];
        }
        [_tabArray replaceObjectAtIndex:3 withObject:mArray];
        
    }];

}

- (void)btnAction:(UIButton *)sender
{
    sender.selected = YES;
    if (j !=sender.tag) {
        
        UIButton *btn =  btnArray[j];
        btn.selected = NO;
        
        j = sender.tag;
    }
    NSLog(@"%li",sender.tag);
    NSArray *array = _tabArray[sender.tag];
    _recCV.array = array;
    [_recCV reloadData];
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
