//
//  NewTieziViewController.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "NewTieziViewController.h"
@interface NewTieziViewController()

@property (nonatomic, strong) UITextView *contentText;

@property (nonatomic, strong) UITextField *titleText;

@end
@implementation NewTieziViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"发帖"];
    [self.titleText becomeFirstResponder];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    [self.view addSubview:self.contentText];
    [self.view addSubview:self.titleText];
    [self p_addMasonry];
    [self setBorderWithView:self.titleText top:NO left:NO bottom:YES right:NO borderColor:[UIColor colorDefaultBlack] borderWidth:1.5];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:66.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:1]];
    
}
-(void)p_addMasonry{
    [self.titleText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(WIDTH_SCREEN);
        make.height.mas_equalTo(35);
    }];
    [self.contentText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleText.mas_bottom).mas_offset(1);
        make.left.mas_equalTo(self.titleText);
        make.width.mas_equalTo(WIDTH_SCREEN);
        make.height.mas_equalTo(HEIGHT_SCREEN-32);
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

-(UITextField *)titleText{
    if (!_titleText) {
        _titleText = [[UITextField alloc]init];
        _titleText.placeholder = @"标题";
        _titleText.backgroundColor = [UIColor whiteColor];
        _titleText.tag = 0;
    }
    return _titleText;
}

-(UITextView *)contentText{
    if (!_contentText) {
        _contentText = [[UITextView alloc]init];
        _contentText.backgroundColor = [UIColor whiteColor];
        //_contentText.contentSize = CGSizeMake(WIDTH_SCREEN, HEIGHT_SCREEN);
        _contentText.delegate = self;
        _contentText.text = @"请输入帖子正文";
        _contentText.textColor =[UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1];
    }
    return _contentText;
}
#pragma mark - TextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [textField becomeFirstResponder];
}

#pragma mark - TextViewDelegate

-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"请输入帖子正文"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    [textView becomeFirstResponder];
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"请输入帖子正文";
        textView.textColor = [UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1];
        textView.font = [UIFont systemFontOfSize:15];
    }
}
@end
