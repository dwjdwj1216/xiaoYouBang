//
//  JobSearchViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/30/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "JobSearchViewController.h"
#import "TLMenuCell.h"
@interface JobSearchViewController ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation JobSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [[NSMutableArray alloc] init];;
    [self.tableView registerClass:[TLMenuCell class] forCellReuseIdentifier:@"TLMenuCell"];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.y = HEIGHT_NAVBAR + HEIGHT_STATUSBAR;
    self.tableView.height = HEIGHT_SCREEN - self.tableView.y;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"搜索结果";
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLMenuCell"];
    
    TLMenuItem *item = [self.data objectAtIndex:indexPath.row];
    [cell setMenuItem:item];
    //[cell setTopLineStyle:(indexPath.row == 0 ? TLCellLineStyleFill : TLCellLineStyleNone)];
    //[cell setBottomLineStyle:(indexPath.row == self.data.count - 1 ? TLCellLineStyleFill : TLCellLineStyleDefault)];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Delegate -
//MARK: UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

//MARK: UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchText = [searchController.searchBar.text lowercaseString];
    [self.data removeAllObjects];
    for (TLMenuItem *item in self.listData) {
        if ([item.title containsString:searchText] || [item.pinyin containsString:searchText] || [item.pinyinInitial containsString:searchText]) {
            [self.data addObject:item];
        }
    }
    [self.tableView reloadData];
}
@end
