//
//  MessageNotifyHelper.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "MessageNotifyHelper.h"
#import "TLSettingItem.h"
@implementation MessageNotifyHelper
- (id) init
{
    if (self = [super init]) {
        _messageData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    TLSettingItem *item1 = TLCreateSettingItem(@"阿里17年应届实习招聘开始");
    item1.subTitle = @"4-20";
    TLSettingItem *item2 = TLCreateSettingItem(@"IT类大型实习生招聘会");
    item2.subTitle = @"4-18";
    [self.messageData addObjectsFromArray:@[@[item1,item2]]];
}
@end
