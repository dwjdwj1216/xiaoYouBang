//
//  CompanyListHelper.m
//  TLChat
//
//  Created by 戴王炯 on 4/26/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyListHelper.h"
#import "TLMenuItem.h"
@implementation CompanyListHelper
- (id) init
{
    if (self = [super init]) {
        self.CompanyListData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    TLMenuItem *item1 = TLCreateMenuItem(@"阿里", @"阿里巴巴");
    TLMenuItem *item2 = TLCreateMenuItem(@"百度", @"百度");
    TLMenuItem *item3 = TLCreateMenuItem(@"腾讯", @"腾讯");
    TLMenuItem *item4 = TLCreateMenuItem(@"新浪", @"新浪");
    TLMenuItem *item5 = TLCreateMenuItem(@"华为", @"华为");
    TLMenuItem *item6 = TLCreateMenuItem(@"小米", @"小米");
    TLMenuItem *item7 = TLCreateMenuItem(@"土豆", @"土豆");
    TLMenuItem *item8 = TLCreateMenuItem(@"金山", @"金山");
    TLMenuItem *item9 = TLCreateMenuItem(@"360", @"360");
    [self.CompanyListData addObjectsFromArray:@[@[item1,item2,item3,item4,item5,item6,item7,item8,item9]]];
    
}
@end
