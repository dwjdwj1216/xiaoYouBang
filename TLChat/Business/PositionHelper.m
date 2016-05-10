//
//  PositionHelper.m
//  TLChat
//
//  Created by 戴王炯 on 5/2/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "PositionHelper.h"
#import "TLSettingItem.h"
@implementation PositionHelper
- (id) init
{
    if (self = [super init]) {
        _positionData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    TLSettingItem *item1 = TLCreateSettingItem(@"测试开发工程师");
    TLSettingItem *item2 = TLCreateSettingItem(@"研发工程师JAVA");
    TLSettingItem *item3 = TLCreateSettingItem(@"研发工程师C/C++");
    TLSettingItem *item4 = TLCreateSettingItem(@"算法工程师");
    TLSettingItem *item5 = TLCreateSettingItem(@"前端开发工程师");
    TLSettingItem *item6 = TLCreateSettingItem(@"客户端开发工程师");
    TLSettingItem *item7 = TLCreateSettingItem(@"平台型产品经理");
    TLSettingItem *item8 = TLCreateSettingItem(@"交互设计师");
    TLSettingItem *item9 = TLCreateSettingItem(@"数据研发工程师");
    TLSettingItem *item10 = TLCreateSettingItem(@"数据分析师");
    TLSettingItem *item11 = TLCreateSettingItem(@"视觉设计师");
    TLSettingItem *item12 = TLCreateSettingItem(@"地图数据产品经理");
    TLSettingItem *item13 = TLCreateSettingItem(@"产品经理（游戏方向）");
    TLSettingItem *item14 = TLCreateSettingItem(@"游戏运营专员");
    TLSettingItem *item15 = TLCreateSettingItem(@"安全工程师");
    TLSettingItem *item16 = TLCreateSettingItem(@"系统工程师");
    TLSettingItem *item17 = TLCreateSettingItem(@"基础平台研发工程师");
    TLSettingItem *item18 = TLCreateSettingItem(@"工艺工程师");
    TLSettingItem *item19 = TLCreateSettingItem(@"游戏内容运营");
    
    [self.positionData addObjectsFromArray:@[@[item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item12,item13,item14,item15,item16,item17,item18,item19]]];
}

@end
