//
//  TrendCell.m
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TrendCell.h"
@interface TrendCell()

@property(nonatomic, strong) UIImageView *pic;

@end

@implementation TrendCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.pic];
        [self p_addMasonry];
    }
    return self;
}

-(void)p_addMasonry{
    [self.pic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        //make.width.and.height.mas_equalTo(self.contentView);
        
    }];
}

-(void)setTrendPic:(TrendPic *)trendPic{
    _trendPic = trendPic;
    [self.pic setImage:[UIImage imageNamed:trendPic.picPath]];
}

#pragma  mark - Getter

- (UIImageView *)pic{
    if (!_pic) {
        _pic = [[UIImageView alloc]init];
    }
    return _pic;
}

@end
