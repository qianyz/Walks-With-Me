//
//  DetailViewController.h
//  跟我走
//
//  Created by mac on 15/10/23.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface DetailViewController : UITableViewController

@property(nonatomic,strong)NSArray *homeArray;
@property(nonatomic,strong)HomeModel *model;

@end
