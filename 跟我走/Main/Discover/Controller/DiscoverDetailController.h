//
//  DiscoverDetailController.h
//  跟我走
//
//  Created by mac on 15/10/27.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DiscoverModel.h"
@interface DiscoverDetailController : BaseViewController

@property(nonatomic,strong)DiscoverModel *model;
@property(nonatomic,copy)NSString  *indexArray;
@property(nonatomic,strong)UITableView *tableView;

@end
