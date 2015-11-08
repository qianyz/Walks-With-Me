//
//  DetailViewController.m
//  跟我走
//
//  Created by mac on 15/10/23.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+WebCache.h"
#import "DetailOneCell.h"
#import "DetailTwoCell.h"
#import "DetailThreeCell.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = NO;
    self.title = @"度假详情";
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, KScreenWidth, 150)];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:_model.headImage]];
    
    self.tableView.tableHeaderView = imageView;
    
    [self.tableView registerClass:[DetailTwoCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"1cell"];
    [self.tableView registerClass:[DetailThreeCell class] forCellReuseIdentifier:@"Cell1"];

    UINib *nib = [UINib nibWithNibName:@"DetailOneCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        DetailOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.model = _model;
        return cell;
        
    }else if(indexPath.section == 0 && indexPath.row == 1){
        DetailTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

        cell.model = _model;
        
        return cell;
    }else if (indexPath.section == 0 && indexPath.row == 2)
    {
        DetailThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
        
        cell.model = _model;
        return cell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1cell" forIndexPath:indexPath];
        cell.textLabel.text = @"11111111";
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 110;
        
    }else if (indexPath.section == 0 && indexPath.row == 2){
        
//        DetailThreeCell *model = _model;
        //计算单元格的高度
        CGFloat height = [DetailThreeCell getCellHeight:_model];
        
        return height;
    }
    return 40;
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
