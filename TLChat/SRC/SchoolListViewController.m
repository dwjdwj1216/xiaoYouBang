//
//  SchoolListViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/26/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "SchoolListViewController.h"
#import "SchoolListHelper.h"
@interface SchoolListViewController ()

@property (nonatomic, strong) SchoolListHelper *schoolListHelper;

@end

@implementation SchoolListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"学校"];
    
    self.schoolListHelper = [[SchoolListHelper alloc] init];
    self.data = self.schoolListHelper.SchoolListData;
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
