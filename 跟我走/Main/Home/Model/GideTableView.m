//
//  GideTableView.m
//  跟我走
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "GideTableView.h"

@interface GideTableView ()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation GideTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _Array.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"forIndexPath:indexPath];
    cell.textLabel.text = @"llllll";
    
    
    return cell;
}

@end
