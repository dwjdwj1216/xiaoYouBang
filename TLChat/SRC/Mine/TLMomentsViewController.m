//
//  TLMomentsViewController.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLMomentsViewController.h"
#import "TLMomentsViewController+TableView.h"
#import "TLMomentsViewController+Proxy.h"
@implementation TLMomentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"好友动态"];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 60.0f)]];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_camera"] style:UIBarButtonItemStylePlain actionBlick:^{
        
    }];
    [self.navigationItem setRightBarButtonItem:rightBarButton];
    
    [self registerCellForTableView:self.tableView];
    [self loadData];
}

#pragma mark - # Getter -
- (TLMomentsProxy *)proxy
{
    if (_proxy == nil) {
        _proxy = [[TLMomentsProxy alloc] init];
    }
    return _proxy;
}
@end
