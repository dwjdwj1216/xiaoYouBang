//
//  CollectionViewController.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionHelper.h"
#import "TLSettingCell.h"
@interface CollectionViewController ()

@property (nonatomic, strong)CollectionHelper *collectionHelper;

@end
@implementation CollectionViewController

- (void) loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView setBackgroundColor:[UIColor colorTableViewBG]];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setSeparatorColor:[UIColor colorCellLine]];
    [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 20)]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"我的关注"];
    [self.tableView registerClass:[TLSettingCell class] forCellReuseIdentifier:@"TLSettingCell"];
    self.data = self.collectionHelper.collectionMenuData;
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TLSettingItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    TLSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLSettingCell"];
    cell.item =item;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


#pragma mark - Getter
- (CollectionHelper *)collectionHelper{
    if (!_collectionHelper) {
        _collectionHelper = [[CollectionHelper alloc]init];
    }
    return _collectionHelper;
}
@end
