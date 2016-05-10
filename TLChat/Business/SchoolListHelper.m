//
//  SchoolListHelper.m
//  TLChat
//
//  Created by 戴王炯 on 4/26/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "SchoolListHelper.h"
#import "TLMenuItem.h"
@implementation SchoolListHelper
- (id) init
{
    if (self = [super init]) {
        self.SchoolListData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    TLMenuItem *item1 = TLCreateMenuItem(@"清华", @"清华大学");
    TLMenuItem *item2 = TLCreateMenuItem(@"北大", @"北京大学");
    TLMenuItem *item3 = TLCreateMenuItem(@"厦大", @"厦门大学");
    TLMenuItem *item4 = TLCreateMenuItem(@"同济", @"同济大学");
    TLMenuItem *item5 = TLCreateMenuItem(@"复旦", @"复旦大学");
    TLMenuItem *item6 = TLCreateMenuItem(@"浙大", @"浙江大学");
    TLMenuItem *item7 = TLCreateMenuItem(@"上海交大", @"上海交通大学");
    TLMenuItem *item8 = TLCreateMenuItem(@"上海大", @"上海大学");
    TLMenuItem *item9 = TLCreateMenuItem(@"杭电", @"杭州电子科技大学");
    [self.SchoolListData addObjectsFromArray:@[@[item1,item2,item3,item4,item5,item6,item7,item8,item9]]];
    
}
@end
