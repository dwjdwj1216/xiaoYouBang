//
//  TLJobViewController+Delegate.m
//  TLChat
//
//  Created by 戴王炯 on 4/21/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLJobViewController+Delegate.h"
#import "TLConversation+TLUser.h"
#import "TLJobCell.h"
#import "TLBannerCell.h"
#import "ShareCell.h"
#import "BannerView.h"
#import "ListHelper.h"
@implementation TLJobViewController (Delegate)

#pragma mark - Public Methods -
- (void)registerCellClass
{
    [self.tableView registerClass:[TLBannerCell class] forCellReuseIdentifier:@"TLBannerCell"];
    [self.tableView registerClass:[TLJobCell class] forCellReuseIdentifier:@"TLJobCell"];
    [self.tableView registerClass:[ShareCell class] forCellReuseIdentifier:@"ShareCell"];
}

#pragma mark - Delegate -

//MARK: UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    //NSLog(@"%lu",(unsigned long)self.data.count);
    if (self.uiSC.selectedSegmentIndex == 0) {
        self.data = self.jobHelper.JobMenuData;
    }else {
        self.data = self.shareHelper.ShareListData;
    }
    return self.data.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"%lu",[self.data[section] count]);
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.uiSC.selectedSegmentIndex == 0) {
        if (indexPath.section == 0) {
            TLBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLBannerCell"];
            [cell setBannerView:self.bannerView];
            //cell.frame.origin = CGPointMake(0, 0);
            return cell;
        }else{
            TLJobCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLJobCell"];
            //NSLog(@"%ld,%ld",indexPath.section,indexPath.row);
            TLMenuItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
            [cell setMenuItem:item];
            return cell;
        }
    }else{
        ShareCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShareCell"];
        UserInfoItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
        [cell setItem:item];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    
}
//MARK: UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.uiSC.selectedSegmentIndex == 0) {
        if (indexPath.section == 0) {
            return 116;
            //return self.bannerView.frame.size.height;
        }else{
            return 44.0f;
        }
    }else{
        return 211;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.uiSC.selectedSegmentIndex == 0) {
        TLMenuItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
        if ([item.title isEqualToString:@"企业"]) {
            [self setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:self.companyListVC animated:YES];
            [self setHidesBottomBarWhenPushed:NO];
        }else if ([item.title isEqualToString:@"学校"]){
            [self setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:self.schoolListVC animated:YES];
            [self setHidesBottomBarWhenPushed:NO];

        }

    }else{
        
    }
    
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}
*/


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.uiSC.selectedSegmentIndex == 1) {
        return 0.5;
    }else{
        return 0.5;
    }
}


//MARK: UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.searchVC setListData:[[ListHelper alloc]init].data];
    
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
