//
//  NewShareExperienceViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/29/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "NewShareExperienceViewController.h"

@interface NewShareExperienceViewController ()

@property (nonatomic, strong) UIView *header;

@property (nonatomic, strong) UIView *mid;

@property (nonatomic, strong) UITextView *experienceText;

@property (nonatomic, strong) UITextField *titleText;

@end

@implementation NewShareExperienceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"发布分享"];
    [self.titleText becomeFirstResponder];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    [self.view addSubview:self.header];
    [self.view addSubview:self.mid];
    [self.view addSubview:self.titleText];
    [self.view addSubview:self.experienceText];
    [self p_addMasonry];
    [self setBorderWithView:self.header top:NO left:NO bottom:YES right:NO borderColor:[UIColor colorDefaultBlack] borderWidth:1.5];
}

-(void)p_addMasonry{
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(WIDTH_SCREEN);
        make.height.mas_equalTo(35);
    }];
    [self.mid mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.header.mas_bottom).mas_offset(1);
        make.left.mas_equalTo(self.header);
        make.width.mas_equalTo(WIDTH_SCREEN);
        make.height.mas_equalTo(98);
    }];
    [self.titleText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mid.mas_bottom).mas_offset(20);
        make.left.mas_equalTo(self.header);
        make.width.mas_equalTo(WIDTH_SCREEN);
        make.height.mas_equalTo(46);
    }];
    [self.experienceText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleText.mas_bottom).mas_offset(20);
        make.left.mas_equalTo(self.header);
        make.width.mas_equalTo(WIDTH_SCREEN);
        make.height.mas_equalTo(386);
    }];
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
#pragma mark - Event Response
- (void)rightBarButtonDown:(UIBarButtonItem *)sender
{
    
}

#pragma mark - Getter

-(UIView *)header{
    if (!_header) {
        _header = [[UIView alloc]init];
        _header.backgroundColor = [UIColor whiteColor];
        UILabel *leftLabel = [[UILabel alloc]init];
        UILabel *midLabel = [[UILabel alloc]init];
        leftLabel.text = @"分享对象:";
        midLabel.text = self.companyName;
        [_header addSubview:leftLabel];
        [_header addSubview:midLabel];
        [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_header);
            make.left.mas_equalTo(_header).mas_offset(25);
        }];
        [midLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(leftLabel);
            make.centerX.mas_equalTo(_header);
        }];
    }
    return _header;
}

-(UIView *)mid{
    if (!_mid) {
        _mid = [[UIView alloc]init];
        _mid.backgroundColor = [UIColor whiteColor];
        UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"article"]];
        [icon.layer setCornerRadius:5.0];
        UIButton *jobExperience = [[UIButton alloc]init];
        UIButton *workExperience = [[UIButton alloc]init];
        UIButton *otherExperience = [[UIButton alloc]init];
        UILabel *title = [[UILabel alloc]init];
        [jobExperience setTitle:@"求职经历" forState:UIControlStateNormal];
        //[jobExperience setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [jobExperience setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -72.5, 0.0, 0.0)];
        [jobExperience setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [jobExperience setImage:[UIImage imageNamed:@"button_on"] forState:UIControlStateSelected];
        [jobExperience setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, -jobExperience.titleLabel.bounds.size.width)];
        [jobExperience.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
        [jobExperience setSelected:YES];
        
        [workExperience setTitle:@"工作经历" forState:UIControlStateNormal];
        [workExperience setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -72.5, 0.0, 0.0)];
        [workExperience setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [workExperience setImage:[UIImage imageNamed:@"button_on"] forState:UIControlStateSelected];
        [workExperience setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, -workExperience.titleLabel.bounds.size.width)];
        [workExperience.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
        
        [otherExperience setTitle:@"其他经历" forState:UIControlStateNormal];
        [otherExperience setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -72.5, 0.0, 0.0)];
        [otherExperience setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [otherExperience setImage:[UIImage imageNamed:@"button_on"] forState:UIControlStateSelected];
        [otherExperience setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, -otherExperience.titleLabel.bounds.size.width)];
        [otherExperience.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
        
        title.text = @"分享类别：";
        [_mid addSubview:icon];
        [_mid addSubview:jobExperience];
        [_mid addSubview:workExperience];
        [_mid addSubview:otherExperience];
        [_mid addSubview:title];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_mid);
            make.left.mas_equalTo(_mid).mas_offset(25);
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(icon).mas_equalTo(10);
            make.left.mas_equalTo(icon.mas_right).mas_offset(35);
        }];
        [jobExperience mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(title.mas_bottom).mas_offset(5);
            make.left.mas_equalTo(title);
            make.width.mas_equalTo(72.5);
            make.height.mas_equalTo(27);
        }];
        [workExperience mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(jobExperience);
            make.left.mas_equalTo(jobExperience.mas_right).mas_offset(10);
            make.width.mas_equalTo(jobExperience.mas_width);
            make.height.mas_equalTo(jobExperience.mas_height);
        }];
        [otherExperience mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(jobExperience);
            make.left.mas_equalTo(workExperience.mas_right).mas_offset(10);
            make.width.mas_equalTo(jobExperience.mas_width);
            make.height.mas_equalTo(jobExperience.mas_height);
        }];
    }
    return _mid;
}

-(UITextField *)titleText{
    if (!_titleText) {
        _titleText = [[UITextField alloc]init];
        _titleText.placeholder = @"标题";
        _titleText.backgroundColor = [UIColor whiteColor];
    }
    return _titleText;
}

-(UITextView *)experienceText{
    if (!_experienceText) {
        _experienceText = [[UITextView alloc]init];
        _experienceText.backgroundColor = [UIColor whiteColor];
        _experienceText.delegate = self;
        _experienceText.text = @"写下对评价对象的认识和认可度\r长度在1-500字之间\r可以为大家提供参考";
        _experienceText.textColor =[UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1];
    }
    return _experienceText;
}
#pragma mark - TextViewDelegate

-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"写下对评价对象的认识和认可度\r长度在1-500字之间\r可以为大家提供参考"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    [textView becomeFirstResponder];
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"写下对评价对象的认识和认可度\r长度在1-500字之间\r可以为大家提供参考";
        textView.textColor = [UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1];
        textView.font = [UIFont systemFontOfSize:15];
    }
}

@end
