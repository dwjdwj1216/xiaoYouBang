//
//  ShareExperienceCell.m
//  TLChat
//
//  Created by 戴王炯 on 4/29/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ShareExperienceCell.h"
@interface ShareExperienceCell()

@property (nonatomic, strong) UIImageView *companyIcon;

@property (nonatomic, strong) UIImageView *iconPath;



@property (nonatomic, strong) UILabel *name;

@property (nonatomic, strong) UILabel *info;

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UILabel *subtitle;

@property (nonatomic, strong) UILabel *time;

@property (nonatomic, strong) UILabel *type;

@end
@implementation ShareExperienceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.companyIcon];
        [self.contentView addSubview:self.iconPath];
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.info];
        
        [self.contentView addSubview:self.rightView];
        
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.type];
        [self.contentView bringSubviewToFront:self.rightView];
        [self.rightView setUserInteractionEnabled:YES];
        [self p_addMasonry];
        
    }
    return self;
}

-(void)p_addMasonry{
    [self.iconPath mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(13);
        make.left.mas_equalTo(self.contentView).mas_offset(10);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconPath).mas_equalTo(15);
        make.left.mas_equalTo(self.iconPath.mas_right).mas_offset(10);
    }];
    [self.info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconPath.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(self.iconPath);
    }];
    [self.companyIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.info.mas_bottom).mas_equalTo(5);
        make.left.mas_equalTo(self.iconPath);
        make.width.and.height.mas_equalTo(63.5);
        
    }];
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.companyIcon);
        make.left.mas_equalTo(self.companyIcon.mas_right);
        make.width.mas_equalTo(280);
        make.height.mas_equalTo(63.5);
    }];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.companyIcon.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self.companyIcon);
    }];
    [self.type mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.time);
        make.right.mas_equalTo(self.rightView.mas_right);
    }];
}

-(void)setItem:(ShareExperienceItem *)item{
    _item = item;
    self.companyIcon.image = [UIImage imageNamed:item.companyIcon];
    self.iconPath.image = [UIImage imageNamed:item.iconPath];
    self.name.text = item.name;
    self.info.text = item.info;
    self.title.text = item.title;
    self.subtitle.text = item.subtitle;
    self.time.text = item.time;
    self.type.text = item.type;
}
#pragma mark - Getter


-(UIViewLinkmanTouch *)rightView{
    
    if (!_rightView) {
        _rightView = [[UIViewLinkmanTouch alloc]init];
        [_rightView addSubview:self.title];
        [_rightView addSubview:self.subtitle];
        [_rightView setBackgroundColor:[UIColor colorDefaultBlack]];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_rightView.mas_top);
            make.left.mas_equalTo(_rightView.mas_left).mas_offset(5);
        }];
        [self.subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.title.mas_bottom);
            make.left.mas_equalTo(self.title);
            make.width.mas_equalTo(270);
            make.height.mas_equalTo(63.5-20);
        }];
    }
    return _rightView;
}

-(UIImageView *)companyIcon{
    if (!_companyIcon) {
        _companyIcon = [[UIImageView alloc]init];
    }
    return _companyIcon;
}

-(UIImageView *)iconPath{
    if (!_iconPath) {
        _iconPath = [[UIImageView alloc]init];
    }
    return _iconPath;
}

-(UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc]init];
        _name.textColor = [UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.5 alpha:1];
        _name.font = [UIFont systemFontOfSize:16];
    }
    return _name;
}

-(UILabel *)info{
    if (!_info) {
        _info = [[UILabel alloc]init];
        _info.textColor = [UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.5 alpha:1];
        _info.font = [UIFont systemFontOfSize:16];
    }
    return _info;
}

-(UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc]init];
        _title.textColor = [UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.5 alpha:1];
        _title.font = [UIFont systemFontOfSize:16];
        //_title.backgroundColor = [UIColor colorDefaultBlack];
    }
    return _title;
}

-(UILabel *)subtitle{
    if (!_subtitle) {
        _subtitle = [[UILabel alloc]init];
        _subtitle.textColor = [UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.5 alpha:1];
        _subtitle.font = [UIFont systemFontOfSize:12];
        //_subtitle.backgroundColor =[UIColor colorDefaultBlack];
        _subtitle.lineBreakMode = NSLineBreakByTruncatingTail;
        _subtitle.numberOfLines = 0;
    }
    return _subtitle;
}
-(UILabel *)time{
    if (!_time) {
        _time = [[UILabel alloc]init];
        _time.textColor = [UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.5 alpha:1];
        _time.font = [UIFont systemFontOfSize:12];
    }
    return _time;
}

-(UILabel *)type{
    if (!_type) {
        _type = [[UILabel alloc]init];
        _type.textColor = [UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.5 alpha:1];
        _type.font = [UIFont systemFontOfSize:12];
    }
    return _type;
}
@end
