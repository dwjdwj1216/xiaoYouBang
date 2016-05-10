//
//  ContentCell.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "DetailContentCell.h"
@interface DetailContentCell()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *subTitle;
@property (nonatomic, strong) UILabel *time;
@end
@implementation DetailContentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.subTitle];
        [self.contentView addSubview:self.time];
        [self p_addMasonry];
    }
    return self;
}
- (void)p_addMasonry{
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(10);
        make.left.mas_equalTo(self.contentView).mas_offset(14.5);
        make.width.and.height.mas_equalTo(27.5);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.icon);
        make.left.mas_equalTo(self.icon.mas_right).mas_offset(5);
    }];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.name);
        make.right.mas_equalTo(self.contentView).mas_offset(-17);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.icon.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self.icon.mas_left);
    }];
    [self.subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.title.mas_bottom).mas_equalTo(5);
        make.left.mas_equalTo(self.title);
        make.width.mas_equalTo(WIDTH_SCREEN-12-12.5);
    }];
}

-(void)setItem:(CircleItem *)item{
    _item = item;
    self.icon.image = [UIImage imageNamed:item.iconPath];
    self.name.text = item.name;
    self.title.text = item.title;
    self.subTitle.text = item.subTitle;
    self.time.text = item.time;
}

-(UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc]init];
    }
    return _icon;
}

-(UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc]init];
        _name.font = [UIFont systemFontOfSize:12];
        _name.textColor = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1];
    }
    return _name;
}

-(UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc]init];
        _title.font = [UIFont systemFontOfSize:17];
        _title.textColor = [UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.0 alpha:1];
    }
    return _title;
}

-(UILabel *)subTitle{
    if (!_subTitle) {
        _subTitle = [[UILabel alloc]init];
        _subTitle.font = [UIFont systemFontOfSize:17];
        _subTitle.textColor = [UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.0 alpha:1];
        _subTitle.numberOfLines = 0;
        _subTitle.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _subTitle;
}

-(UILabel *)time{
    if (!_time) {
        _time = [[UILabel alloc]init];
        _time.font = [UIFont systemFontOfSize:12];
        _time.textColor = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1];
    }
    return _time;
}

@end
