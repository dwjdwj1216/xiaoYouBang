//
//  ShareCell.m
//  TLChat
//
//  Created by 戴王炯 on 4/24/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ShareCell.h"
#import "ShareCellFooter.h"
@interface ShareCell()

@property (nonatomic, strong) ShareCellFooter *shareCellFooter;

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *name;

@property (nonatomic, strong) UILabel *fromAndType;

@property (nonatomic, strong) UIView *header;
//左上角的来自
@property (nonatomic, strong) UILabel *from;
//右上角的类型
@property (nonatomic, strong) UILabel *type;
//文字简介
@property (nonatomic, strong) UILabel *info;
//下端的三个按钮
@property (nonatomic, strong) UIView *footerLeft;

@property (nonatomic, strong) UIView *footerMid;

@property (nonatomic, strong) UIView *footerRight;
//位置的小图标
@property (nonatomic, strong) UIImageView *location;
//发布时间
@property (nonatomic, strong) UILabel *time;

@property (nonatomic, strong) UIImageView *leftView;

@property (nonatomic, strong) UIView *rightView;

@end

@implementation ShareCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.header];
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.fromAndType];
        [self.contentView addSubview:self.info];
        [self.contentView addSubview:self.leftView];
        [self.contentView addSubview:self.rightView];
        [self.contentView addSubview:self.footerLeft];
        [self.contentView addSubview:self.footerMid];
        [self.contentView addSubview:self.footerRight];
        [self.contentView addSubview:self.location];
        [self.contentView addSubview:self.time];
        [self p_addMasonry];
    }
    return self;
}

- (void)setItem:(UserInfoItem *)item
{
    _item = item;
    [self.iconImageView setImage:[UIImage imageNamed:item.iconPath]];
    
    
    NSDictionary *dicS = @{NSForegroundColorAttributeName:[UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:16]};
    NSMutableAttributedString *name = [[NSMutableAttributedString alloc]initWithString:item.name attributes:dicS];
    [self.name setAttributedText:name];
    
    NSDictionary *dicS2 = @{NSForegroundColorAttributeName:[UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:12]};
    NSMutableAttributedString *fromAndType = [[NSMutableAttributedString alloc]initWithString:item.fromAndType attributes:dicS2];
    [self.fromAndType setAttributedText:fromAndType];
}

-(void)p_addMasonry{
    /*[self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];*/
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.header.mas_bottom).mas_offset(13);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(42.5);
        make.height.mas_equalTo(42.5);
    }];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.type.right-5);
        make.top.mas_equalTo(self.iconImageView.top).mas_offset(40);
    }];
    [self.location mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImageView.top).mas_offset(40+27.5);
        make.left.mas_equalTo(42.5+15);
        make.width.mas_equalTo(10);
        make.height.mas_equalTo(15);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImageView.top).mas_equalTo(40);
        make.left.mas_equalTo(42.5+15);
    }];
    [self.fromAndType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40+27.5);
        make.left.mas_equalTo(42.5+30);
    }];
    [self.info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40+42.5+5);
        make.left.mas_equalTo(10);
    }];
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40+42.5+5+20);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(63.5);
        make.height.mas_equalTo(63.5);
    }];
    /*[self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40+42.5+20+25);
        make.left.mas_equalTo(10+63.5);
    }];*/
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
-(UIView *)header{
    if (!_header) {
        _header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 27)];
        _header.backgroundColor = [UIColor colorDefaultBlack];
        [_header addSubview:self.from];
        [_header addSubview:self.type];
        [self.from mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_header.top+5);
            make.left.mas_equalTo(_header.left+5);
        }];
        [self.type mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.from);
            make.right.mas_equalTo(-5);
        }];
    }
    return _header;
}

-(UILabel *)from{
    if (!_from) {
        _from = [[UILabel alloc]init];
        NSDictionary *dicS = @{
            NSForegroundColorAttributeName:[UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:14]
        };
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"公司 > 阿里巴巴" attributes:dicS];
        [_from setAttributedText:str];
    }
    return _from;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

- (UILabel *)name
{
    if (!_name) {
        _name = [[UILabel alloc] init];
    }
    return _name;
}

- (UILabel *)fromAndType{
    if (!_fromAndType) {
        _fromAndType = [[UILabel alloc]init];
    }
    return _fromAndType;
}

-(UILabel *)info{
    if (!_info) {
        _info = [[UILabel alloc]init];
        NSDictionary *dicS = @{NSForegroundColorAttributeName:[UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:16]
                               };
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"分享了他的求职经历：我的阿里求职路" attributes:dicS];
        _info.attributedText = str;
    }
    return _info;
}

-(UIImageView *)leftView{
    if (!_leftView) {
        _leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"article"]];
    }
    return _leftView;
}

