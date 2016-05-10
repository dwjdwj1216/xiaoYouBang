//
//  SettingViewController.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingHelper.h"
#import "TLSettingCell.h"
#import "TLSettingButtonCell.h"
@interface SettingViewController ()

@property (nonatomic, strong)SettingHelper *settingHelper;

@end
@implementation SettingViewController

- (void) loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView setBackgroundColor:[UIColor colorTableViewBG]];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setSeparatorColor:[UIColor colorCellLine]];
    [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 20)]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"设置"];
    [self.tableView registerClass:[TLSettingCell class] forCellReuseIdentifier:@"TLSettingCell"];
    [self.tableView registerClass:[TLSettingButtonCell class] forCellReuseIdentifier:@"TLSettingButtonCell"];
    self.data = self.settingHelper.settingData;
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TLSettingItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];

    if (indexPath.section == 2){
        TLSettingButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLSettingButtonCell"];
        cell.item = item;
        return cell;
    }else{
        TLSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLSettingCell"];
        cell.item =item;
        return cell;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

#pragma mark - Getter
- (SettingHelper *)settingHelper{
    if (!_settingHelper) {
        _settingHelper = [[SettingHelper alloc]init];
    }
    return _settingHelper;
}
@end
