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


@property (nonatomic, strong) UILabel *attentionCount;

@property (nonatomic, strong) UILabel *collectionCount;

@property (nonatomic, strong) TLUserHelper *userHelper;
@end

@implementation TLMineHeaderView
-(TLMineHeaderView *)init{
    if (self = [super init]) {
        [self setFrame:CGRectMake(0, 64, 375, 127.5)];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setUser:[TLUserHelper sharedHelper].user];
        [self addSubview:self.header];
        [self addSubview:self.left];
        [self addSubview:self.right];
        [self bringSubviewToFront:self.left];
        [self bringSubviewToFront:self.right];
        [self bringSubviewToFront:self.header];
        //[self addMasonry];
        //[self setBorderWithView:self.header top:NO left:NO bottom:YES right:NO borderColor:[UIColor yellowColor] borderWidth:1.0];
        [self setBorderWithView:self.left top:YES left:NO bottom:NO right:YES borderColor:[UIColor colorDefaultBlack] borderWidth:1.0];
        [self setBorderWithView:self.right top:YES left:YES bottom:NO right:NO borderColor:[UIColor colorDefaultBlack] borderWidth:1.0];
    }

    return self;
}

-(void)addMasonry{
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(77.5);
    }];
    [self.left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.header.mas_bottom).mas_offset(1);
        make.left.mas_equalTo(self);
        make.width.mas_equalTo(WIDTH_SCREEN/2);
        make.height.mas_equalTo(50);
    }];
    [self.right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.left);
        make.left.mas_equalTo(self.left.mas_right).mas_offset(1);
        make.width.mas_equalTo(WIDTH_SCREEN/2);
        make.height.mas_equalTo(50);
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
#pragma mark setOneSideBoarder
- (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (top) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}

#pragma mark - Getter
-(UIViewLinkmanTouch *)header{
    if (!_header) {
        _header = [[UIViewLinkmanTouch alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 77.5)];
        [_header addSubview:self.avatarImageView];
        [_header addSubview:self.nikenameLabel];
        [_header addSubview:self.whenJoin];
        [_header addSubview:self.moreLabel];
        [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_header).mas_offset(15);
            make.top.mas_equalTo(_header).mas_offset(13.5);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(50);
        }];
        [self.nikenameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.avatarImageView.mas_top).mas_offset(5);
            make.left.mas_equalTo(self.avatarImageView.mas_right).mas_offset(15);
        }];
        [self.whenJoin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nikenameLabel.mas_bottom).mas_offset(5);
            make.left.mas_equalTo(self.nikenameLabel);
        }];
        [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.avatarImageView);
            make.right.mas_equalTo(_header).mas_offset(-20);
        }];
    }
    return _header;
}

-(UIViewLinkmanTouch *)left{
    if (!_left) {
        _left = [[UIViewLinkmanTouch alloc]initWithFrame:CGRectMake(0, 77.5, WIDTH_SCREEN/2, 50)];
        UILabel *title = [[UILabel alloc]init];
        title.textColor = [UIColor colorWithRed:146.0/255.0 green:146.0/255.0 blue:146.0/255.0 alpha:1];
        title.font = [UIFont systemFontOfSize:15];
        title.text = @"关注";
        [_left addSubview:self.attentionCount];
        [_left addSubview:title];
        [self.attentionCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_left);
            make.left.mas_equalTo(_left).mas_offset(75.5);
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.attentionCount);
            make.left.mas_equalTo(self.attentionCount.mas_right).mas_offset(5);
        }];
    
    }
    return _left;
}
-(UIViewLinkmanTouch *)right{
    if (!_right) {
        _right = [[UIViewLinkmanTouch alloc]initWithFrame:CGRectMake(WIDTH_SCREEN/2, 77.5, WIDTH_SCREEN/2, 50)];
        UILabel *title = [[UILabel alloc]init];
        title.textColor = [UIColor colorWithRed:146.0/255.0 green:146.0/255.0 blue:146.0/255.0 alpha:1];
        title.font = [UIFont systemFontOfSize:15];
        title.text = @"收藏";
        [_right addSubview:self.collectionCount];
        [_right addSubview:title];
        [self.collectionCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_right);
            make.left.mas_equalTo(_right).mas_offset(75.5);
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.collectionCount);
            make.left.mas_equalTo(self.collectionCount.mas_right).mas_offset(5);
        }];
        
    }
    return _right;
}

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
        [_nikenameLabel setFont:[UIFont systemFontOfSize:17]];
        _nikenameLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];
    }
    return _nikenameLabel;
}

- (UILabel *) whenJoin
{
    if (_whenJoin == nil) {
        _whenJoin = [[UILabel alloc] init];
        [_whenJoin setFont:[UIFont systemFontOfSize:12.5]];
        _whenJoin.textColor = [UIColor colorWithRed:146.0/255.0 green:146.0/255.0 blue:146.0/255.0 alpha:1];
    }
    return _whenJoin;
}

- (UILabel *)moreLabel
{
    if (_moreLabel == nil) {
        self.moreLabel = [[UILabel alloc] init];
        self.moreLabel.text = @"个人资料";
        [self.moreLabel setFont:[UIFont systemFontOfSize:12.5]];
        _moreLabel.textColor = [UIColor colorWithRed:146.0/255.0 green:146.0/255.0 blue:146.0/255.0 alpha:1];
    }
    return _moreLabel;
}
- (UILabel*)attentionCount
{
    if (_attentionCount == nil) {
        _attentionCount = [[UILabel alloc]init];
        _attentionCount.text = [NSString stringWithFormat:@"%ld",self.user.attentions];
        _attentionCount.textColor = [UIColor blackColor];
        _attentionCount.font = [UIFont systemFontOfSize:15];
    }
    return _attentionCount;
}
- (UILabel*)collectionCount
{
    if (_collectionCount == nil) {
        _collectionCount = [[UILabel alloc]init];
        _collectionCount.text = [NSString stringWithFormat:@"%ld",self.user.collections];
        _collectionCount.textColor = [UIColor blackColor];
        _collectionCount.font = [UIFont systemFontOfSize:15];
    }
    return _collectionCount;
}

@end