-(UIView *)rightView{
    if (!_rightView) {
        _rightView = [[UIView alloc]initWithFrame:CGRectMake(73.5, 40+42.5+5+20, 280, 63.5)];
        
        UILabel *title = [[UILabel alloc]init];
        UILabel *subTitle = [[UILabel alloc]init];
        NSDictionary *dicS = @{NSForegroundColorAttributeName:[UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:16]
                               };
        NSMutableAttributedString *titleStr = [[NSMutableAttributedString alloc]initWithString:@"我的阿里求职路" attributes:dicS];
        title.attributedText = titleStr;

        NSDictionary *dicS2 = @{NSForegroundColorAttributeName:[UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:12]
                                };
        NSMutableAttributedString *subTitleStr = [[NSMutableAttributedString alloc]initWithString:@"阿里杭州校招27号落下了帷幕，回想这六天的点点滴滴，感慨颇多，我并不是在这里炫耀拿......" attributes:dicS2];
        subTitle.attributedText = subTitleStr;
        subTitle.numberOfLines = 0;
        subTitle.lineBreakMode = NSLineBreakByCharWrapping;
        [_rightView setBackgroundColor:[UIColor colorDefaultBlack]];
        [_rightView addSubview:title];
        [_rightView addSubview:subTitle];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(10);
        }];
        [subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(260);
            make.height.mas_equalTo(63.5-20);
        }];
    }
    
    return _rightView;
}

-(ShareCellFooter *)shareCellFooter{
    if(!_shareCellFooter){
        _shareCellFooter = [[ShareCellFooter alloc]init];
    }
    return _shareCellFooter;
}

-(UIView *)footerLeft{
    if (!_footerLeft) {
        
        _footerLeft = [[UIView alloc]initWithFrame:CGRectMake(0, 183.5, 125, 27.5)];
        
        [self setBorderWithView:_footerLeft top:YES left:NO bottom:NO right:YES borderColor:[UIColor colorDefaultBlack] borderWidth:1];
        //_footerLeft.backgroundColor = [UIColor redColor];
        UIImageView *left = [[UIImageView alloc]initWithImage:self.shareCellFooter.leftImage];
        [_footerLeft addSubview:left];
        [_footerLeft addSubview:self.shareCellFooter.leftLabel];
        [left mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(43);
        }];
        [self.shareCellFooter.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(3);
            make.left.mas_equalTo(43+15);
        }];

    }
    return _footerLeft;
}

-(UIView *)footerMid{
    if (!_footerMid) {
        _footerMid = [[UIView alloc]initWithFrame:CGRectMake(125, 183.5, 125, 27.5)];
       // _footerMid.backgroundColor = [UIColor greenColor];
        [self setBorderWithView:_footerMid top:YES left:NO bottom:NO right:YES borderColor:[UIColor colorDefaultBlack] borderWidth:1];
        UIImageView *mid = [[UIImageView alloc]initWithImage:self.shareCellFooter.midImage];
        [_footerMid addSubview:mid];
        [_footerMid addSubview:self.shareCellFooter.midLabel];
        
        [mid mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(4);
            make.left.mas_equalTo(43);
        }];
        [self.shareCellFooter.midLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(4);
            make.left.mas_equalTo(43+18);
        }];
    }
    return _footerMid;
}

-(UIView *)footerRight{
    if (!_footerRight) {
        _footerRight = [[UIView alloc]initWithFrame:CGRectMake(250, 183.5, 125, 27.5)];
        //_footerRight.backgroundColor = [UIColor blueColor];
        [self setBorderWithView:_footerRight top:YES left:NO bottom:NO right:NO borderColor:[UIColor colorDefaultBlack] borderWidth:1];
        UIImageView *right = [[UIImageView alloc]initWithImage:self.shareCellFooter.rightImage];
        [_footerRight addSubview:right];
        [_footerRight addSubview:self.shareCellFooter.rightLabel];
        [right mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(43);
        }];
        [self.shareCellFooter.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(4);
            make.left.mas_equalTo(43+15);
        }];
    }
    return _footerRight;
}

-(UIImageView *)location{
    if (!_location) {
        _location = [[UIImageView alloc]init];
        [_location setImage:[UIImage imageNamed:@"location"]];
    }
    return _location;
}

-(UILabel *)type{
    if (!_type) {
        _type = [[UILabel alloc]init];
        NSDictionary *dicS = @{NSForegroundColorAttributeName:[UIColor colorWithRed:43.0/255.0 green:135.0/255.0 blue:66.0/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:14]
                               };
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"求职经历" attributes:dicS];
        _type.attributedText = str;
    }
    return _type;
}

-(UILabel *)time{
    if (!_time) {
        NSDictionary *dicS = @{NSForegroundColorAttributeName:[UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:12]};
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"5分钟前" attributes:dicS];
        _time = [[UILabel alloc]init];
        
        _time.attributedText = str;
    }
    return _time;
}

@end
