//
//  TieziHelper.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TieziHelper.h"
#import "TLSettingItem.h"
@implementation TieziHelper
- (id) init
{
    if (self = [super init]) {
        _tieziData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    TLSettingItem *item1 = TLCreateSettingItem(@"架构师如何求职");
    item1.subTitle = @"架构师";
    TLSettingItem *item2 = TLCreateSettingItem(@"请问体测影响毕业吗");
    item2.subTitle = @"浙江大学";
    [self.tieziData addObjectsFromArray:@[@[item1,item2]]];
}
@end
