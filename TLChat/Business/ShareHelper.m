//
//  ShareHelper.m
//  TLChat
//
//  Created by 戴王炯 on 4/24/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ShareHelper.h"
#import "UserInfoItem.h"
@implementation ShareHelper

- (id) init
{
    if (self = [super init]) {
        self.ShareListData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    UserInfoItem *item1 = [UserInfoItem createMenuWithIconPath:@"avatar" name:@"Mbiao" fromAndType:@"杭州/北京 | 计算机软件"];
    [self.ShareListData addObjectsFromArray:@[@[item1]]];
    
}

@end
