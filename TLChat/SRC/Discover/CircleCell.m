//
//  CircleCell.m
//  TLChat
//
//  Created by 戴王炯 on 4/30/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CircleCell.h"
@interface CircleCell()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *subTitle;
@property (nonatomic, strong) UILabel *time;
@property (nonatomic, strong) UILabel *comNum;
@property (nonatomic, strong) UIImageView *comment;
@end
@implementation CircleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.subTitle];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.comNum];
        [self.contentView addSubview:self.comment];
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
    [self.comNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).mas_offset(-2);
        make.right.mas_equalTo(self.contentView).mas_offset(-12);
    }];
    [self.comment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.comNum);
        make.right.mas_equalTo(self.comNum.mas_left).mas_equalTo(-3);
        make.width.mas_equalTo(14);
        make.height.mas_equalTo(13.5);
    }];
    
}

-(void)setItem:(CircleItem *)item{
    _item = item;
    self.icon.image = [UIImage imageNamed:item.iconPath];
    self.name.text = item.name;
    self.title.text = item.title;
    self.subTitle.text = item.subTitle;
    self.time.text = item.time;
    self.comNum.text = item.comNum;
}

-(UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc]init];
    }
    return _icon;
}

-(UIImageView *)comment{
    if (!_comment) {
        _comment = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"comments"]];
    }
    return _comment;
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
        _subTitle.font = [UIFont systemFontOfSize:14];
        _subTitle.textColor = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1];
        
        _subTitle.numberOfLines = 0;
        _subTitle.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _subTitle;
}

-(UILabel *)comNum{
    if (!_comNum) {
        _comNum = [[UILabel alloc]init];
        _comNum.font = [UIFont systemFontOfSize:11];
        _comNum.textColor = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1];
    }
    return _comNum;
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
