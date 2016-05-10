//
//  CompanyTrendViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyTrendViewController.h"
#import "CompanyTrendHelper.h"
@interface CompanyTrendViewController ()

@property (nonatomic, strong) CompanyTrendHelper *companyTrendHelper;

@end

@implementation CompanyTrendViewController
- (void) loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView setBackgroundColor:[UIColor colorTableViewBG]];
    [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setSeparatorColor:[UIColor colorCellLine]];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 20)]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"企业趋势"];
    [self.tableView registerClass:[TrendCell class] forCellReuseIdentifier:@"TrendCell"];
    self.data = self.companyTrendHelper.companyTrendData;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TrendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrendCell"];
    TrendPic *pic = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    cell.trendPic = pic;
    return cell;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 252.5f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5.0f;
}
#pragma mark - Getter

- (CompanyTrendHelper *)companyTrendHelper{
    if (!_companyTrendHelper) {
        _companyTrendHelper = [[CompanyTrendHelper alloc]init];
    }
    return _companyTrendHelper;
}

@end
