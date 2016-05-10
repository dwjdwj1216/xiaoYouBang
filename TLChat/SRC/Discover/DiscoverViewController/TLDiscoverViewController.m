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
#import "JobCircleViewController.h"
@interface TLDiscoverViewController ()

@property (nonatomic, strong) TLSearchController *searchController;
@property (nonatomic, strong) TLDiscoverHelper *discoverHelper;
@property (nonatomic, strong) JobCircleViewController *jobCircleVC;
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
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:66.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:1]];

}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc]init];
    label.text = @"";
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.5 alpha:1];
    if (section == 0) {
        label.text = @"     职业圈";
    }else if(section == 1){
        label.text = @"     校友圈";
    }else if (section == 2){
        label.text = @"     兴趣圈";
    }
    return label;
}


#pragma mark - Delegate - 
//MARK: UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLMenuItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if (indexPath.section == 0) {
        self.jobCircleVC.name = item.title;
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.jobCircleVC animated:YES];
        [self setHidesBottomBarWhenPushed:NO];
    }
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

#pragma mark - Event Response
- (void)rightBarButtonDown:(UIBarButtonItem *)sender
{
    
}

#pragma mark - # Getter -

-(JobCircleViewController *)jobCircleVC{
    if (!_jobCircleVC) {
        _jobCircleVC = [[JobCircleViewController alloc]init];
    }
    return _jobCircleVC;
}

-(CircleSearchViewcontroller *)searchVC{
    if (!_searchVC) {
        _searchVC = [[CircleSearchViewcontroller alloc]init];
    }
    return _searchVC;
}

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
    [self.searchVC setCircleData:self.discoverHelper.circleData];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.tabBarController.tabBar setHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"语音搜索按钮" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

@end
