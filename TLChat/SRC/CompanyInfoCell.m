//
//  CompanyInfoCell.m
//  TLChat
//
//  Created by 戴王炯 on 4/27/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyInfoCell.h"
@interface CompanyInfoCell ()

@property (nonatomic, strong) UIImageView *left;

@property (nonatomic, strong) UIImageView *right;

@property (nonatomic, strong) UILabel *infoLabel;

@end
@implementation CompanyInfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.left];
        [self.contentView addSubview:self.infoLabel];
        [self.contentView addSubview:self.right];
        [self p_addMasonry];
    }
    return self;
}

-(void)p_addMasonry{
    [self.left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
    }];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10+self.left.height);
        make.left.mas_equalTo(25);
        make.width.mas_equalTo(327);
    }];
    [self.right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.right.mas_equalTo(-10);
    }];
    
}

-(UIImageView *)left{
    if (!_left) {
        _left = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"quote_left"]];
    }
    return _left;
}

-(UIImageView *)right{
    if (!_right) {
        _right = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"quote_right"]];
    }
    return _right;
}

-(void)setInfo:(NSString *)info{
    _info = info;
    NSDictionary * dic = @{
                           NSFontAttributeName:[UIFont systemFontOfSize:14],
                           NSForegroundColorAttributeName:[UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.0 alpha:1]
                           };
    _infoLabel.numberOfLines = 0;
    _infoLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _infoLabel.attributedText = [[NSAttributedString alloc]initWithString:_info attributes:dic];
}

-(UILabel *)infoLabel{
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc]init];
    }
    return _infoLabel;
}
@end
