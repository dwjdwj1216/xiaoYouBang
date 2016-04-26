//
//  TLDiscoverHelper.m
//  TLChat
//
//  Created by 李伯坤 on 16/2/6.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "TLDiscoverHelper.h"
#import "TLMenuItem.h"

@implementation TLDiscoverHelper

- (id) init
{
    if (self = [super init]) {
        self.discoverMenuData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    TLMenuItem *item1 = TLCreateMenuItem(@"cell_0", @"架构师");
    item1.showRightRedPoint = YES;
    TLMenuItem *item2 = TLCreateMenuItem(@"cell_1", @"iOS工程师");
    item2.showRightRedPoint = YES;
    TLMenuItem *item3 = TLCreateMenuItem(@"cell_2", @"运维工程师");
    item3.showRightRedPoint = YES;
    TLMenuItem *item4 = TLCreateMenuItem(@"cell_3", @"杭州电子科技大学");
    item4.showRightRedPoint = YES;
    TLMenuItem *item5 = TLCreateMenuItem(@"cell_4", @"浙江大学");
    item5.showRightRedPoint = YES;
    TLMenuItem *item6 = TLCreateMenuItem(@"cell_5", @"浙江工业大学");
    item6.showRightRedPoint = YES;
    TLMenuItem *item7 = TLCreateMenuItem(@"cell_6", @"健身");
    item7.showRightRedPoint = YES;
    TLMenuItem *item8 = TLCreateMenuItem(@"cell_7", @"摄影");
    item8.showRightRedPoint = YES;
    [self.discoverMenuData addObjectsFromArray:@[@[item1,item2,item3], @[item4,item5,item6], @[item7, item8]]];
}

@end
