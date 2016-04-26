//
//  TLMineHelper.m
//  TLChat
//
//  Created by 李伯坤 on 16/2/6.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "TLMineHelper.h"
#import "TLMenuItem.h"

@implementation TLMineHelper

- (id) init
{
    if (self = [super init]) {
        self.mineMenuData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}


- (void) p_initTestData
{
    //TLMenuItem *item0 = TLCreateMenuItem(nil, nil);
    //TLMenuItem *item5 = TLCreateMenuItem(nil, nil);
    TLMenuItem *item1 = TLCreateMenuItem(@"dongtai_icon", @"好友动态");
    TLMenuItem *item2 = TLCreateMenuItem(@"tiezi_icon", @"我的帖子");
    TLMenuItem *item3 = TLCreateMenuItem(@"mail_icon", @"消息通知");
    TLMenuItem *item4 = TLCreateMenuItem(@"setting_icon", @"设置");
    [self.mineMenuData addObjectsFromArray:@[@[item1], @[item2], @[item3],@[item4]]];
}

@end
