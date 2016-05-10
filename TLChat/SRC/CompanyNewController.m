//
//  CompanyNewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/27/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyNewController.h"
#import "CompanyNewHelper.h"

@interface CompanyNewController ()

@property (nonatomic,strong)CompanyNewHelper *companyNewHelper;

@end

@implementation CompanyNewController

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
    [self.navigationItem setTitle:@"企业动态"];
    [self.tableView registerClass:[CompanyNewCell class] forCellReuseIdentifier:@"CompanyNewCell"];
    self.data = self.companyNewHelper.companyNewData;
}

#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    //NSLog(@"Seciton:%ld",self.data.count);
    return self.data.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"Rows:%ld",[self.data[section] count]);
    return [self.data[section] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CompanyNewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CompanyNewCell"];
    CompanyNew *new = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    [cell setCompanyNew:new];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 93.5f;
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

-(CompanyNewHelper *)companyNewHelper{
    if (!_companyNewHelper) {
        _companyNewHelper = [[CompanyNewHelper alloc]init];
    }
    return _companyNewHelper;
}

@end
