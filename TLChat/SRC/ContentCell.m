//
//  ContentCell.m
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ContentCell.h"
@interface ContentCell()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *name;

@property (nonatomic, strong) UILabel *content;

@property (nonatomic, strong) UILabel *time;

@property (nonatomic, strong) UILabel *type;

@end
@implementation ContentCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.type];
        [self p_addMasonry];
    }
    return self;
}
-(void)p_addMasonry{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(self.contentView).mas_offset(15);
        make.width.and.height.mas_equalTo(35);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(22);
        make.top.mas_equalTo(self.iconImageView).mas_offset(8);
        make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(17);
       // make.right.mas_equalTo(self.contentView).with.offset(-(375-67-self.name.width));
    }];
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.name.mas_bottom).mas_offset(13);
        make.left.mas_equalTo(self.iconImageView);
        make.right.mas_equalTo(self.contentView).mas_offset(-10);
        make.bottom.mas_equalTo(self.contentView).mas_offset(-30);
        //make.height.mas_equalTo(74.5);
    }];
    
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.content.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self.iconImageView);
    }];
    [self.type mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.time);
        make.right.mas_equalTo(self.contentView).mas_offset(-10);
    }];
    
}
- (void)setItem:(ContentItem *)item{
    _item = item;
    [self.iconImageView setImage:[UIImage imageNamed:item.iconPath]];
    [self.name setText:item.name];
    [self.content setText:item.content];
    [self.time setText:item.time];
    [self.type setText:item.type];
}
#pragma mark - Getter
- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
    }
    return _iconImageView;
}

-(UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc]init];
        [_name setFont:[UIFont systemFontOfSize:13]];
        [_name setTextColor:[UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:2]];
    }
    return _name;
}

-(UILabel *)content{
    if (!_content) {
        _content = [[UILabel alloc]init];
        [_content setNumberOfLines:0];
        [_content setLineBreakMode:NSLineBreakByCharWrapping];
        [_content setFont:[UIFont systemFontOfSize:14]];
        [_content setTextColor:[UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:1]];
        _content.preferredMaxLayoutWidth = 350;
    }
    return _content;
}

-(UILabel *)time{
    if (!_time) {
        _time = [[UILabel alloc]init];
        [_time setFont:[UIFont systemFontOfSize:13]];
        [_time setTextColor:[UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1]];
    }
    return _time;
}
-(UILabel *)type{
    if (!_type) {
        _type = [[UILabel alloc]init];
        [_type setFont:[UIFont systemFontOfSize:13]];
        [_type setTextColor:[UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1]];
    }
    return _type;
}
@end
