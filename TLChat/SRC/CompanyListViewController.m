//
//  CompanyListViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/25/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyListViewController.h"
#import "CompanyListHelper.h"
#import "CompanyViewController.h"
@interface CompanyListViewController ()

@property (nonatomic, strong) CompanyListHelper * companyListHelper;
@property (nonatomic, strong) CompanyViewController *companyVC;
@end

@implementation CompanyListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"企业"];
    
    self.companyListHelper = [[CompanyListHelper alloc] init];
    self.data = self.companyListHelper.CompanyListData;
    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLMenuItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if ([item.title isEqualToString:@"阿里巴巴"]) {
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.companyVC animated:YES];
        self.companyVC.companyName = @"阿里巴巴";
        //[self setHidesBottomBarWhenPushed:NO];
    }
    /*
    else if ([item.title isEqualToString:@"学校"]){
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.schoolListVC animated:YES];
        [self setHidesBottomBarWhenPushed:NO];
            
    }
    */
    
}

#pragma mark - Getter

-(CompanyViewController *)companyVC{
    if (!_companyVC) {
        _companyVC = [[CompanyViewController alloc]init];
    }
    return _companyVC;
}

@end
