//
//  TLMineHeaderView.h
//  TLChat
//
//  Created by 戴王炯 on 4/22/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLUser.h"
#import "UIViewLinkmanTouch.h"
@interface TLMineHeaderView : UIView

@property (nonatomic, strong) TLUser *user;

@property (nonatomic, strong) UIViewLinkmanTouch *header;

@property (nonatomic, strong) UIViewLinkmanTouch *left;

@property (nonatomic, strong) UIViewLinkmanTouch *right;

@property (nonatomic, strong) UILabel *moreLabel;
-(TLMineHeaderView *)init;
@end
