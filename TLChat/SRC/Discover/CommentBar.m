//
//  CommentBar.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CommentBar.h"
@interface CommentBar ()

@property (nonatomic, strong) UITextView *content;
@property (nonatomic, strong) UIButton *reply;

@end
@implementation CommentBar
- (id)init
{
    if (self = [super init]) {
        [self setBackgroundColor:[UIColor colorChatBar]];
        [self addSubview:self.content];
        [self addSubview:self.reply];
        [self p_addMasonry];

    }
    return self;
}
- (void)p_addMasonry
{
    
    [self.reply mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.right.mas_equalTo(self.mas_right);
    }];
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self).mas_offset(4);
        make.height.mas_equalTo(35);
    }];
    
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
@end
