//
//  HolidayDetailViewController.h
//  跟我走
//
//  Created by mac on 15/10/31.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HolidayModel.h"
@interface HolidayDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)HolidayModel *model;
@property(nonatomic,copy)UITableView *tableView;
@end
