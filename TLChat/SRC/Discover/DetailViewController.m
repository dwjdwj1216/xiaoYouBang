//
//  DetailViewController.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailContentCell.h"
#import "CommentCell.h"
#import "CommentHelper.h"
@interface DetailViewController ()

@property (nonatomic, strong) CommentHelper *commentHelper;

@end

@implementation DetailViewController

- (void) loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView setBackgroundColor:[UIColor colorTableViewBG]];
    [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setSeparatorColor:[UIColor colorCellLine]];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 20)]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    [self.navigationController.navigationBar setTintColor:[UIColor greenColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    */
    [self.tableView registerClass:[DetailContentCell class] forCellReuseIdentifier:@"DetailContentCell"];
    [self.tableView registerClass:[CommentCell class] forCellReuseIdentifier:@"CommentCell"];
    self.data = self.commentHelper.listDate;

    
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:66.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:1]];

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        DetailContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailContentCell"];
        cell.item = self.item;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
        cell.item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorDefaultBlack];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 170;
    }else{
        return 107.5;
    }
}
#pragma mark - Getter
-(CommentHelper *)commentHelper{
    if (!_commentHelper) {
        _commentHelper = [[CommentHelper alloc]init];
    }
    return _commentHelper;
}

@end
