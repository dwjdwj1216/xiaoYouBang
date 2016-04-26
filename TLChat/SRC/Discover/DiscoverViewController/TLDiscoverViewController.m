//
//  TLDiscoverViewController.m
//  TLChat
//
//  Created by 李伯坤 on 16/1/23.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "TLDiscoverViewController.h"
#import "TLDiscoverHelper.h"
#import "TLSearchController.h"

@interface TLDiscoverViewController ()

@property (nonatomic, strong) TLSearchController *searchController;
@property (nonatomic, strong) TLDiscoverHelper *discoverHelper;

@end

@implementation TLDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    [self.navigationItem setTitle:@"圈子"];

    self.discoverHelper = [[TLDiscoverHelper alloc] init];
    self.data = self.discoverHelper.discoverMenuData;
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"圈子推荐" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc]init];
    label.text = @"";
    if (section == 0) {
        label.text = @"职业圈";
    }else if(section == 1){
        label.text = @"校友圈";
    }else if (section == 2){
        label.text = @"兴趣圈";
    }
    return label;
}

/*
#pragma mark - Delegate - 
//MARK: UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLMenuItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if ([item.title isEqualToString:@"朋友圈"]) {
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.momentsVC animated:YES];
        [self setHidesBottomBarWhenPushed:NO];
    }
    if ([item.title isEqualToString:@"扫一扫"]) {
        TLScanningViewController *scannerVC = [[TLScanningViewController alloc] init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:scannerVC animated:YES];
        [self setHidesBottomBarWhenPushed:NO];
    }
    else if ([item.title isEqualToString:@"摇一摇"]) {
        TLShakeViewController *shakeVC = [[TLShakeViewController alloc] init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:shakeVC animated:YES];
        [self setHidesBottomBarWhenPushed:NO];
    }
    else if ([item.title isEqualToString:@"漂流瓶"]) {
        TLBottleViewController *bottleVC = [[TLBottleViewController alloc] init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:bottleVC animated:YES];
        [self setHidesBottomBarWhenPushed:NO];
    }
    else if ([item.title isEqualToString:@"购物"]) {
        TLShoppingViewController *shoppingVC = [[TLShoppingViewController alloc] init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:shoppingVC animated:YES];
        [self setHidesBottomBarWhenPushed:NO];
    }
    else if ([item.title isEqualToString:@"游戏"]) {
        TLGameViewController *gameVC = [[TLGameViewController alloc] init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:gameVC animated:YES];
        [self setHidesBottomBarWhenPushed:NO];
    }
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}
*/
#pragma mark - Event Response
- (void)rightBarButtonDown:(UIBarButtonItem *)sender
{
    
}

#pragma mark - # Getter -
- (TLSearchController *) searchController
{
    if (_searchController == nil) {
        _searchController = [[TLSearchController alloc] initWithSearchResultsController:self.searchVC];
        [_searchController setSearchResultsUpdater:self.searchVC];
        [_searchController.searchBar setPlaceholder:@"搜索圈子"];
        [_searchController.searchBar setDelegate:self];
        [_searchController setShowVoiceButton:NO];
    }
    return _searchController;
}

//MARK: UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.searchVC setFriendsData:[TLFriendHelper sharedFriendHelper].friendsData];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.tabBarController.tabBar setHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"语音搜索按钮" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

@end
