//
//  MainTabBarController.m
//  My微博
//
//  Created by mac on 15/10/8.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "MainTabBarController.h"
@interface MainTabBarController ()
{
    UIImageView *_selectImageView;
    NSInteger j;
    NSMutableArray *btnArray;

}

@end

@implementation MainTabBarController
- (instancetype)init{
    self = [super init];
    if (self) {
        self.selectedIndex = 1;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatSubController];
    [self creatTabBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)creatTabBar
{
    //移除系统的UITabBarButton
    for (UIView *view in self.tabBar.subviews) {
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }

    btnArray = [[NSMutableArray alloc]initWithCapacity:3];
    CGFloat BWidth = KScreenWidth/5;
    NSArray *btnSelImageArray = @[@"ranking_p_p.png",
                                  @"recommend_p_p.png",
                                  @"myqiyi_p_p.png"];
    NSArray *btnImageArray = @[@"ranking_p_n.png",
                               @"recommend_p_n.png",
                               @"myqiyi_p_n.png"];
    for (int i = 0; i<3; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i*(BWidth+40)+20, 0, BWidth, 49)];
        [button setImage:[UIImage imageNamed:btnImageArray[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:btnSelImageArray[i]] forState:UIControlStateSelected];

        button.tag = i;
        [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:button];
        
        [btnArray addObject:button];
    }
    j = 1;
    UIButton *btn = btnArray[j];
    btn.selected = YES;
    
}

- (void)selectAction:(UIButton *)sender
{
    self.selectedIndex = sender.tag;
    sender.selected = YES;
    if (j !=sender.tag) {
    
    UIButton *btn =  btnArray[j];
    btn.selected = NO;
    
    j = sender.tag;
    }
}

- (void)creatSubController
{
    NSArray*storyName =@ [@"Discover",
                          @"Home",
                          @"Profile"];
    NSMutableArray*mArray=[[NSMutableArray alloc]initWithCapacity:3];
    for (int i = 0; i<3; i++) {
        UIStoryboard*story=[UIStoryboard storyboardWithName:storyName[i] bundle:nil];
        BaseNavController*navC=[story instantiateInitialViewController];
        [mArray addObject:navC];
    }
    self.viewControllers=mArray;
    
}

@end
