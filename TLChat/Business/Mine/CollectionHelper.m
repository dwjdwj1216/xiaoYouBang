//
//  CollectionHelper.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CollectionHelper.h"
#import "TLSettingItem.h"
@implementation CollectionHelper
- (id) init
{
    if (self = [super init]) {
        _collectionMenuData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    TLSettingItem *item1 = TLCreateSettingItem(@"我的阿里求职路");
    item1.subTitle = @"职场分享";
    TLSettingItem *item2 = TLCreateSettingItem(@"十年架构总结");
    item2.subTitle = @"圈子";
    [self.collectionMenuData addObjectsFromArray:@[@[item1,item2]]];
}
@end
