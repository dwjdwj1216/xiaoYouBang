//
//  CompanyViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/26/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyViewController.h"
#import "CompanyViewHelper.h"
#import "CompanyInfo.h"
#import "CompanyInfoCell.h"
#import "CompanyNewController.h"
#import "CompanyTrendViewController.h"
#import "CompanyMarkViewController.h"
#import "ShareExperienceViewController.h"
#import "PositionViewController.h"
@interface CompanyViewController ()

@property (nonatomic, strong) ShareExperienceViewController *shareExperienceVC;

@property (nonatomic, strong) CompanyMarkViewController *companyMarkVC;

@property (nonatomic, strong) CompanyNewController *companyNC;

@property (nonatomic, strong) CompanyTrendViewController *companyTrendVC;
@property (nonatomic, strong) CompanyViewHelper *companyViewHelper;
@property (nonatomic, strong) CompanyInfo *companyInfo;
@property (nonatomic, strong) PositionViewController *positionVC;
@property (nonatomic, strong) UIView *header;

@property (nonatomic, strong) UIView *middle;

@end

@implementation CompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:self.companyName];
    [self.tableView registerClass:[TLMenuCell class] forCellReuseIdentifier:@"TLMenuCell"];
    [self.tableView registerClass:[CompanyInfoCell class] forCellReuseIdentifier:@"CompanyInfoCell"];
    
    for (CompanyInfo *info in self.companyViewHelper.companyData) {
        if ([info.name isEqualToString:self.companyName]) {
            self.companyInfo = [CompanyInfo createMenuWithIconPath:info.iconPath name:info.name info:info.info isAttention:info.isAttention score:info.score];
            break;
        }
    }
    self.data = self.companyViewHelper.funData;
    [self.tableView setTableHeaderView:self.header];
    
}
#pragma mark -Delegate
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CompanyInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CompanyInfoCell"];
        cell.info = self.companyInfo.info;
        return cell;
    }else{
        TLMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLMenuCell"];
        TLMenuItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
        [cell setMenuItem:item];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
            return 84;
            //return self.bannerView.frame.size.height;
    }else{
        return 44.0f;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
    TLMenuItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if ([item.title isEqualToString:@"企业动态"]) {
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.companyNC animated:YES];
        //[self setHidesBottomBarWhenPushed:NO];
    }else if ([item.title isEqualToString:@"企业趋势"]){
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.companyTrendVC animated:YES];
        //[self setHidesBottomBarWhenPushed:NO];
    }else if ([item.title isEqualToString:@"评分评价"]){
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.companyMarkVC animated:YES];
        //[self setHidesBottomBarWhenPushed:NO];
    }else if ([item.title isEqualToString:@"经验分享"]){
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.shareExperienceVC animated:YES];
        //[self setHidesBottomBarWhenPushed:NO];
    }else if ([item.title isEqualToString:@"企业职位"]){
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.positionVC animated:YES];
        //[self setHidesBottomBarWhenPushed:NO];
    }
}

#pragma mark - Getter
-(PositionViewController *)positionVC{
    if (!_positionVC) {
        _positionVC = [[PositionViewController alloc]init];
    }
    return _positionVC;
}

-(ShareExperienceViewController *)shareExperienceVC{
    if (!_shareExperienceVC) {
        _shareExperienceVC = [[ShareExperienceViewController alloc]init];
        _shareExperienceVC.companyName = self.companyInfo.name;
    }
    return _shareExperienceVC;
}

-(CompanyMarkViewController *)companyMarkVC{
    if (!_companyMarkVC) {
        _companyMarkVC = [[CompanyMarkViewController alloc]init];
        _companyMarkVC.score = self.companyInfo.score;
        _companyMarkVC.companyName = self.companyInfo.name;
    }
    return _companyMarkVC;
}

-(CompanyTrendViewController *)companyTrendVC{
    if (!_companyTrendVC) {
        _companyTrendVC = [[CompanyTrendViewController alloc]init];
    }
    return _companyTrendVC;
}

-(CompanyNewController *)companyNC{
    if (!_companyNC) {
        _companyNC = [[CompanyNewController alloc]init];
    }
    return _companyNC;
}

-(CompanyInfo *)companyInfo{
    if (!_companyInfo) {
        _companyInfo = [[CompanyInfo alloc]init];
    }
    return _companyInfo;
}

-(CompanyViewHelper *)companyViewHelper{
    if (!_companyViewHelper) {
        _companyViewHelper = [[CompanyViewHelper alloc]init];
    }
    return _companyViewHelper;
}

-(UIView *)header{
    if (!_header) {
        _header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 110.5)];
        _header.backgroundColor = [UIColor whiteColor];
        UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.companyInfo.iconPath]];
        
        UIImageView *attention = [[UIImageView alloc]init];
        if (self.companyInfo.isAttention == NO) {
            attention.image = [UIImage imageNamed:@"guanzhu"];
        }else{
            attention.image = [UIImage imageNamed:@"yiguanzhu"];
        }
        
        UILabel *name = [[UILabel alloc]init];
        UILabel *sys = [[UILabel alloc]init];
        UILabel *info = [[UILabel alloc]init];
        UIColor *black = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
        UIColor *gray = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1];
        NSDictionary *disName = @{
                                  NSFontAttributeName:[UIFont systemFontOfSize:19],
                                  NSForegroundColorAttributeName:black
                                  };
        NSDictionary *disSys = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:15],
                                 NSForegroundColorAttributeName:black
                                 };
        NSDictionary *disInfo = @{
                                  NSFontAttributeName:[UIFont systemFontOfSize:10],
                                  NSForegroundColorAttributeName:gray
                                  };
        name.attributedText = [[NSAttributedString alloc]initWithString:self.companyName attributes:disName];
        NSString *score = [NSString stringWithFormat:@"综合评分：%@",self.companyInfo.score];
        sys.attributedText = [[NSAttributedString alloc ]initWithString:score attributes:disSys];
        info.attributedText = [[NSAttributedString alloc]initWithString:@"综合评分是参考最近五年内的用户评分，用户评价，学校企业互评的实时评定结果，点击来查看详情" attributes:disInfo];
        info.numberOfLines = 0;
        info.lineBreakMode = NSLineBreakByCharWrapping;
        [_header addSubview:icon];
        [_header addSubview:name];
        [_header addSubview:sys];
        [_header addSubview:info];
        [_header addSubview:attention];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15.5);
            make.left.mas_equalTo(26);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(80);
        }];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(19.5);
            make.left.mas_equalTo(137.5);
            
        }];
        [sys mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(52.5);
            make.left.mas_equalTo(137.5);
        }];
        [info mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(71);
            make.left.mas_equalTo(137.5);
            make.width.mas_equalTo(225.5);
        }];
        [attention mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(19.5);
            make.left.mas_equalTo(249);
        }];
    }
    return _header;
}

@end
