//
//  TLMineViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/22/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLMineViewController.h"
#import "TLMineTableViewController.h"
#import "TLMineHeaderView.h"
@interface TLMineViewController ()

@property (nonatomic, strong) TLMineHeaderView *mineHeaderView;
@property (nonatomic, strong) TLMineTableViewController *mineTVC;
@end

@implementation TLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"我"];
    [self.view addSubview:self.mineHeaderView];
    [self.view addSubview:self.mineTVC.tableView];
    [self p_initUI];
}

#pragma mark - Private Methods -
- (void)p_initUI
{
    //NSLog(@"%f,%f",self.view.left,self.view.top);
    /*
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.top).mas_offset(20);
    }];
    */
    /*
    [self.mineTVC.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mineHeaderView.bottom);
    }];
    */
    //NSLog(@"%f",self.mineTVC.tableView.frame.origin.y);
    
    //NSLog(@"%f,%f,%f,%f",self.searchController.searchBar.frame.origin.x,self.searchController.searchBar.frame.origin.y,self.searchController.searchBar.frame.size.width,self.searchController.searchBar.frame.size.height);
    
    
    //[header addSubview:self.bannerView];
    //[self.tableView addSubview:header];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark Getter
-(TLMineHeaderView *)mineHeaderView{
    if (!_mineHeaderView) {
        self.mineHeaderView = [[TLMineHeaderView alloc]init];
    }
    return _mineHeaderView;
}

-(TLMineTableViewController *)mineTVC{
    if (!_mineTVC) {
        self.mineTVC = [[TLMineTableViewController alloc]init];
    }
    return _mineTVC;
}

@end
