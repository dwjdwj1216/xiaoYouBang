//
//  ListHelper.m
//  TLChat
//
//  Created by 戴王炯 on 4/30/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ListHelper.h"
#import "TLMenuItem.h"
static ListHelper *listHelper = nil;

@implementation ListHelper
+ (ListHelper *)sharedListHelper
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        listHelper = [[ListHelper alloc] init];
    });
    return listHelper;
}

- (id)init
{
    if (self = [super init]) {
        _data = [[NSMutableArray alloc]init];
        TLMenuItem *item1 = TLCreateMenuItem(@"阿里", @"阿里巴巴");
        TLMenuItem *item2 = TLCreateMenuItem(@"百度", @"百度");
        TLMenuItem *item3 = TLCreateMenuItem(@"腾讯", @"腾讯");
        TLMenuItem *item4 = TLCreateMenuItem(@"新浪", @"新浪");
        TLMenuItem *item5 = TLCreateMenuItem(@"华为", @"华为");
        TLMenuItem *item6 = TLCreateMenuItem(@"小米", @"小米");
        TLMenuItem *item7 = TLCreateMenuItem(@"土豆", @"土豆");
        TLMenuItem *item8 = TLCreateMenuItem(@"金山", @"金山");
        TLMenuItem *item9 = TLCreateMenuItem(@"360", @"360");
        TLMenuItem *item10 = TLCreateMenuItem(@"清华", @"清华大学");
        TLMenuItem *item11 = TLCreateMenuItem(@"北大", @"北京大学");
        TLMenuItem *item12 = TLCreateMenuItem(@"厦大", @"厦门大学");
        TLMenuItem *item13 = TLCreateMenuItem(@"同济", @"同济大学");
        TLMenuItem *item14 = TLCreateMenuItem(@"复旦", @"复旦大学");
        TLMenuItem *item15 = TLCreateMenuItem(@"浙大", @"浙江大学");
        TLMenuItem *item16 = TLCreateMenuItem(@"上海交大", @"上海交通大学");
        TLMenuItem *item17 = TLCreateMenuItem(@"上海大", @"上海大学");
        TLMenuItem *item18 = TLCreateMenuItem(@"杭电", @"杭州电子科技大学");
        [self.data addObjectsFromArray:@[item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item12,item13,item14,item15,item16,item17,item18]];
    }
    return self;
}
@end
