//
//  DetailBaseViewController.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//

#import "DetailBaseViewController.h"
#import "CommentBar.h"
#import "UIView+CLKeyboardOffsetView.h"
@interface DetailBaseViewController()

@property (nonatomic, strong) UIView *footer;
@property (nonatomic, strong) UITextView *content;
@property (nonatomic, strong) UIButton *reply;
@property (nonatomic, strong) CommentBar *commentBar;
@end

@implementation DetailBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"帖子详情"];
    [self.view addSubview:self.detailTVC.tableView];
    [self addChildViewController:self.detailTVC];
    [self.view addSubview:self.footer];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [tap setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tap];
    [self.view openKeyboardOffsetView];

}

-(void)viewWillAppear:(BOOL)animated{
    [self.view openKeyboardOffsetView];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.view closeKeyboardOffsetView];
    [self.content resignFirstResponder];
}

-(void)dismissKeyboard {
    [self.content resignFirstResponder];
    
}

#pragma mark - Public Methods -

- (void)keyboardWillHide:(NSNotification *)notification
{

    [self.footer mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view);
    }];
    [self.view layoutIfNeeded];
}

- (void)keyboardFrameWillChange:(NSNotification *)notification
{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    [self.footer mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).mas_offset(-keyboardFrame.size.height);
    }];
    [self.view layoutIfNeeded];
    [self.detailTVC.tableView scrollToBottomWithAnimation:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Delegate -

-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"写回应"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    [textView becomeFirstResponder];
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"写回应";
        textView.textColor = [UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1];
        textView.font = [UIFont systemFontOfSize:15];
    }
}
#pragma mark - Getter

- (CommentBar *)commentBar
{
    if (_commentBar == nil) {
        _commentBar = [[CommentBar alloc] init];
    }
    return _commentBar;
}

-(UITextView *)content{
    if (!_content) {
        _content = [[UITextView alloc]init];
        [_content setFont:[UIFont systemFontOfSize:16.0f]];
        [_content setReturnKeyType:UIReturnKeySend];
        [_content.layer setMasksToBounds:YES];
        [_content.layer setBorderWidth:BORDER_WIDTH_1PX];
        [_content.layer setBorderColor:[UIColor grayColor].CGColor];
        [_content.layer setCornerRadius:4.0f];
        [_content setDelegate:self];
        _content.text = @"写回应";
        _content.returnKeyType = UIReturnKeyDone;

        _content.textColor =[UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1];
    }
    return _content;
}

-(UIButton *)reply{
    if (!_reply) {
        _reply = [[UIButton alloc]init];
        [_reply setTitle:@"回复" forState:UIControlStateNormal];
        [_reply setTitleColor:[UIColor colorWithRed:61.0/255.0 green:190.0/255.0 blue:94.0/255.0 alpha:1] forState:UIControlStateNormal];
    }
    return _reply;
}

- (DetailViewController *)detailTVC
{
    if (_detailTVC == nil) {
        _detailTVC = [[DetailViewController alloc] init];
    }
    return _detailTVC;
}

-(UIView *)footer{
    if (!_footer) {
        _footer = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT_SCREEN-50, WIDTH_SCREEN, 50)];
        [_footer setBackgroundColor:[UIColor whiteColor]];
        [_footer addSubview:self.content];
        [_footer addSubview:self.reply];
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_footer).mas_offset(7.5);
            make.left.mas_equalTo(_footer).mas_offset(7.5);
            make.width.mas_equalTo(307);
            make.height.mas_equalTo(35);
        }];
        [self.reply mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.content);
            make.left.mas_equalTo(self.content.mas_right).mas_offset(10);
        }];
    }
    return _footer;
}

@end
