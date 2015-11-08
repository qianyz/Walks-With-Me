//
//  BaseViewController.m
//  My微博
//
//  Created by mac on 15/10/8.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setNavItem];
}

- (void)setNavItem
{
    
    //左边按钮
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, 0, 30, 30);
    [btn1 setImage:[UIImage imageNamed:@"imgHomePhone.png"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    
    //右边按钮
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 0, 30, 30);

    [btn2 addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setImage:[UIImage imageNamed:@"imgScanning.png"] forState:UIControlStateNormal];
   

    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftAction
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"是否要拨打客服电话？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    
    [alert show];
}

- (void)rightAction
{
    
}

//第三方 MBProgressHUD

- (void)showHUD:(NSString *)title
{
    if (_hud == nil) {
        _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    [_hud show:YES];
    _hud.labelText = title;
    
    _hud.dimBackground = YES;
    
}

- (void)hideHUD
{
    [_hud hide:YES];
    
}

- (void)completeHUD:(NSString *)title
{
    _hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    
    _hud.mode = MBProgressHUDModeCustomView;
    
    _hud.labelText = title;
    
    //持续1.5隐藏
    [_hud hide:YES afterDelay:1.5];
    
}

@end
