//
//  TLJobHelper.m
//  TLChat
//
//  Created by 戴王炯 on 4/22/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLJobHelper.h"
#import "TLMenuItem.h"
@implementation TLJobHelper

- (id) init
{
    if (self = [super init]) {
        self.JobMenuData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    TLMenuItem *item0 = TLCreateMenuItem(nil, nil);
    TLMenuItem *item1 = TLCreateMenuItem(@"qiye_icon", @"企业");
    item1.showRightRedPoint = YES;
    TLMenuItem *item2 = TLCreateMenuItem(@"zhiwei_icon", @"职位");
    TLMenuItem *item3 = TLCreateMenuItem(@"xuexiao_icon", @"学校");
    TLMenuItem *item4 = TLCreateMenuItem(@"zhuanye_icon", @"专业");
    [self.JobMenuData addObjectsFromArray:@[@[item0],@[item1], @[item2], @[item3], @[item4]]];
}


@end
