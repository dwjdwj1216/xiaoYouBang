//
//  ShareExperienceViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/29/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ShareExperienceViewController.h"
#import "ShareExperienceHelper.h"
#import "ShareExperienceCell.h"
#import "NewShareExperienceViewController.h"
#import "ShareDetailViewController.h"

@interface ShareExperienceViewController ()

@property (nonatomic, strong) UIView *header;

@property (nonatomic, strong) UIButton *all;
@property (nonatomic, strong) UIButton *jobExperience;
@property (nonatomic, strong) UIButton *workExperience;
@property (nonatomic, strong) UIButton *otherExperience;

@property (nonatomic, strong) ShareExperienceHelper *helper;
@property (nonatomic, strong) NewShareExperienceViewController *newShareExperienceVC;
@property (nonatomic, strong) ShareDetailViewController *shareDetailVC;
@end

@implementation ShareExperienceViewController

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
    [self.navigationItem setTitle:@"经验分享"];
    [self.view addSubview:self.header];
    [self.tableView setTableHeaderView:self.header];
    self.data = self.helper.ShareExperienceListData;
    [self.tableView registerClass:[ShareExperienceCell class] forCellReuseIdentifier:@"ShareExperienceCell"];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}
#pragma mark - Event Response
- (void)rightBarButtonDown:(UIBarButtonItem *)sender
{
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:self.newShareExperienceVC animated:YES];
    [self setHidesBottomBarWhenPushed:NO];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data[section] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 184;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShareExperienceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShareExperienceCell"];
    ShareExperienceItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    cell.item = item;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(event:)];
    [tapGesture setNumberOfTapsRequired:1];
    [cell.rightView addGestureRecognizer:tapGesture];
    return cell;
}
-(void)event:(UITapGestureRecognizer *)gesture{
    UIView *view = gesture.view;
    ShareExperienceCell *cell = (ShareExperienceCell *)view.superview.superview;
    
    self.shareDetailVC.item = [self.data[(long)cell.section] objectAtIndex:(long)cell.row];
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:self.shareDetailVC animated:YES];
    [self setHidesBottomBarWhenPushed:NO];
    
}


#pragma mark - Getter

- (ShareDetailViewController *)shareDetailVC{
    if (!_shareDetailVC) {
        _shareDetailVC = [[ShareDetailViewController alloc]init];
    }
    return _shareDetailVC;
}

-(NewShareExperienceViewController *)newShareExperienceVC{
    if (!_newShareExperienceVC) {
        _newShareExperienceVC = [[NewShareExperienceViewController alloc]init];
        _newShareExperienceVC.companyName = self.companyName;
    }
    return _newShareExperienceVC;
}

- (ShareExperienceHelper *)helper{
    if (!_helper) {
        _helper = [[ShareExperienceHelper alloc]init];
    }
    return _helper;
}

- (UIView *)header{
    if(!_header){
        _header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 50.5)];
        [_header setBackgroundColor:[UIColor whiteColor]];
        [_header addSubview:self.all];
        [_header addSubview:self.jobExperience];
        [_header addSubview:self.workExperience];
        [_header addSubview:self.otherExperience];
        [self.all mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_header).mas_offset(11.5);
            make.left.mas_equalTo(_header).mas_offset(19.5);
            make.width.mas_equalTo(58.5);
            make.height.mas_equalTo(27);
        }];
        [self.jobExperience mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.all);
            make.left.mas_equalTo(self.all).mas_offset(77);
            make.width.mas_equalTo(72.5);
            make.height.mas_equalTo(27);
        }];
        [self.workExperience mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.all);
            make.left.mas_equalTo(self.jobExperience).mas_offset(91);
            make.width.mas_equalTo(72.5);
            make.height.mas_equalTo(27);
        }];
        [self.otherExperience mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.all);
            make.left.mas_equalTo(self.workExperience).mas_offset(91);
            make.width.mas_equalTo(72.5);
            make.height.mas_equalTo(27);
        }];
    }
    return _header;
}

-(UIButton *)all{
    if (!_all) {
        _all = [[UIButton alloc]init];
        [_all setTitle:@"全部" forState:UIControlStateNormal];
        [_all setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -58.5, 0.0, 0.0)];
        [_all setImage:[UIImage imageNamed:@"small_button"] forState:UIControlStateNormal];
        [_all setImage:[UIImage imageNamed:@"small_button_on"] forState:UIControlStateSelected];
        [_all setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, -_all.titleLabel.bounds.size.width)];
        [_all.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [_all setSelected:YES];
    }
    return _all;
}

-(UIButton *)jobExperience{
    if (!_jobExperience) {
        _jobExperience = [[UIButton alloc]init];
        [_jobExperience setTitle:@"求职经历" forState:UIControlStateNormal];
        [_jobExperience setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -72.5, 0.0, 0.0)];
        [_jobExperience setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [_jobExperience setImage:[UIImage imageNamed:@"button_on"] forState:UIControlStateSelected];
        [_jobExperience setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, -_jobExperience.titleLabel.bounds.size.width)];
        [_jobExperience.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _jobExperience;
}

-(UIButton *)workExperience{
    if (!_workExperience) {
        _workExperience = [[UIButton alloc]init];
        [_workExperience setTitle:@"工作经历" forState:UIControlStateNormal];
        [_workExperience setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -72.5, 0.0, 0.0)];
        [_workExperience setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [_workExperience setImage:[UIImage imageNamed:@"button_on"] forState:UIControlStateSelected];
        [_workExperience setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, -_workExperience.titleLabel.bounds.size.width)];
        [_workExperience.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _workExperience;
}

-(UIButton *)otherExperience{
    if (!_otherExperience) {
        _otherExperience = [[UIButton alloc]init];
        [_otherExperience setTitle:@"其他经历" forState:UIControlStateNormal];
        [_otherExperience setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -72.5, 0.0, 0.0)];
        [_otherExperience setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [_otherExperience setImage:[UIImage imageNamed:@"button_on"] forState:UIControlStateSelected];
        [_otherExperience setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, -_otherExperience.titleLabel.bounds.size.width)];
        [_otherExperience.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _otherExperience;
}

@end
