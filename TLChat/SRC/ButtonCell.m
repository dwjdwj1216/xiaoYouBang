//
//  ButtonCell.m
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ButtonCell.h"
@interface ButtonCell()

@property (nonatomic, strong) UIButton *all;
@property (nonatomic, strong) UIButton *memberMakr;
@property (nonatomic, strong) UIButton *schoolAndCompanyMark;
@property (nonatomic, strong) UIButton *companyMarkBack;

@end
@implementation ButtonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.all];
        [self.contentView addSubview:self.memberMakr];
        [self.contentView addSubview:self.schoolAndCompanyMark];
        [self.contentView addSubview:self.companyMarkBack];
        [self p_addMasonry];
    }
    return self;
}

-(void)p_addMasonry{
    [self.all mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentView).mas_offset(11.5);
        make.left.mas_equalTo(self.contentView).mas_offset(19.5);
        make.width.mas_equalTo(58.5);
        make.height.mas_equalTo(27);
    }];
    [self.memberMakr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.all);
        make.left.mas_equalTo(self.all).mas_offset(77);
        make.width.mas_equalTo(72.5);
        make.height.mas_equalTo(27);
    }];
    [self.schoolAndCompanyMark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.all);
        make.left.mas_equalTo(self.memberMakr).mas_offset(91);
        make.width.mas_equalTo(72.5);
        make.height.mas_equalTo(27);
    }];
    [self.companyMarkBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.all);
        make.left.mas_equalTo(self.schoolAndCompanyMark).mas_offset(91);
        make.width.mas_equalTo(72.5);
        make.height.mas_equalTo(27);
    }];
}

#pragma mark - Getter

-(UIButton *)all{
    if (!_all) {
        _all = [[UIButton alloc]init];
        //_all.backgroundColor = [UIColor redColor];
        [_all setTitle:@"全部" forState:UIControlStateNormal];
        [_all setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -58.5, 0.0, 0.0)];
        [_all setImage:[UIImage imageNamed:@"small_button"] forState:UIControlStateNormal];
        [_all setImage:[UIImage imageNamed:@"small_button_on"] forState:UIControlStateSelected];
        [_all setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, -_all.titleLabel.bounds.size.width)];
        [_all.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
        [_all setSelected:YES];

    }
    return _all;
}

-(UIButton *)memberMakr{
    if (!_memberMakr) {
        _memberMakr = [[UIButton alloc]init];
        [_memberMakr setTitle:@"职员评价" forState:UIControlStateNormal];
        [_memberMakr setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -72.5, 0.0, 0.0)];
        [_memberMakr setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [_memberMakr setImage:[UIImage imageNamed:@"button_on"] forState:UIControlStateSelected];
        [_memberMakr setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, -_memberMakr.titleLabel.bounds.size.width)];
        [_memberMakr.titleLabel setFont:[UIFont systemFontOfSize:13.0]];

    }
    return _memberMakr;
}

-(UIButton *)schoolAndCompanyMark{
    if (!_schoolAndCompanyMark) {
        _schoolAndCompanyMark = [[UIButton alloc]init];
        [_schoolAndCompanyMark setTitle:@"校企评价" forState:UIControlStateNormal];
        [_schoolAndCompanyMark setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -72.5, 0.0, 0.0)];
        [_schoolAndCompanyMark setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [_schoolAndCompanyMark setImage:[UIImage imageNamed:@"button_on"] forState:UIControlStateSelected];
        [_schoolAndCompanyMark setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, -_schoolAndCompanyMark.titleLabel.bounds.size.width)];
        [_schoolAndCompanyMark.titleLabel setFont:[UIFont systemFontOfSize:13.0]];

    }
    return _schoolAndCompanyMark;
}

-(UIButton *)companyMarkBack{
    if (!_companyMarkBack) {
        _companyMarkBack = [[UIButton alloc]init];
        [_companyMarkBack setTitle:@"企业回评" forState:UIControlStateNormal];
        [_companyMarkBack setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -72.5, 0.0, 0.0)];
        [_companyMarkBack setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [_companyMarkBack setImage:[UIImage imageNamed:@"button_on"] forState:UIControlStateSelected];
        [_companyMarkBack setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, -_companyMarkBack.titleLabel.bounds.size.width)];
        [_companyMarkBack.titleLabel setFont:[UIFont systemFontOfSize:13.0]];

    }
    return _companyMarkBack;
}

@end
