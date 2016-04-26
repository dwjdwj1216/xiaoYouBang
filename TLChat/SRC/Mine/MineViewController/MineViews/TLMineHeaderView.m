//
//  TLMineHeaderView.m
//  TLChat
//
//  Created by 戴王炯 on 4/22/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLMineHeaderView.h"

#import <UIImageView+WebCache.h>
#import "TLUserHelper.h"
@interface TLMineHeaderView ()

@property (nonatomic, strong) UIImageView *avatarImageView;

@property (nonatomic, strong) UILabel *nikenameLabel;

@property (nonatomic, strong) UILabel *whenJoin;

@property (nonatomic, strong) UILabel *moreLabel;

@property (nonatomic, strong) UILabel *attentionCount;

@property (nonatomic, strong) UILabel *collectionCount;

@property (nonatomic, strong) TLUserHelper *userHelper;
@end

@implementation TLMineHeaderView
-(TLMineHeaderView *)init{
    if (self = [super init]) {
        [self setFrame:CGRectMake(0, 66, 375, 127.5)];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setUser:[TLUserHelper sharedHelper].user];
        [self addSubview:self.avatarImageView];
        [self addSubview:self.nikenameLabel];
        [self addSubview:self.whenJoin];
        [self addSubview:self.moreLabel];
        [self addSubview:self.attentionCount];
        [self addSubview:self.collectionCount];
        [self addMasonry];
    }

    return self;
}

-(void)addMasonry{
    
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(13.75);
        make.top.mas_equalTo(13.75);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    
    [self.nikenameLabel setContentCompressionResistancePriority:100 forAxis:UILayoutConstraintAxisHorizontal];
    [self.nikenameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImageView.mas_right).mas_offset(20);
        make.bottom.mas_equalTo(self.avatarImageView.mas_centerY).mas_offset(-8.75);
    }];
    
    [self.whenJoin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nikenameLabel);
        make.top.mas_equalTo(self.avatarImageView.mas_centerY).mas_offset(5.0);
    }];
    
    [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(-30);
    }];
    [self.attentionCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(70);
        make.top.mas_equalTo(102.5);
    }];
    
    [self.collectionCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-70);
        make.top.mas_equalTo(102.5);
    }];
    
}

- (void) setUser:(TLUser *)user
{
    _user = user;
    if (user.avatarPath) {
        [self.avatarImageView setImage:[UIImage imageNamed:user.avatarPath]];
    }
    else{
        [self.avatarImageView sd_setImageWithURL:TLURL(user.avatarURL) placeholderImage:[UIImage imageNamed:DEFAULT_AVATAR_PATH]];
    }
    [self.nikenameLabel setText:user.nikeName];
    [self.whenJoin setText:user.whenJoin ? [user.whenJoin stringByAppendingString:@"加入"] : @""];
}
#pragma mark - Getter
- (UIImageView *) avatarImageView
{
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc] init];
        [_avatarImageView.layer setMasksToBounds:YES];
        [_avatarImageView.layer setCornerRadius:5.0f];
    }
    return _avatarImageView;
}

- (UILabel *) nikenameLabel
{
    if (_nikenameLabel == nil) {
        _nikenameLabel = [[UILabel alloc] init];
        [_nikenameLabel setFont:[UIFont fontMineNikename]];
    }
    return _nikenameLabel;
}

- (UILabel *) whenJoin
{
    if (_whenJoin == nil) {
        _whenJoin = [[UILabel alloc] init];
        [_whenJoin setFont:[UIFont fontMineUsername]];
    }
    return _whenJoin;
}

- (UILabel *)moreLabel
{
    if (_moreLabel == nil) {
        self.moreLabel = [[UILabel alloc] init];
        self.moreLabel.text = @"个人资料";
        [self.moreLabel setFont:[UIFont fontMineUsername]];
    }
    return _moreLabel;
}
- (UILabel*)attentionCount
{
    if (_attentionCount == nil) {
        _attentionCount = [[UILabel alloc]init];
        _attentionCount.text = [NSString stringWithFormat:@"%ld 关注",self.user.attentions];
    }
    return _attentionCount;
}
- (UILabel*)collectionCount
{
    if (_collectionCount == nil) {
        _collectionCount = [[UILabel alloc]init];
        _collectionCount.text = [NSString stringWithFormat:@"%ld 收藏",self.user.collections];
    }
    return _collectionCount;
}

@end
