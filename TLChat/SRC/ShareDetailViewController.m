//
//  ShareDetailViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/29/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ShareDetailViewController.h"

@interface ShareDetailViewController ()

@property (nonatomic, strong) UIImageView *companyIcon;

@property (nonatomic, strong) UIView *info;

@property (nonatomic, strong) UIImageView *icon;

@property (nonatomic, strong) UILabel *name;

@property (nonatomic, strong) UILabel *textTitle;

@property (nonatomic, strong) UILabel *time;

@property (nonatomic, strong) UILabel *readNumber;

@property (nonatomic, strong) UILabel *content;

@property (nonatomic, strong) UIScrollView *textView;

@property (nonatomic, strong) UIScrollView *mainView;
@end

@implementation ShareDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"分享详情"];
    //[self.view addSubview:self.mainView];
    [self.view addSubview:self.companyIcon];
    [self.view addSubview:self.info];
    [self.view addSubview:self.textView];
    self.textView.contentSize = CGSizeMake(WIDTH_SCREEN, 1100);
    [self p_addMasonry];
    // Do any additional setup after loading the view.
}
-(void)p_addMasonry{
    [self.companyIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(64);
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(WIDTH_SCREEN);
        make.height.mas_equalTo(140);
    }];
    [self.info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.companyIcon.mas_bottom);
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(WIDTH_SCREEN);
        make.height.mas_equalTo(60.5);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.info.mas_bottom);
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(WIDTH_SCREEN);
        make.height.mas_equalTo(HEIGHT_SCREEN);
    }];
    
}
-(void)setItem:(ShareExperienceItem *)item{
    _item = item;
    self.companyIcon.image = [UIImage imageNamed:@"banner"];
    self.icon.image = [UIImage imageNamed:item.iconPath];
    self.name.text = item.name;
    self.textTitle.text = item.title;
    self.readNumber.text = [NSString stringWithFormat:@"阅读 %@",item.readNumber];
    self.content.text = item.subtitle;
    self.time.text = item.time;
}
#pragma mark - Getter
-(UIScrollView *)textView{
    if (!_textView) {
        _textView = [[UIScrollView alloc]init];
        _textView.showsHorizontalScrollIndicator = NO;
        [_textView setBackgroundColor:[UIColor whiteColor]];
        [_textView setScrollEnabled:YES];
        
        [_textView addSubview:self.textTitle];
        [_textView addSubview:self.time];
        [_textView addSubview:self.readNumber];
        [_textView addSubview:self.content];
        [self.textTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_textView).mas_offset(21);
            make.left.mas_equalTo(_textView).mas_offset(20);
        }];
        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.textTitle.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(self.textTitle.mas_left);
        }];
        [self.readNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.time);
            make.left.mas_equalTo(self.time.mas_right).mas_offset(15);
        }];
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.time.mas_bottom).mas_offset(10);
            make.left.mas_equalTo(self.time);
            make.width.mas_equalTo(WIDTH_SCREEN -20 -10);
        }];
        
    }
    return _textView;
}

-(UIView *)info{
    if (!_info) {
        _info = [[UIView alloc]init];
        [_info setBackgroundColor:[UIColor whiteColor]];
        [_info addSubview:self.icon];
        [_info addSubview:self.name];
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_info);
            make.left.mas_equalTo(_info).mas_offset(19.5);
            make.width.and.height.mas_equalTo(44);
        }];
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_info);
            make.left.mas_equalTo(self.icon.mas_right).mas_offset(13);
        }];
        
    }
    return _info;
}

-(UILabel *)content{
    if (!_content) {
        _content = [[UILabel alloc]init];
        _content.lineBreakMode = NSLineBreakByTruncatingTail;
        _content.numberOfLines = 0;
        _content.font = [UIFont systemFontOfSize:17.5];
        _content.textColor = [UIColor colorWithRed:111.0/255.0 green:111.0/255.0 blue:111.0/255.0 alpha:1];
    }
    return _content;
}

-(UIImageView *)companyIcon{
    if (!_companyIcon) {
        _companyIcon = [[UIImageView alloc]init];
    }
    return _companyIcon;
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
        _name.font = [UIFont systemFontOfSize:17.5];
        _name.textColor = [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:1];
    }
    return _name;
}

-(UILabel *)textTitle{
    if (!_textTitle) {
        _textTitle = [[UILabel alloc]init];
        _textTitle.font = [UIFont systemFontOfSize:24];
        _textTitle.textColor = [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:1];
    }
    return _textTitle;
}

-(UILabel *)readNumber{
    if (!_readNumber) {
        _readNumber = [[UILabel alloc]init];
        _readNumber.font = [UIFont systemFontOfSize:13];
        _readNumber.textColor = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1];
    }
    return _readNumber;
}

-(UILabel *)time{
    if (!_time) {
        _time = [[UILabel alloc]init];
        _time.font = [UIFont systemFontOfSize:13];
        _time.textColor = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1];
    }
    return _time;
}
@end
