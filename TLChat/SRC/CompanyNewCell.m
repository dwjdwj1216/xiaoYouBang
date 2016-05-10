//
//  CompanyNewCell.m
//  TLChat
//
//  Created by 戴王炯 on 4/27/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyNewCell.h"

@interface CompanyNewCell ()

@property (nonatomic, strong) UIImageView *icon;

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UILabel *time;

@end

@implementation CompanyNewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.time];
        
        [self p_addMasonry];
    }
    return self;
}

- (void)setCompanyNew:(CompanyNew *)companyNew{
    _companyNew = companyNew;
    [self.icon setImage:[UIImage imageNamed:companyNew.iconPath]];
    [self.title setText:companyNew.title];
    [self.time setText:companyNew.time];
}

- (void)p_addMasonry
{
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(12.0f);
        make.top.mas_equalTo(self.contentView).mas_offset(10);
        make.width.mas_equalTo(115);
        make.height.mas_equalTo(73);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.icon).mas_offset(130.5);
        make.top.mas_equalTo(self.contentView).mas_offset(11.5);
        make.width.mas_equalTo(220);
    }];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.title).mas_offset(57.5);
        make.left.mas_equalTo(self.icon).mas_offset(133);
    }];
}



#pragma mark - Getter
-(UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc]init];
    }
    return _icon;
}

-(UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc]init];
        [_title setTextColor:[UIColor colorWithRed:18.0/255.0 green:18.0/255.0 blue:18.0/255.0 alpha:1]];
        [_title setFont:[UIFont systemFontOfSize:17]];
        _title.numberOfLines = 0;
        _title.lineBreakMode = NSLineBreakByCharWrapping;
    }
    return _title;
}

-(UILabel *)time{
    if (!_time) {
        _time = [[UILabel alloc]init];
        [_time setTextColor:[UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1]];
        [_time setFont:[UIFont systemFontOfSize:11]];
    }
    return _time;
}

@end
