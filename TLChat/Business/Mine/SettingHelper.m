//
//  SettingHelper.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "SettingHelper.h"
#import "TLSettingItem.h"

@implementation SettingHelper
- (id) init
{
    if (self = [super init]) {
        _settingData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    TLSettingItem *item1 = TLCreateSettingItem(@"帐号管理");
    item1.subTitle = @"timok";
    TLSettingItem *item2 = TLCreateSettingItem(@"消息通知");
    item2.subTitle = @"振动";
    TLSettingItem *item3 = TLCreateSettingItem(@"清空缓存");
    item3.subTitle = @"当前缓存20MB";
    TLSettingItem *item4 = TLCreateSettingItem(@"帮助与反馈");
    TLSettingItem *item5 = TLCreateSettingItem(@"关于我们");
    TLSettingItem *item6 = TLCreateSettingItem(@"退出登录");
    [self.settingData addObjectsFromArray:@[@[item1],@[item2,item3,item4,item5],@[item6]]];
}
@end
