//
//  AttentionHelper.m
//  TLChat
//
//  Created by 戴王炯 on 4/30/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "AttentionHelper.h"
#import "TLSettingItem.h"
@implementation AttentionHelper
- (id) init
{
    if (self = [super init]) {
        _attentionMenuData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    TLSettingItem *item1 = TLCreateSettingItem(@"阿里巴巴");
    item1.subTitle = @"已关注";
    TLSettingItem *item2 = TLCreateSettingItem(@"百度");
    item2.subTitle = @"已关注";
    TLSettingItem *item3 = TLCreateSettingItem(@"腾讯");
    item3.subTitle = @"已关注";
    TLSettingItem *item4 = TLCreateSettingItem(@"新浪");
    item4.subTitle = @"已关注";
    TLSettingItem *item5 = TLCreateSettingItem(@"华为");
    item5.subTitle = @"已关注";
    TLSettingItem *item6 = TLCreateSettingItem(@"小米");
    item6.subTitle = @"已关注";
    TLSettingItem *item7 = TLCreateSettingItem(@"金山");
    item7.subTitle = @"已关注";
    TLSettingItem *item8 = TLCreateSettingItem(@"土豆");
    item8.subTitle = @"已关注";
    [self.attentionMenuData addObjectsFromArray:@[@[item1,item2,item3,item4,item5,item6,item7,item8]]];
}

@end
