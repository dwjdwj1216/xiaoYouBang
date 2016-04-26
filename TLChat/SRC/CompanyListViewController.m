//
//  CompanyListViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/25/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyListViewController.h"
#import "CompanyListHelper.h"
@interface CompanyListViewController ()
@property (nonatomic, strong) CompanyListHelper * companyListHelper;
@end

@implementation CompanyListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"圈子"];
    
    self.companyListHelper = [[CompanyListHelper alloc] init];
    self.data = self.companyListHelper.CompanyListData;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
