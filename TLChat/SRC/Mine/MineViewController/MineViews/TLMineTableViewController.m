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
#import "TLMineInfoViewController.h"
#import "AttentionViewController.h"
#import "CollectionViewController.h"
#import "TLMineHeaderView.h"
#import "TieziViewController.h"
#import "MessageNotifyViewController.h"
#import "SettingViewController.h"
#import "TLMomentsViewController.h"
@interface TLMineTableViewController ()

@property (nonatomic, strong) TLMineHeaderView *mineHeaderView;
@property (nonatomic, strong) TLMineHelper *mineHelper;
@property (nonatomic, strong) TieziViewController *tieziVC;
@property (nonatomic, strong) TLMineInfoViewController *infoVC;
@property (nonatomic, strong) AttentionViewController *attentionVC;
@property (nonatomic, strong) CollectionViewController *collectionVC;
@property (nonatomic, strong) MessageNotifyViewController *messageNotifyVC;
@property (nonatomic, strong) SettingViewController *settingVC;
@property (nonatomic, strong) TLMomentsViewController *momentsVC;

@end

@implementation TLMineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"我"];

    self.mineHelper = [[TLMineHelper alloc] init];
    self.data = self.mineHelper.mineMenuData;
    
    self.tableView.tableHeaderView = self.mineHeaderView;
    UITapGestureRecognizer *tapAttention = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(attentionEvent:)];
    [tapAttention setNumberOfTapsRequired:1];
    [self.mineHeaderView.left addGestureRecognizer:tapAttention];
    
    UITapGestureRecognizer *tapCollection = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(collectionEvent:)];
    [tapCollection setNumberOfTapsRequired:1];
    [self.mineHeaderView.right addGestureRecognizer:tapCollection];
    
    UITapGestureRecognizer *tapMore = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(moreEvent:)];
    [tapMore setNumberOfTapsRequired:1];
    [self.mineHeaderView.header addGestureRecognizer:tapMore];
    
}
-(void)attentionEvent:(UITapGestureRecognizer *)gesture{
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:self.attentionVC animated:YES];
    [self setHidesBottomBarWhenPushed:NO];
    
}
-(void)collectionEvent:(UITapGestureRecognizer *)gesture{
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:self.collectionVC animated:YES];
    [self setHidesBottomBarWhenPushed:NO];
}
-(void)moreEvent:(UITapGestureRecognizer *)gesture{
    
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:self.infoVC animated:YES];
    [self setHidesBottomBarWhenPushed:NO];
}
#pragma mark - Delegate -

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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLMenuItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if ([item.title isEqualToString:@"我的帖子"]) {
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.tieziVC animated:YES];
        [self setHidesBottomBarWhenPushed:NO];
    }else if([item.title isEqualToString:@"消息通知"]){
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.messageNotifyVC animated:YES];
        [self setHidesBottomBarWhenPushed:NO];
    }else if ([item.title isEqualToString:@"设置"]){
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.settingVC animated:YES];
        [self setHidesBottomBarWhenPushed:NO];
    }else if([item.title isEqualToString:@"好友动态"]){
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.momentsVC animated:YES];
        [self setHidesBottomBarWhenPushed:NO];
    }
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

#pragma mark - Getter

-(TLMomentsViewController *)momentsVC{
    if (!_momentsVC) {
        _momentsVC = [[TLMomentsViewController alloc]init];
    }
    return _momentsVC;
}

-(SettingViewController *)settingVC{
    if (!_settingVC) {
        _settingVC = [[SettingViewController alloc]init];
    }
    return _settingVC;
}

-(MessageNotifyViewController *)messageNotifyVC{
    if (!_messageNotifyVC) {
        _messageNotifyVC = [[MessageNotifyViewController alloc]init];
    }
    return _messageNotifyVC;
}

-(TieziViewController *)tieziVC{
    if (!_tieziVC) {
        _tieziVC = [[TieziViewController alloc]init];
    }
    return _tieziVC;
}

-(CollectionViewController *)collectionVC{
    if (!_collectionVC) {
        _collectionVC = [[CollectionViewController alloc]init];
    }
    return _collectionVC;
}

-(AttentionViewController *)attentionVC{
    if (!_attentionVC) {
        _attentionVC = [[AttentionViewController alloc]init];
    }
    return _attentionVC;
}

-(TLMineHeaderView *)mineHeaderView{
    if (!_mineHeaderView) {
        self.mineHeaderView = [[TLMineHeaderView alloc]init];
    }
    return _mineHeaderView;
}

-(TLMineInfoViewController *)infoVC{
    if (!_infoVC) {
        self.infoVC = [[TLMineInfoViewController alloc]init];
    }
    return _infoVC;
}
@end
