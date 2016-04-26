//
//  TLBannerCell.m
//  TLChat
//
//  Created by 戴王炯 on 4/22/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLBannerCell.h"

@implementation TLBannerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setAccessoryType:UITableViewCellAccessoryNone];
        [self.contentView addSubview:self.bannerView];
        
        [self p_addMasonry];
    }
    return self;
    
}

#pragma mark - Private Methods
- (void)p_addMasonry
{
    /*
     [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.mas_equalTo(self.contentView).mas_offset(15.0f);
     make.centerY.mas_equalTo(self.contentView);
     make.width.and.height.mas_equalTo(25.0f);
     }];
     [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
     make.centerY.mas_equalTo(self.iconImageView);
     make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(15.0f);
     make.right.mas_lessThanOrEqualTo(self.contentView).mas_offset(15.0f);
     }];
     [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
     make.right.mas_equalTo(self.contentView);
     make.centerY.mas_equalTo(self.iconImageView);
     make.width.and.height.mas_equalTo(31);
     }];
     [self.midLabel mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.mas_greaterThanOrEqualTo(self.titleLabel.mas_right).mas_offset(15);
     make.right.mas_equalTo(self.rightImageView.mas_left).mas_offset(-5);
     make.centerY.mas_equalTo(self.iconImageView);
     }];
     [self.redPointView mas_makeConstraints:^(MASConstraintMaker *make) {
     make.centerX.mas_equalTo(self.rightImageView.mas_right).mas_offset(1);
     make.centerY.mas_equalTo(self.rightImageView.mas_top).mas_offset(1);
     make.width.and.height.mas_equalTo(REDPOINT_WIDTH);
     }];
     */
}

- (void)setBannerView:(BannerView *)bannerView{
    if (!_bannerView ) {
        _bannerView = bannerView;
    }
}

@end
