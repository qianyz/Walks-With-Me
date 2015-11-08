//
//  BaseViewController.h
//  My微博
//
//  Created by mac on 15/10/8.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface BaseViewController : UIViewController
{
    MBProgressHUD *_hud;

}

- (void)setNavItem;

//第三方 MBProgressHUD

- (void)showHUD:(NSString *)title;
- (void)hideHUD;
- (void)completeHUD:(NSString *)title;

@end
