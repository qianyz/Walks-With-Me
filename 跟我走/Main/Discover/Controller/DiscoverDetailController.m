//
//  DiscoverDetailController.m
//  跟我走
//
//  Created by mac on 15/10/27.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DiscoverDetailController.h"
#import "UIImageView+WebCache.h"
#import "DDetailCell.h"
@interface DiscoverDetailController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DiscoverDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"度假详情";
    
}

- (void)setModel:(DiscoverModel *)model
{
    if (_model != model) {
        _model = model;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        [self _createView];
    }
}

- (void)_createView
{
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, KScreenWidth, 150)];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:_model.voice_Picture]];
    
    _tableView.tableHeaderView = imageView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[DDetailCell class] forCellReuseIdentifier:@"Decell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 &&indexPath.item == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        UIImageView *imageView= [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 59, 59)];
        imageView.image = [UIImage imageNamed:@"imgTicketDetail.png"];
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(75, 5, 200, 20)];
        title.text = _model.SName;
        UILabel *price = [[UILabel alloc]initWithFrame:CGRectMake(75, 45, 200, 20)];
        price.text = [NSString stringWithFormat:@"价格：¥%@",_model.SalePrice ];
        [cell.contentView addSubview:imageView];
        [cell.contentView addSubview:title];
        [cell.contentView addSubview:price];
        
        return cell;
    }else{
    DDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Decell" forIndexPath:indexPath];
    
    cell.model = _model;
        
    return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.item == 0) {
        return 70;
    }
    else{
        CGRect frame = [DDetailCell boundingRect:_model.PriceNotes];
        CGRect frame2 = [DDetailCell boundingRect:_model.ScenicMes];
        CGFloat height = frame.size.height + frame2.size.height;
        return height + 200;
        
//        CGFloat height = [DDetailCell getCellHeight:_model];
//        return height;
    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
