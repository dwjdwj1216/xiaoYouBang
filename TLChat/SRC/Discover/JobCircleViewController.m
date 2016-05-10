//
//  JobCircleViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/30/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "JobCircleViewController.h"
#import "CircleCell.h"
#import "DetailBaseViewController.h"
#import "NewTieziViewController.h"
@interface JobCircleViewController ()

@property (nonatomic, strong) NewTieziViewController *newTieziVC;
@property (nonatomic, strong) DetailBaseViewController *detailBaseVC;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;

@property (nonatomic, strong) UIView *top;

@property (nonatomic, strong) UIView *header;

@end

@implementation JobCircleViewController

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
    [self.tableView registerClass:[CircleCell class] forCellReuseIdentifier:@"CircleCell"];
    [self.navigationItem setTitle:self.name];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:66.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发帖" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    
    
    //self.tableView.tableHeaderView.height = 133;
    [self.tableView setTableHeaderView:self.header];
    
    //[self p_addMasonry];

    self.data = self.circleHelper.listDate;
    //self.tableView.estimatedRowHeight = 159.5;
    //self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationItem setTitle:self.name];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:66.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

#pragma mark - Event Response
- (void)rightBarButtonDown:(UIBarButtonItem *)sender
{
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:self.newTieziVC animated:YES];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CircleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CircleCell"];
    cell.item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 159.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.detailBaseVC.detailTVC.item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:self.detailBaseVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
}
*/
#pragma mark - Getter
-(NewTieziViewController *)newTieziVC{
    if (!_newTieziVC) {
        _newTieziVC = [[NewTieziViewController alloc]init];
    }
    return _newTieziVC;
}

-(DetailBaseViewController *)detailBaseVC{
    if (!_detailBaseVC) {
        _detailBaseVC = [[DetailBaseViewController alloc]init];
    }
    return _detailBaseVC;
}

-(UIView *)header{
    if (!_header) {
        _header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 133)];
        [_header addSubview:self.top];
        [_header addSubview:self.segmentedControl];
        [self.top mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_header);
            make.left.mas_equalTo(_header);
            make.width.mas_equalTo(WIDTH_SCREEN);
            make.height.mas_equalTo(95);
        }];
        [self.segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.top.mas_bottom);
            make.left.mas_equalTo(self.top);
            make.width.mas_equalTo(WIDTH_SCREEN);
            make.height.mas_equalTo(38);
        }];
    }
    return _header;
}

-(UIView *)top{
    if (!_top) {
        _top = [[UIView alloc]init];
        _top.backgroundColor = [UIColor colorWithRed:66.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:1];
        UILabel *title = [[UILabel alloc]init];
        title.text = self.circleHelper.title;
        title.font = [UIFont systemFontOfSize:12];
        title.textColor = [UIColor whiteColor];
        UIImageView *icon1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top_avatar1"]];
        UIImageView *icon2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top_avatar2"]];
        UIImageView *icon3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top_avatar3"]];
        UIImageView *icon4 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top_avatar4"]];
        
        UIImageView *isJoined = [[UIImageView alloc]init];
        if (self.circleHelper.isJoined) {
            isJoined.image = [UIImage imageNamed:@"joined"];
        }else{
            isJoined.image = [UIImage imageNamed:@"join"];
        }
        UILabel *number = [[UILabel alloc]init];
        number.text = [NSString stringWithFormat:@"%@ 人",self.circleHelper.number];
        number.font = [UIFont systemFontOfSize:12];
        number.textColor = [UIColor whiteColor];
        [_top addSubview:title];
        [_top addSubview:icon1];
        [_top addSubview:icon2];
        [_top addSubview:icon3];
        [_top addSubview:icon4];
        [_top addSubview:number];
        [_top addSubview:isJoined];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_top).mas_offset(5);
            make.centerX.mas_equalTo(_top);
        }];
        [icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(title.mas_bottom).mas_offset(8);
            make.left.mas_equalTo(title).mas_offset(5);
            make.width.and.height.mas_equalTo(20);
        }];
        [icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(icon1);
            make.left.mas_equalTo(icon1.mas_right).mas_offset(5);
            make.width.and.height.mas_equalTo(20);
        }];
        [icon3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(icon1);
            make.left.mas_equalTo(icon2.mas_right).mas_offset(5);
            make.width.and.height.mas_equalTo(20);
        }];
        [icon4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(icon1);
            make.left.mas_equalTo(icon3.mas_right).mas_offset(5);
            make.width.and.height.mas_equalTo(20);
        }];
        [number mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(icon4);
            make.left.mas_equalTo(icon4.mas_right).mas_offset(5);
        }];
        [isJoined mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_top);
            make.top.mas_equalTo(icon4.mas_bottom).mas_offset(15);
            make.width.mas_equalTo(55.5);
            make.height.mas_equalTo(22);
        }];
    }
    return _top;
}

-(CircleHelper *)circleHelper{
    if (!_circleHelper) {
        _circleHelper = [[CircleHelper alloc]init];
    }
    return _circleHelper;
}

-(HMSegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"热门", @"全部", @"精华", @"动态"]];
        //[_segmentedControl setFrame:CGRectMake(0, 95, WIDTH_SCREEN, 38)];
        [_segmentedControl setIndexChangeBlock:^(NSInteger index) {
            NSLog(@"Selected index %ld (via block)", (long)index);
        }];
        _segmentedControl.selectionIndicatorHeight = 4.0f;
        _segmentedControl.backgroundColor = [UIColor whiteColor];
        _segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:13]};
        _segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:66.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:1];
        _segmentedControl.selectionStyle = HMSegmentedControlBorderTypeBottom;
        _segmentedControl.selectedTitleTextAttributes=@{NSForegroundColorAttributeName : [UIColor colorWithRed:66.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:13]};
        _segmentedControl.selectedSegmentIndex = 0;
        _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _segmentedControl.shouldAnimateUserSelection = NO;
    }
    return _segmentedControl;
}

@end
