//
//  CircleHelper.m
//  TLChat
//
//  Created by 戴王炯 on 4/30/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CircleHelper.h"
#import "CircleItem.h"

@implementation CircleHelper

- (id) init
{
    if (self = [super init]) {
        self.listDate = [[NSMutableArray alloc] init];
        self.attentionList = [[NSMutableArray alloc]init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    CircleItem *item1 = [CircleItem createMenuWithIconPath:@"avatar0" name:@"落木" title:@"十年架构总结--结构师的必经之路" subTitle:@"架构师必须又实战的场景，如果没有实战的机会，那是否能成为真正的构架师仍旧是一个问题，毕竟没人会要一个只是纸上谈兵的架构师" time:@"刚刚" comNum:@"26"];
    CircleItem *item2 = [CircleItem createMenuWithIconPath:@"avatar0" name:@"落木" title:@"十年架构总结--结构师的必经之路" subTitle:@"架构师必须又实战的场景，如果没有实战的机会，那是否能成为真正的构架师仍旧是一个问题，毕竟没人会要一个只是纸上谈兵的架构师" time:@"刚刚" comNum:@"26"];
    CircleItem *item3 = [CircleItem createMenuWithIconPath:@"avatar0" name:@"落木" title:@"十年架构总结--结构师的必经之路" subTitle:@"架构师必须又实战的场景，如果没有实战的机会，那是否能成为真正的构架师仍旧是一个问题，毕竟没人会要一个只是纸上谈兵的架构师" time:@"刚刚" comNum:@"26"];
    [self.listDate addObjectsFromArray:@[@[item1,item2,item3]]];
    self.title = @"关注架构之路，交流架构经验";
    self.isJoined = YES;
    self.number = @"512";
}
@end
