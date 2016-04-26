//
//  TLJobViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/21/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLJobViewController.h"
#import "TLJobViewController+Delegate.h"
#import "TLSearchController.h"
#import "UserInfoItem.h"
#import <AFNetworking.h>
@interface TLJobViewController ()

@property (nonatomic, strong) UIView *replace;

@property (nonatomic, strong) UIImageView *scrollTopView;

@property (nonatomic, strong) TLSearchController *searchController;

@end

@implementation TLJobViewController

- (void) loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0,0, WIDTH_SCREEN, HEIGHT_SCREEN)];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view setBackgroundColor:[UIColor redColor]];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jobHelper = [[TLJobHelper alloc]init];
    self.shareHelper = [[ShareHelper alloc]init];
    [self p_initUI];        // 初始化界面UI
    //[self.data addObject:self.bannerView];
    self.data = self.jobHelper.JobMenuData;

    [self.navigationItem setTitleView:self.uiSC];
    
    [self registerCellClass];
}

#pragma mark - Private Methods -
- (void)p_initUI
{
    if (self.uiSC.selectedSegmentIndex == 0) {
        
        
        self.tableView.tableHeaderView = self.searchController.searchBar;
        [self.tableView addSubview:self.scrollTopView];
        [self.scrollTopView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tableView);
            make.bottom.mas_equalTo(self.tableView.mas_top).mas_offset(-35);
        }];
    }
}


- (void)segmentAction:(UISegmentedControl *)sender
{
    if (self.uiSC.selectedSegmentIndex == 0) {
        
        [self.tableView setTableHeaderView:self.searchController.searchBar];
        [self.tableView addSubview:self.scrollTopView];
        [self.tableView addSubview:self.bannerView];
        [self.scrollTopView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tableView);
            make.bottom.mas_equalTo(self.tableView.mas_top).mas_offset(-35);
        }];
    }else{
        
        [self.tableView setTableHeaderView:self.replace];
        [self.scrollTopView removeFromSuperview];
        [self.bannerView removeFromSuperview];
    }
    [self.tableView reloadData];
}

#pragma mark - Getter -
-(UIView *)replace{
    if (!_replace) {
        _replace = [[UIView alloc]init];
        _replace.size = CGSizeMake(375, 22);
    }
    return _replace;
}

-(UISegmentedControl *)uiSC{
    if (!_uiSC) {
        _uiSC = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"职场", @"分享", nil]];
        _uiSC.selectedSegmentIndex = 0;
        NSDictionary *dicNS = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorDefaultGreen],NSForegroundColorAttributeName,nil,nil];
        NSDictionary *dicS = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorDefaultBlack],NSForegroundColorAttributeName,nil,nil];
        [_uiSC setTitleTextAttributes:dicS forState:UIControlStateSelected];
        [_uiSC setTitleTextAttributes:dicNS forState:UIControlStateNormal];
        for (int i=0; i<[_uiSC.subviews count]; i++) {
            [[_uiSC.subviews objectAtIndex:i] setTintColor:[UIColor colorDefaultGreen]];
        }
        
        _uiSC.center = CGPointMake(160, 70);
        
        [_uiSC addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _uiSC;
}

-(CompanyListViewController *)companyListVC{
    if(!_companyListVC){
        _companyListVC = [[CompanyListViewController alloc]init];
    }
    return _companyListVC;
}

-(BannerView *)bannerView{
    if (!_bannerView) {
        CGFloat w = self.view.bounds.size.width;
        self.bannerView = [BannerView initWith:self.view origin:CGPointMake(self.tableView.tableHeaderView.frame.origin.x, self.tableView.tableHeaderView.frame.size.height) size:CGSizeMake(w, 116)];
    }
    return _bannerView;
}

- (TLSearchController *) searchController
{
    if (_searchController == nil) {
        _searchController = [[TLSearchController alloc] initWithSearchResultsController:self.searchVC];
        [_searchController setSearchResultsUpdater:self.searchVC];
        [_searchController.searchBar setPlaceholder:@"搜索企业、职位、学校、专业"];
        [_searchController.searchBar setDelegate:self];
        [_searchController setShowVoiceButton:NO];
    }
    return _searchController;
}

- (TLFriendSearchViewController *) searchVC
{
    if (_searchVC == nil) {
        _searchVC = [[TLFriendSearchViewController alloc] init];
    }
    return _searchVC;
}

- (UIImageView *)scrollTopView
{
    if (_scrollTopView == nil) {
        _scrollTopView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"conv_wechat_icon"]];
    }
    return _scrollTopView;
}
@end
