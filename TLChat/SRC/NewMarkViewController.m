//
//  NewMarkViewController.m
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "NewMarkViewController.h"
@interface NewMarkViewController ()

@property (nonatomic, strong) UIView *header;

@property (nonatomic, strong) UIView *mid;

@property (nonatomic, strong) UITextView *markText;

@property (nonatomic, strong) UILabel *score;

@property (nonatomic, strong) StarRatingView *starRatingView;

@end

@implementation NewMarkViewController

-(void)loadView{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)];
    self.view.backgroundColor = [UIColor colorTableViewBG];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"发布评价"];
    [self.markText becomeFirstResponder];
    [self setBorderWithView:self.header top:NO left:NO bottom:YES right:NO borderColor: [UIColor colorDefaultBlack] borderWidth:2];
    [self.view addSubview:self.header];
    [self.view addSubview:self.mid];
    [self.view addSubview:self.markText];
    [self.view addSubview:self.starRatingView];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}

#pragma mark - Event Response
- (void)rightBarButtonDown:(UIBarButtonItem *)sender
{
    
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
-(StarRatingView *)starRatingView{
    if (!_starRatingView) {
        _starRatingView =[[StarRatingView alloc]initWithFrame:CGRectMake(128, 153, 105.5, 16) numberOfStar:5];
        _starRatingView.delegate = self;
    }
    return _starRatingView;
}

-(UILabel *)score{
    if (!_score) {
        _score = [[UILabel alloc]init];
        _score.text = @"10";
    }
    return _score;
}

-(UIView *)mid{
    if (!_mid) {
        _mid = [[UIView alloc]initWithFrame:CGRectMake(0, 99.5, 375, 98)];
        [_mid setBackgroundColor:[UIColor whiteColor]];
        UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"article"]];
        [icon.layer setCornerRadius:5.0];
        UILabel *title = [[UILabel alloc]init];
        title.textColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];
        title.font = [UIFont systemFontOfSize:16];
        title.text = @"评分：";
        [_mid addSubview:icon];
        [_mid addSubview:title];
        [_mid addSubview:self.score];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_mid).mas_offset(16.5);
            make.left.mas_equalTo(_mid).mas_offset(30.5);
            make.width.and.height.mas_equalTo(63.5);
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(icon.mas_top).mas_offset(11.5);
            make.left.mas_equalTo(icon.mas_right).mas_offset(32);
        }];
        [self.score mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(title.mas_top);
            make.left.mas_equalTo(title.mas_right);
        }];
    }
    return _mid;
}

-(UIView *)header{
    if (!_header) {
        _header = [[UIView alloc]initWithFrame:CGRectMake(0, 64.5, 375, 35)];
        [_header setBackgroundColor:[UIColor whiteColor]];
        UILabel *title = [[UILabel alloc]init];
        [title setFont:[UIFont systemFontOfSize:15]];
        [title setTextColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1]];
        title.text = @"评价对象";
        UILabel *companyName = [[UILabel alloc]init];
        [companyName setFont:[UIFont systemFontOfSize:15]];
        [companyName setTextColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1]];
        companyName.text = self.companyName;
        [_header addSubview:title];
        [_header addSubview:companyName];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_header).mas_offset(10);
            make.left.mas_equalTo(_header).mas_offset(30);
        }];
        [companyName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(title);
            make.left.mas_equalTo(title).mas_offset(113);
        }];
    }
    return _header;
}

-(UITextView *)markText{
    if (!_markText) {
        _markText = [[UITextView alloc]initWithFrame:CGRectMake(0, 218, 375, 197.5)];
        _markText.backgroundColor = [UIColor whiteColor];
        _markText.delegate = self;
        _markText.text = @"写下对评价对象的认识和认可度\r长度在1-500字之间\r可以为大家提供参考";
        _markText.textColor =[UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1];
    }
    return _markText;
}

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


-(void)starRatingView:(StarRatingView *)view score:(float)score
{
    self.score.text = [NSString stringWithFormat:@"%0.2f",score * 10 ];
    //NSLog(@"%@",self.score.text);
}

@end
