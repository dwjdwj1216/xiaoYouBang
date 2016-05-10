//
//  CommentCell.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CommentCell.h"
@interface CommentCell()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *content;
@property (nonatomic, strong) UILabel *time;

@end
@implementation CommentCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.time];
        [self p_addMasonry];
    }
    return self;
}
-(void)p_addMasonry{
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(14.5);
        make.left.mas_equalTo(self.contentView).mas_equalTo(14.5);
        make.width.and.height.mas_equalTo(27.5);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.icon);
        make.left.mas_equalTo(self.icon.mas_right).mas_offset(8);
    }];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.name);
        make.right.mas_equalTo(self.contentView).mas_offset(-17);
    }];
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.icon.mas_bottom).mas_offset(15);
        make.left.mas_equalTo(self.icon);
        make.width.mas_equalTo(WIDTH_SCREEN-17-14.5);
    }];
}

-(void)setItem:(CommentItem *)item{
    _item = item;
    self.icon.image = [UIImage imageNamed:item.iconPath];
    self.name.text = item.name;
    self.time.text = item.time;
    self.content.text = item.content;
}
#pragma mark - Getter
-(UIImageView *)icon{
    if (!_icon) {
        self.icon = [[UIImageView alloc ]init];
    }
    return _icon;
}

-(UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc]init];
        _name.font = [UIFont systemFontOfSize:12];
        _name.textColor = [UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.0 alpha:1];
    }
    return _name;
}

-(UILabel *)content{
    if (!_content) {
        _content = [[UILabel alloc]init];
        _content.numberOfLines = 0;
        _content.lineBreakMode = NSLineBreakByWordWrapping;
        _content.font = [UIFont systemFontOfSize:17];
        _content.textColor = [UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.0 alpha:1];
    }
    return _content;
}

-(UILabel *)time{
    if (!_time) {
        _time = [[UILabel alloc ]init];
        _time.font = [UIFont systemFontOfSize:12];
        _time.textColor = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1];
    }
    return _time;
}
@end
