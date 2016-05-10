//
//  CompanyMarkViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyMarkViewController.h"
#import "ContentCellHelper.h"
#import "NewMarkViewController.h"
@interface CompanyMarkViewController ()

@property (nonatomic, strong) UIImageView *header;

@property (nonatomic, strong) ContentCellHelper *contentCellHelper;

@property (nonatomic, strong) NewMarkViewController *myNewMarkVC;

@end

@implementation CompanyMarkViewController

- (void) loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView setBackgroundColor:[UIColor colorTableViewBG]];
    [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setSeparatorColor:[UIColor colorCellLine]];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 20)]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"评分评价"];
    [self.tableView setTableHeaderView:self.header];
    [self.tableView registerClass:[ButtonCell class] forCellReuseIdentifier:@"ButtonCell"];
    [self.tableView registerClass:[ContentCell class] forCellReuseIdentifier:@"ContentCell"];
    self.data = self.contentCellHelper.contentData;
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 159.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setScore:(NSString *)score{
    _score = score;
}


#pragma mark - Event Response
- (void)rightBarButtonDown:(UIBarButtonItem *)sender
{
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:self.myNewMarkVC animated:YES];
    [self setHidesBottomBarWhenPushed:NO];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        ButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ButtonCell"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }else{
        ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentCell"];
        ContentItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
        cell.item = item;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
     //Configure the cell...
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 50.5;
    }else{
        return UITableViewAutomaticDimension;
    }
}


#pragma mark - Getter
-(NewMarkViewController *)myNewMarkVC{
    if (!_myNewMarkVC) {
        _myNewMarkVC  = [[NewMarkViewController alloc]init];
        _myNewMarkVC.companyName = self.companyName;
    }
    return _myNewMarkVC;
}

-(ContentCellHelper *)contentCellHelper{
    if (!_contentCellHelper) {
        _contentCellHelper = [[ContentCellHelper alloc]init];
    }
    return _contentCellHelper;
}

-(UIImageView *)header{
    if (!_header) {
        _header = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 36.5)];
        [_header setBackgroundColor:[UIColor whiteColor]];
        UILabel *title = [[UILabel alloc]init];
        UILabel *score = [[UILabel alloc]init];
        [_header addSubview:title];
        [_header addSubview:score];
        UIColor *black = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
        NSDictionary *dic = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:15],
                                 NSForegroundColorAttributeName:black
                                 };
        title.attributedText = [[NSAttributedString alloc]initWithString:@"综合评分" attributes:dic];
        score.attributedText = [[NSAttributedString alloc]initWithString:self.score attributes:dic];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_header).mas_offset(10.5);
            make.left.mas_equalTo(_header).mas_offset(76.5);
        }];
        [score mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(title);
            make.left.mas_equalTo(title).mas_offset(174);
        }];

    }
    return _header;
}

@end
