//
//  TLMineTableViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/22/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLMineTableViewController.h"
#import "TLMineHelper.h"
#import "TLMineInfoViewController.h"
#import "TLExpressionViewController.h"
#import "TLMineSettingViewController.h"
#import "TLMineHeaderView.h"
@interface TLMineTableViewController ()

@property (nonatomic, strong) TLMineHelper *mineHelper;

@end

@implementation TLMineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setFrame:CGRectMake(0, 127.5+66, 375, 500)];
    self.mineHelper = [[TLMineHelper alloc] init];
    self.data = self.mineHelper.mineMenuData;
}

#pragma mark - Delegate -

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

//MARK: UITableViewDataSource
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [super tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
}

//MARK: UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [super tableView:tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
}
/*
 - (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (indexPath.section == 0) {
 TLMineInfoViewController *mineInfoVC = [[TLMineInfoViewController alloc] init];
 [self setHidesBottomBarWhenPushed:YES];
 [self.navigationController pushViewController:mineInfoVC animated:YES];
 [self setHidesBottomBarWhenPushed:NO];
 [super tableView:tableView didSelectRowAtIndexPath:indexPath];
 return;
 }
 TLMenuItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
 if ([item.title isEqualToString:@"表情"]) {
 TLExpressionViewController *expressionVC = [[TLExpressionViewController alloc] init];
 [self setHidesBottomBarWhenPushed:YES];
 [self.navigationController pushViewController:expressionVC animated:YES];
 [self setHidesBottomBarWhenPushed:NO];
 }
 else if ([item.title isEqualToString:@"设置"]) {
 TLMineSettingViewController *settingVC = [[TLMineSettingViewController alloc] init];
 [self setHidesBottomBarWhenPushed:YES];
 [self.navigationController pushViewController:settingVC animated:YES];
 [self setHidesBottomBarWhenPushed:NO];
 }
 [super tableView:tableView didSelectRowAtIndexPath:indexPath];
 }
 */

@end
